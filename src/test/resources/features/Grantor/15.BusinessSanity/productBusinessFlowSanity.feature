@productBusinessFlowSanity @product
Feature: Validate sanity testing of Complete Business Flow

  @72335 @activationOfFocusArea
  Scenario: Validate the activation of Focus Area by User - Admin/EXE/PM and the status is Active
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add Files" in flex table with id "---focusarea:-:FocusAreaFilesTableId---"
    When I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @72340 @activateKPI
  Scenario: Validate the activation of KPI and the status changes to Active
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @72337 @activationOFFundingSource
  Scenario: Validate the activation of Funding Source HappyPath and the status is Active
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @72341 @programActivation
  Scenario: Validate the activation of Internal Program and the status changes to Active
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    And I navigate to "Attachments" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload the attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts" from computer
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @65077 @publishingCompetitiveAnnouncementCA
  Scenario: Validate the activation of Competitive Announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"

  @72342 @publishingDirectedAnnouncement
  Scenario: Validate the activation of Directed Announcement and the status changes to published and is green
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Draft"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - Draft"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunities" panel
    And I click on "View" icon for "Record Id" inside flex table with id "ActiveFundingOpportunities" without waiting for record
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Directed Announcements - Draft"
    And I perform quick search for "Record id" in "ActiveFundingOpportunities" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @72343 @publishingFormulaAnnouncement
  Scenario: Validate the activation of Formula Announcement and the status changes to published
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Draft"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "SelectAnnFundingAccounts"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "ActiveFundingOpportunitiesFormula" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside table
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    When I close "Review Form" modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - Draft"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @72344 @preApplicationSubmittedToGrantor
  Scenario: Validate once the Grantor accepts the submitted pre-application then the changes status to Accepted
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---announcement:-:competitiveTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside flex table with id "---announcement:-:competitiveTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnId"
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    When I upload attachment "Attachment.pdf" of type "Other" from computer
    And I get the "EGMS ID"
    And I save the field containing "EGMS ID" as "preappID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:preappID}" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:preappID}" inside table
    When I click on "Accept" in the page details
    Then I see status in Progress-bar is "Accepted" and is "Green"

  @72345 @submitApplication
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
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
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
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
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:SPI Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I see status in Progress-bar is "Submitted" and is "Green"

  @72346 @applicationReviewHappyPath
  Scenario Outline: Validate the complete review process for an application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I refresh the page
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @72347 @negotiationComplete
  Scenario: Validate once the Negotiation Request is completed then the record owner can view the record under Completed Negotiations
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"

  @38224 @awardHappyPathFromFDM
  Scenario Outline: Validate  the activation of subaward from FDM happy path and the status changes to Activated
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:SPI Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "5" seconds
    And I click on submit review
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @72348 @awardHappyPathStandAlone
  Scenario Outline: Validate the activation of subaward Happy path stand alone and status changes to Activated | Validate subaward Happy path stand alone
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I refresh the page
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:SPI Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "5" seconds
    And I click on submit review
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Execution Award} | {SavedValue:Automation Runtime Execution Award} |

  @72360 @activeRiskAssessment
  Scenario: Validate the Activation of Risk Assessment and the status changes to Active
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
    And I enter the following values into flex table with id "flexGridRiskAssessmentApproverRoles" by clicking "New" :
      | Name                     | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "flexGridRiskAssessmentApproverRoles" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "flexGridRiskAssessmentApproverRoles" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "5" seconds
    And I click on submit review
    When I re-login to "As a Grantor" app as "DynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" without waiting for record
    Then I see status in Progress-bar is "Active" and is "Green"

  @72361 @activeOrgRiskAssessment
  Scenario: Validate the Activation of Org Risk Assessment and the status changes to Active
    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---" without waiting for record
    And I navigate to "Risk Assessment" sub tab
    When I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    And I click on top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Active" in "---orgRiskAssessment:-:orgRiskAssessmentTableId---" panel
    When I click on "View" icon for "Active" inside flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---" without waiting for record
    Then I see status in Progress-bar is "Active" and is "Green"

  @72349 @adhocReimbursementHappyPath
  Scenario Outline: Validate the Reimbursement Payment Request happy path and the status changes to 'Paid'
    Given I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 0                 | 0               | 0                        | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 10                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name                     | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:EGMSID}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @72350 @adhocAdvanceHappyPath
  Scenario Outline: Validate the Advance Payment Request happy path and the status changes to 'Paid'
    Given I activated standalone subaward "Automation Runtime Award" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    When I upload attachment "Attachment.pdf" of type "Invoice" from computer
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:grantorAwardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:advanceFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name                     | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:EGMSID}" modal by clicking the top right x button
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter "Adhoc Reimbursement Creation" values from "PaymentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 0                        | 10         | 10             |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name                     | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:EGMSID}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime Award} | {SavedValue:Automation Runtime Award} |

  @72351 @scheduledReimbursementPaymentRequestHappyPath
  Scenario Outline: Validate the Scheduled Payment Request happy path and the status changes to 'Paid' and is green
    Given I activated standalone subaward "Automation Runtime award" with properties "default"
    Given I delete the record "<Award Name>" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "<Award Name>" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 10         | 1        | Feet        | 10                | 0               | 200                      | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    When I upload attachment "Attachment.pdf" of type "Invoice" from computer
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:grantorGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:grantorAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on "View" icon for "Submitted to Grantor" inside flex table with id "---paymentRequest:-:grantorPaymentRequestTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    When I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 20                    |
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name                     | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:EGMSID}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "Green"
    Examples:
      | Award Name                            | Grant Name                            |
      | {SavedValue:Automation Runtime award} | {SavedValue:Automation Runtime award} |

  @72352 @progressReportHappyPath
  Scenario: Validate once the Progress Report approval process is completed then the status changes to approved
    Given I activated standalone subaward "Automation Runtime award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---progressReport:-:approversTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"

  @72353 @siteVisitAcceptAndClose
  Scenario Outline: Validate once the Award level Site Visit is clicked on Accept and Close butted then sttaus changes to closed
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "GrantorActiveGrantsgrid" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "GrantorActiveGrantsgrid"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name                      | Description                 |
      | Program Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username}  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
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
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
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
      | Title                               | Description            | Status      | Due Date | Assigned To               |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click on "View" icon for "<Site Visit Name>" inside table without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"
    Examples:
      | Site Visit Name                                  |
      | {SavedValue:Automation Runtime Award Site Visit} |

  @72354 @deskReviewAcceptAndClose
  Scenario: Validate once the Award level Desk Review is clicked on Accept and Close butted then status changes to closed
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "Edit" :
      | Role             | Name                      | Description                 |
      | Program Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username}  | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    When I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To               |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"

  @72355 @siteVisitAcceptAndCloseOrgLevel
  Scenario: Validate once the Org Level Site Visit is clicked on Accept and Close butted then status changes to closed
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
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
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
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
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:SPI Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name                     | Description                 |
      | Program Approver | {SavedValue:FO Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:PM Username} | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateApplicationId---"
    When I click "Add" after selection of "{SavedValue:Automation Runtime Announcement for Site Visit}" in the table "---orgLevelSiteVisits:-:selectApplicationId---"
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
    And I click on "View" icon for "Record Id" inside flex table with id "SiteVisit"
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
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "SiteVisit" panel
    And I click on "View" icon for "Record Id" inside flex table with id "SiteVisit"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To               |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"

  @72357 @deskReviewAcceptAndCloseOrgLevel
  Scenario: Validate once the Org level Desk Review is clicked on Accept and Close butted then status changes to closed
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name                     | Description                 |
      | Program Approver | {SavedValue:FO Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:PM Username} | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI Username}" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---orgLevelDeskReview:-:selectAwardId---"
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
      | Title                               | Description            | Status      | Due Date | Assigned To               |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To               |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"

  @72358 @activationOfBudgetPeriodAmendmentRequest
  Scenario: Validate the Budget period amendment activation
    Given I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "{SavedValue:updatedBudgetPeriodDate}" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "Edit" :
      | Role             | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I get the "EGMS ID"
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---amendment:-:amendmentRequestTableId---" without waiting for record
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Amended" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I see status in Progress-bar is "Amended" and is "Green"

  @72359 @completeCloseout
  Scenario: Validate the Closeout is submitted for approval and the status changes to Submitted for Approval
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 500        | 1        | Feet        | 0                 | 0               | 0                        | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name                     | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:EGMSID}" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "DynamicUser" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:CloseoutID}" in "ProjectPeriodCloseoutGrantor" panel
    And I click on "View" icon for "{SavedValue:CloseoutID}" inside flex table with id "ProjectPeriodCloseoutGrantor"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"