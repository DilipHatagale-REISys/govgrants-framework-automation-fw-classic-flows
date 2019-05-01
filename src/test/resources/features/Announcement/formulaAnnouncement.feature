@formula @regression
Feature: Validate all scenarios in the Formula Announcement tab

   Background: Create Announcement
   Given I delete the record "Automation Formula Announcement" from the object "Announcement"
   Given I create a "Formula" Announcement as user "EXE" from sheet "FormulaAnnouncement" in excel "Announcement_Field_Values.xlsx"
      | Actions     | Step 1                              | Step 2                     | Step 3                            |
      | Navigation  | As a Grantor                        | Announcements              | Creation Second Modal             |
      | FlexTable   | Announcements                       | Draft Announcements        |                                   |
      | FlexTableId | ActiveFundingOpportunitiesCompitive | ActiveFundingOpportunities | ActiveFundingOpportunitiesFormula |
      | Creation    | New                                 | Continue                   | Save and Continue                 |
      | ID          | EGMS ID                             |                            |                                   |
    And I click on "Save" in the page details
    And I get the "EGMS ID"

  @33936 @announcementCreationFA @smoke 
  Scenario: Creation of an Announcement
    Then I see status in Progress-bar is "Created" and is "green"

  @announcementCreatedDeleteAccessToOwnerFA
  Scenario: Validate that owner can able to delete created status announcement
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
    When  I click on "Delete" icon for "Record id" inside flex table with id "ActiveFundingOpportunitiesAll"
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
    Then I do not see value "Record id" for title "Announcement Name" inside table "ActiveFundingOpportunitiesAll"

  @createdAnnouncementDeletionByOtherUserFA
  Scenario Outline: Validate that other users are not able to delete created announcement
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "ActiveFundingOpportunitiesAll"
    Examples:
      | User |
      | PM   |

  @announcementCreateFormulaCheckUnderDraftDirectedListViewFA
  Scenario: Validate that Created Competitive announcement will not reflect under Draft Formula announcement list view
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Announcements" in "ActiveFundingOpportunities"
    When I perform quick search for "Record Id" in "ActiveFundingOpportunities" panel
   Then I do not see values "Record Id" and "Announcement Name" inside table

  @announcementEditionByOtherUserFA
  Scenario Outline: Validate that other users are not able to edit created announcement
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
    Then I cannot see row level action button "Edit" against "Record id" in flex table with id "ActiveFundingOpportunitiesAll"
    Examples:
    | User |
    | PM   |

  @createdAnnouncementEditionOnlyOwnerFA
  Scenario: Validate that only owner can able to edit created status announcement
    When I navigate to "Announcements" tab
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesAll" panel
    When I click on "Edit" icon for "Record id" inside flex table with id "ActiveFundingOpportunitiesAll"
    Then I can see top right button "Save" in page detail

  @34221 @34222 @announcementEditionFA
  Scenario: Edition of an Announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
 
  @37029 @announcementContactAssociationFA @smoke 
  Scenario Outline: Contact association to an Announcement
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable with Id "AnnouncementContacts"
    Examples:
     | Contact        |
     | Automation EXE |

  @announcementContactDissociationFA
  Scenario Outline: Validate the dissociation of contact to the Announcement
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateAnnouncementContacts"
    When I click on "Remove" icon for "<Contact>" inside flex table with id "announcement::contactTableId"
    Then I do not see values "Record Id" and "Contact" inside table
    Examples:
      | Contact        |
      | Automation EXE |

  @34760 @announcementFormulaInviteApplicantFA @smoke 
  Scenario: Amount addition to Invited applicant association to an Announcement
    Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    Then I see that "SAN DIEGO ELECTRICAL TRAINING TRUST" has been added in flextable with Id "announcement::formulaInvitedApplicatsTableId"

  @34769 @announcementFundingAccountAssociationFA
  Scenario Outline: Funding Account association to an Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnFundingAccounts"
    And I close Modal
    When I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account  | Pre-Encumbrance |
      | FA--154          | 100             |
    Then I see that "<EGMS Id>" has been added in flextable with Id "flexGridAnnouncementFundingAccountGrantor"
    Examples:
      | Announcement Type | EGMS Id     |
      | Formula           | FA--154     |

  @announcementFADissociationFA
  Scenario Outline: Funding Account dissociation to an Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "announcement::fundingAccountsTableId"
    When I click "Add" after selection of "<EGMS Id>" in the table "SelectAnnFundingAccounts"
    And I close Modal
    When I click on "Remove" icon for "<EGMS Id>" inside flex table with id "announcement::fundingAccountsTableId"
    Then I do not see value "<EGMS Id>" for title "EGMS ID" inside table "announcement::fundingAccountsTableId"
    Examples:
     | EGMS Id |
     | FA--154 |

  @34771 @announcementBudgetPeriodAdditionFA
  Scenario: Budget Period Addition to an Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 0          | 500      |
    Then I see that "BP01" has been added in flextable with Id "flexGridAnnouncementBudgetPeriod"

  @announcementBudgetPeriodDissociationFA
  Scenario: Validate the dissociation of Budget Period to the Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I click on "Remove" icon for "BP01" inside flex table with id "flexGridAnnouncementBudgetPeriod"
    Then I do not see value "BP01" for title "Budget Period Name" inside table "flexGridAnnouncementBudgetPeriod"

  @34775 @announcementFocusAreaAssociationFA
  Scenario: Validate the association of Focus Area to Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementServiceArea1"
    When I click "Add" after selection of "Automation Grant Focus Area" in the table "SelectAnnouncementServiceArea1"
    And I close Modal
    Then I see that "Automation Grant Focus Area" has been added in flextable with Id "AnnouncementServiceArea1"

  @34774 @announcementObjectiveAssociationFA
  Scenario: Validate the association of objective to the Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Announcement Objective" in the table "SelectAnnGoals"
    And I close Modal
    Then I see that "Automation Announcement Objective" has been added in flextable with Id "AnnouncementGranteeStrategicGoalsObjectives"

  @announcementObjectiveDissociationFA
  Scenario: Validate the dissociation of objective to the Announcement
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Announcement Objective" in the table "SelectAnnGoals"
    And I close Modal
    When I click on "Remove" icon for "Automation Announcement Objective" inside flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    Then I do not see value "Automation Announcement Objective" for title "EGMS ID" inside table "AnnouncementGranteeStrategicGoalsObjectives"

  @35002 @announcementAttachmentChecklistFA
  Scenario: Validate the attachment checklist of the announcement
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "inlineEditGridAnnouncementChecklists" by clicking "Add" :
      | Description                 | Required  | Applies To | Status |
      | Automation test description | Mandatory | Award      | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "inlineEditGridAnnouncementChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    Then I see that "Active" has been added in flextable with Id "inlineEditGridAnnouncementChecklists"

  @34780 @announcementApproverSelectionFA
  Scenario: Validate the assignment of Approvers for the Announcement
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    Then I see that "Automation EXE" has been added in flextable with Id "flexGridAnnouncementRolesandResponsibility"

  @34232 @announcementReviewerAssignmentFA
  Scenario: Validate the assignment of Reviewer for the Announcement
    Given I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "flexGridApproverRoles"
        When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
    Then I see that "Automation FO" has been added in flextable with Id "flexGridApproverRoles"

  @34778 @announcementReviewerInitiationFA
  Scenario: Validate the Reviewer initiation for the Announcement
    When I navigate to "Responsibilities" sub tab
        When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    Then I see that "Sent for Review" has been added in flextable with Id "flexGridApproverRoles"

  @34779 @announcementReviewCompleteFA @wip
  Scenario Outline: Validate the review for the Announcement
   When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Announcements"
    When I perform quick search for "Record id" in "<Active Funding Opportunities id>" panel
    And I click on "View" icon for "Record id" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
    Examples:
      | User | Flextable Name | Announcement Type | Active Funding Opportunities id   |
      | FO   | Peer Reviewers | Formula           | ActiveFundingOpportunitiesFormula |

  @35003 @announcementAddAttachmentFA @wip
  Scenario: Validate the attachment for an Announcement
    Given I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epC4AAI"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Funding Opportunity Announcement"
    And I close Modal
    Then I see that "Funding Opportunity Announcement" has been added in flextable with Id "a150b000003epC4AAI"

  @reviewStepsBeforeSubmitForApprovalFA
  Scenario Outline: Validate the Review steps of Announcement before submit for Approval
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    Then I see the following messages in the page details :
      | There are no errors with the review step templates. |
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @34461 @submittingAnnouncementForApprovalFA 
  Scenario Outline: Validate the submission of Announcement for Approval
        Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted For Approval" and is "green"
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @submittedAnnouncementDeletionFA 
  Scenario Outline: Validate that only record owner cannot delete Submitted for Approval status announcements
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    When I get the "EGMS ID" 
    And I click on "Submit For Approval" in the page details
    And I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Announcements"
    When I perform quick search for "Record id" in "ActiveFundingOpportunitiesFormula" panel
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "ActiveFundingOpportunitiesFormula"
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |
      
  @announcementForPastApplicationDueDateFA
  Scenario Outline: Validate that user can not enter application due date as past date
     Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
     When I navigate to "Overview" sub tab
    And I enter value "-10" into field "ApplicationDueDate__c"                                                                                                                         
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    Then I see the following messages in the page details :
      | Overview Tab - Application Due Date cannot be in the past. |
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @announcementWithBlankBudgetPeriodFA
  Scenario Outline:    Validate that user should not submit announcement with blank budget period dates
     Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    Then I see the following messages in the page details :
      | Financial Tab - Correct Budget Periods Start Date and End Dates. Budget Periods should be continuous and together should form a Project Period. |
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @announcementApprovalFA
  Scenario Outline: Validate the approval of an Announcement
           Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
     Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @announcementPendingTaskPostApprovalFA @smoke 
  Scenario Outline: Validate that after approval of an Announcement task get deleted from pending task table.
         Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see values "Record Id" and "Automation Formula Announcement" inside table
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @announcementCompletedTaskPostApprovalFA
  Scenario Outline: Validate that after approval of an Announcement task get added to its completed task table.
          Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    When I navigate to "Announcements" tab
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @announcementSendBackToOwnerFA 
  Scenario Outline: Validate the send back functionality of an Announcement
       Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
     And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Send to Owner |  Continue         |
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |
      
  @announcementSendBackPendingTaskToOwnerFA
  Scenario Outline: Validate that after send back from approvers owner should not get pending task
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Send to Owner |     Continue      |
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
     Then I do not see values "Record Id" and "Automation Formula Announcement" inside table
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @announcementPostSendBackCheckFieldHistoryFA 
  Scenario Outline: Validate the field history after send back of an announcement
       Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
     And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Send to Owner | Continue          |
    When I navigate to "History" sub tab
    Then I see that "Announcement" is in "Created" status
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |
      
  @announcementApprovalRejectionFA
  Scenario Outline: Validate the reject functionality of an Announcement
            Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Disapprove    | Continue          |
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |

  @announcementRejectPendingTaskForNextApproverFA
  Scenario Outline: Validate that after rejection from 1st approver, 2nd user should not get pending task
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
     And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Disapprove    |   Continue        |
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see values "EGMS ID" and "Automation Formula Announcement" inside table
    Examples:
      | Announcement Type | Active Funding Opportunities id   | User |
      | Formula           | ActiveFundingOpportunitiesFormula |  FO  |

  @announcementPostRejectPendingTaskForUserFA
  Scenario Outline: Validate that after rejection of an Announcement task get deleted from pending task table.
        Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
   Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Disapprove    | Continue          |
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I do not see values "Record Id" and "Automation Formula Announcement" inside table
    Examples:
      | Announcement Type | Active Funding Opportunities id   | User |
      | Formula           | ActiveFundingOpportunitiesFormula |  EXE  |

  @announcementPostRejectCompletedTaskForUserFA
  Scenario Outline: Validate that after rejection of an Announcement task get added to it's completed task table.
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
     And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Disapprove    |   Continue        |
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    Examples:
      | Announcement Type | Active Funding Opportunities id   | User |
      | Formula           | ActiveFundingOpportunitiesFormula |  FO  |

  @announcementPostRejectCheckFieldHistoryFA
  Scenario Outline: Validate the field history after rejection of an announcement
       Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Disapprove    |     Continue      |
    When I navigate to "History" sub tab
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Examples:
      | Announcement Type | Active Funding Opportunities id   | User |
      | Formula           | ActiveFundingOpportunitiesFormula |  EXE  |

  @announcementPostRejectionCheckInListViewFA
  Scenario Outline: Validate the rejected announcement will reflect under "Rejected Announcements" list view
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Given "1" Approvers "PM" approve the record "Record Id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Disapprove    | Continue          |
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Rejected Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "ActiveFundingOpportunitiesFormula"
    Examples:
      | Announcement Type | Active Funding Opportunities id   | User |
      | Formula           | ActiveFundingOpportunitiesFormula |  EXE  |

  @34462 @publishingFormulaAnnouncementFA  @announcementFormulaHappyPath @smoke 
  Scenario Outline: Validate the activation of Announcement
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I associate "1" records "FA--154"
      | Actions     | Step 1     | Step 2    | Step 3                                    | Step 4 | Step 5                   |
      | Associate 1 | Financials | Associate | flexGridAnnouncementFundingAccountGrantor | Add    | SelectAnnFundingAccounts |
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154           | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    Given I associate "2" records "Automation EXE,Automation Permanent Objective"
      | Actions     | Step 1   | Step 2    | Step 3                                      | Step 4 | Step 5                         |
      | Associate 1 | Overview | Associate | AnnouncementContacts                        | Add    | AssociateAnnouncementContacts  |
      #| Associate 2 | Setup    | Associate | AnnouncementServiceArea1                    | Add    | SelectAnnouncementServiceArea1|
      | Associate 2 | Setup    | Associate | AnnouncementGranteeStrategicGoalsObjectives | Add    | SelectAnnGoals                 |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description | 
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
      | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
     And I click on "Send for Review" icon for "Automation FO" inside table
   And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value            | Field            |
      | Passed           | Rating__c        |
      | Passed           | ReviewComments__c|
    When I click modal button "Save"
   And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
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
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
 And I click on "Edit" in the page details
     When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
        And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
     Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date           | End Date       |
      | BP01               | 	50      | 150     |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
     Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2        | Step 3            |
      | Navigation | As a Grantor  | Announcements |                   |
      | FlexTable  | Pending Tasks | My Tasks      | PhasePendingTasks |
      | Approval   | Start         | Approve       |                   |
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |
 	