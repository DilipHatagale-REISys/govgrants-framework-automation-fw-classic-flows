@announcement @commonAnnouncements @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all common scenarios in the  Announcement tab

  Background: Create Announcement
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"

  @34461 @52398 @70357 @@52399 @52397 @announcementCreationFA @smoke @annn
  Scenario: Creation of an Announcement |To Verify that if user selects "Subrecipients Match Required"-yes then he can  enter "Subrecipient Match(%)" in the Subrecipient Match(%) field while creating Announcement
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements" in "---announcement:-:annoucementTableId---"
    When I perform quick search for "Record Id" in "---announcement:-:annoucementTableId---" panel
    Then I softly do not see values "Record Id" and "Announcement Name" inside table
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    When  I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Subrecipient Match (%)" as "10.00%"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Edit" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @33936 @announcementCreatedDeleteAccessToOwnerFA
  Scenario: Validate that owner can able to delete created status announcement
    When I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When  I click on "Delete" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I do not see value "Record id" for title "Announcement Name" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @34222 @52400 @70342 @70343 @37029 @52401 @73393 @52402 @52403 @52404 @createdAnnouncementEditionOnlyOwnerFA @annn
  Scenario: Validate that only owner can able to edit created status announcement | To verify user able to enter the description in the details field of overview tab while creating the Announcemennt
    When I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Financial Tab - Enter the Estimated Funding Amount.                                                                   |
      | Financial Tab - There should be no gap between the dates. Enter the correct Budget Periods Start Dates and End Dates. |
      | Financial Tab - Enter at least one Budget Period.                                                                     |
      | Overview Tab - Enter the Description.                                                                                 |
      | Overview Tab - You must invite at least one applicant before submitting this Announcement.                            |
      | Overview Tab - Provide the Application Due Date.                                                                      |
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section.                                    |
      | Responsibilities - At least one approver is required                                                                  |
    When I click on "Edit" in the page details
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Overview" sub tab
    Then I softly see field "Description" as "Automation test description"
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---announcement:-:contactTableId---"
    And I refresh the page
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---announcement:-:contactTableId---"
    When I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:contactTableId---" without waiting for record
    Then I softly do not see values "Record Id" and "{SavedValue:EXE Username}" inside table
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    Then I softly see that "SAN DIEGO ELECTRICAL TRAINING TRUST" has been added in flextable with Id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Then I softly see that "{SavedValue:fundingAccount}" has been added in flextable with Id "---announcement:-:fundingAccountsTableId---"
    When I click on "Remove" icon for "{SavedValue:fundingAccount}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    Then I do not see value "{SavedValue:fundingAccount}" for title "EGMS ID" inside table "---announcement:-:fundingAccountsTableId---"

  @52405 @announcementBudgetPeriodAdditionFA
  Scenario: Budget Period Addition to an Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 0          | 500      |
    Then I see that "BP01" has been added in flextable with Id "---announcement:-:budgetPeriodTableId---"

  @52406 @announcementBudgetPeriodDissociationFA
  Scenario: Validate the dissociation of Budget Period to the Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I click on "Remove" icon for "BP01" inside flex table with id "---announcement:-:budgetPeriodTableId---" without waiting for record
    Then I do not see value "BP01" for title "Budget Period Name" inside table "---announcement:-:budgetPeriodTableId---"

  @52407 @announcementFocusAreaAssociationFA
  Scenario: Validate the association of Focus Area to Announcement
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    Then I see that "Automation Permanent Focus Area2" has been added in flextable with Id "---announcement:-:AnnouncementServiceArea1TableId---"

  @34775 @announcementObjectiveAssociationFA
  Scenario: Validate the association of objective to the Announcement
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    Then I see that "Automation Permanent Objective2" has been added in flextable with Id "---announcement:-:objectivesTableId---"

  @52409 @announcementObjectiveDissociationFA
  Scenario: Validate the dissociation of objective to the Announcement
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I click on "Remove" icon for "Automation Permanent Objective2" inside flex table with id "---announcement:-:objectivesTableId---" without waiting for record
    Then I do not see value "Automation Permanent Objective2" for title "EGMS ID" inside table "---announcement:-:objectivesTableId---"

  @32410 @announcementAttachmentChecklistFA
  Scenario: Validate the attachment checklist of the announcement
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To | Status |
      | Automation test description | Mandatory | Award      | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---announcement:-:annChecklist---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    Then I see that "Active" has been added in flextable with Id "---announcement:-:annChecklist---"

  @52411 @announcementApproverSelectionFA
  Scenario: Validate the assignment of Approvers for the Announcement
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    Then I see that "{SavedValue:EXE Username}" has been added in flextable with Id "---announcement:-:approversTableId---"

  @34232 @announcementReviewerAssignmentFA @aa
  Scenario: Validate the assignment of Reviewer for the Announcement
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 20       | No                   |
    Then I see that "{SavedValue:FO Username}" has been added in flextable with Id "---announcement:-:reviewersTableId---"

  @52412 @announcementReviewerInitiationFA @aa 
  Scenario: Validate the Reviewer initiation for the Announcement
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    Then I see that "Sent for Review" has been added in flextable with Id "---announcement:-:reviewersTableId---"

  @52413 @announcementReviewCompleteFA @wip
  Scenario: Validate the review for the Announcement
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    When I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"

  @35003 @announcementAddAttachmentFA 
  Scenario: Validate the attachment for an Announcement
    Given I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---announcement:-:iframeIdAddFiles---"
    And I upload attachment "Attachment.pdf" of type "Funding Opportunity Announcement" from computer
    Then I softly see "Funding Opportunity Announcement" has been added in "Announcement Files" flex table

  @52414 @reviewStepsBeforeSubmitForApprovalFA
  Scenario: Validate the Review steps of Announcement before submit for Approval
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
#    And I pause execution for "2" seconds
#    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question2 | Written | 100       |
    And I pause execution for "2" seconds
    When I close "Review Form" modal by clicking the top right x button
    #When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question2 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question3 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    #When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    When I close "Review Form" modal by clicking the top right x button
    #When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I see the following messages in the page details :
      | There are no errors with the review step templates. |

  @45773 @announcementOtherNotAbleToDelete
  Scenario: Validate that other users are not able to delete created announcement
    When I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @45774 @announcementOtherNotAbleToEdit
  Scenario: Validate that other users are not able to Edit created announcement
    When I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Edit" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"