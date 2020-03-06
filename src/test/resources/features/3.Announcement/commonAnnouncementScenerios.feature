@announcement @commonAnnouncements @regression
Feature: Validate all common scenarios in the  Announcement tab

  Background: Create Announcement
    Given I delete the record "Automation Formula Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "EXE" user
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

  @34461 @70357 @announcementCreationFA @smoke
  Scenario: Creation of an Announcement |To Verify that if user selects "Subrecipients Match Required"-yes then he can  enter "Subrecipient Match(%)" in the Subrecipient Match(%) field while creating Announcement
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When  I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly see field "Subrecipient Match (%)" as "10.00%"

  @33936 @announcementCreatedDeleteAccessToOwnerFA
  Scenario: Validate that owner can able to delete created status announcement
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When  I click on "Delete" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I do not see value "Record id" for title "Announcement Name" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @52397 @createdAnnouncementDeletionByOtherUserFA
  Scenario Outline: Validate that other users are not able to delete created announcement
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Examples:
      | User |
      | PM   |

  @52398 @announcementCreateFormulaCheckUnderDraftDirectedListViewFA
  Scenario: Validate that Created Competitive announcement will not reflect under Draft Formula announcement list view
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Draft" in "---announcement:-:annoucementTableId---"
    When I perform quick search for "Record Id" in "---announcement:-:annoucementTableId---" panel
    Then I do not see values "Record Id" and "Announcement Name" inside table

  @52399 @announcementEditionByOtherUserFA
  Scenario Outline: Validate that other users are not able to edit created announcement
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Edit" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Examples:
      | User |
      | PM   |

  @52400 @70342 @70343 @createdAnnouncementEditionOnlyOwnerFA
  Scenario: Validate that only owner can able to edit created status announcement | To verify user able to enter the description in the details field of overview tab while creating the Announcemennt
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I see the following messages in the page details :
      | Overview Tab - Enter description for the Announcement. |
    And I click on "Edit" in the page details
    And I enter value "Atomation Description Field" into field "fieldAnnouncementDescription__c"
    And I click on "Save" in the page details
    Then I softly see field "Description" as "Atomation Description Field"

  @34222 @announcementEditionFA
  Scenario: Edition of an Announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @37029 @announcementContactAssociationFA @smoke
  Scenario Outline: Contact association to an Announcement
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "<Contact>" in the table "---announcement:-:annoucementContactTableId---"
    Then I see that "<Contact>" has been added in flextable with Id "---announcement:-:contactTableId---"
    Examples:
      | Contact        |
      | Automation EXE |

  @52401 @announcementContactDissociationFA
  Scenario Outline: Validate the dissociation of contact to the Announcement
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "<Contact>" in the table "---announcement:-:annoucementContactTableId---"
    And I refresh the page
    When I click on "Remove" icon for "<Contact>" inside flex table with id "---announcement:-:contactTableId---"
    Then I do not see values "Record Id" and "<Contact>" inside table
    Examples:
      | Contact        |
      | Automation EXE |

  @52402 @announcementFormulaInviteApplicantFA @smoke
  Scenario: Amount addition to Invited applicant association to an Announcement
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    Then I see that "SAN DIEGO ELECTRICAL TRAINING TRUST" has been added in flextable with Id "---announcement:-:formulaInvitedApplicatsTableId---"

  @52403 @announcementFundingAccountAssociationFA
  Scenario Outline: Funding Account association to an Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "<EGMS Id>" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Then I see that "<EGMS Id>" has been added in flextable with Id "---announcement:-:fundingAccountsTableId---"
    Examples:
      | EGMS Id                     |
      | {SavedValue:fundingAccount} |

  @52404 @announcementFADissociationFA
  Scenario Outline: Funding Account dissociation to an Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "<EGMS Id>" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I click on "Remove" icon for "<EGMS Id>" inside flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I do not see value "<EGMS Id>" for title "EGMS ID" inside table "---announcement:-:fundingAccountsTableId---"
    Examples:
      | EGMS Id                     |
      | {SavedValue:fundingAccount} |

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
    When I click on "Remove" icon for "BP01" inside flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I do not see value "BP01" for title "Budget Period Name" inside table "---announcement:-:budgetPeriodTableId---"

  @52407 @announcementFocusAreaAssociationFA
  Scenario: Validate the association of Focus Area to Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Add" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    Then I see that "Automation Permanent Focus Area2" has been added in flextable with Id "---announcement:-:AnnouncementServiceArea1TableId---"

  @34775 @announcementObjectiveAssociationFA
  Scenario: Validate the association of objective to the Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    Then I see that "Automation Permanent Objective2" has been added in flextable with Id "---announcement:-:objectivesTableId---"

  @52409 @announcementObjectiveDissociationFA
  Scenario: Validate the dissociation of objective to the Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I click on "Remove" icon for "Automation Permanent Objective2" inside flex table with id "---announcement:-:objectivesTableId---"
    Then I do not see value "Automation Permanent Objective2" for title "EGMS ID" inside table "---announcement:-:objectivesTableId---"

  @32410 @announcementAttachmentChecklistFA
  Scenario: Validate the attachment checklist of the announcement
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                 | Required  | Applies To | Status |
      | Automation test description | Mandatory | Award      | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---announcement:-:annChecklist---"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close "Upload Template" modal by clicking the top right x button
    Then I see that "Active" has been added in flextable with Id "---announcement:-:annChecklist---"

  @52411 @announcementApproverSelectionFA
  Scenario: Validate the assignment of Approvers for the Announcement
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "---announcement:-:approversTableId---"

  @34232 @announcementReviewerAssignmentFA
  Scenario: Validate the assignment of Reviewer for the Announcement
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 20       | No                   |
    Then I see that "Automation FO" has been added in flextable with Id "---announcement:-:reviewersTableId---"

  @52412 @announcementReviewerInitiationFA
  Scenario: Validate the Reviewer initiation for the Announcement
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    Then I see that "Sent for Review" has been added in flextable with Id "---announcement:-:reviewersTableId---"

  @52413 @announcementReviewCompleteFA @wip
  Scenario: Validate the review for the Announcement
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---announcement:-:reviewersTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Draft"
    When I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"

  @35003 @announcementAddAttachmentFA @wip
  Scenario: Validate the attachment for an Announcement
    Given I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Funding Opportunity Announcement"
    Then I see "Funding Opportunity Announcement" has been added in "Attachments" flex table

  @52414 @reviewStepsBeforeSubmitForApprovalFA
  Scenario: Validate the Review steps of Announcement before submit for Approval
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
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
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
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
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
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
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
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
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
    Then I see the following messages in the page details :
      | There are no errors with the review step templates. |

  @45773 @announcementOtherNotAbleToDelete
  Scenario: Validate that other users are not able to delete created announcement
    When I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @45774 @announcementOtherNotAbleToEdit
  Scenario: Validate that other users are not able to Edit created announcement
    When I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Edit" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
