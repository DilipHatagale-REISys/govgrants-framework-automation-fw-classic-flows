@directedAnnouncements @grantor-regression @grantor-parallel-regression @announcement @regression @annoucementTemp
Feature: Validate all scenarios in the directed Announcement tab

  Background: Create Announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

  @73761 @73762 @73764 @73765 @70616 @73766 @70617 @34232 @73611 @73303 @73612 @73613 @73304 @73305 @73306 @73320 @submittingAnnouncementForApprovalDR @submittedAnnouncementDeletion @announcementForPastApplicationDueDate
  Scenario Outline: Validate the submission of Announcement for Approval || Validate that only record owner cannot delete Submitted for Approval status announcements || Validate that user can not enter application due date as past date
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    #And I perform quick search for "Automation Permanent Focus Area" in "---announcement:-:AnnouncementServiceArea1TableId---" panel
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:AnnouncementServiceArea1TableId---"
#    When I click on advance filter "#advfAnnouncementServiceArea1" of table id "---announcement:-:AnnouncementServiceArea1TableId---"
#    When I enter advance filter values inside id "advfAnnouncementServiceArea1"
#      | Title | Contains | Automation Permanent |
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:AnnouncementServiceArea1TableId---"
    And I refresh the page
    When I click on advance filter "#advfAnnouncementServiceArea1" of table id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I enter advance filter values inside id "advfAnnouncementServiceArea1"
      | Title | Contains | Demo Record |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    And I refresh the page
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:directedAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I click on "Remove" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                      | Responsibility   | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username}  | Fiscal Reviewer  | Review Financial details | 10       | No                   |
      | {SavedValue:PM Username}  | Program Reviewer | Review Financial details | 11       | No                   |
      | {SavedValue:EXE Username} | Program Reviewer | Review Financial details | 11       | No                   |
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---announcement:-:flexGridApproverRolesTableId---"
    And I perform quick search for "{SavedValue:FO Username}" in "---announcement:-:flexGridApproverRolesTableId---" panel
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" inside table "---announcement:-:flexGridApproverRolesTableId---"
#    When I click on advance filter "#advfGrantorAnnouncementReviewersTempGrantor" of table id "---announcement:-:flexGridApproverRolesTableId---"
#    When I enter advance filter values inside id "advfGrantorAnnouncementReviewersTempGrantor"
#      | Responsibility | equals to | Fiscal Reviewer |
    Then I softly see value "Fiscal Reviewer" for title "Responsibility" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:FO Username}" in flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:FO Username}" in flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly can see row level action button "Send for Review" against "{SavedValue:FO Username}" in flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "Edit" :
      | Name                     | Description                      |
      | {SavedValue:FO Username} | Review Financial details updated |
    Then I softly see value "Review Financial details updated" for title "Description" inside table "---announcement:-:flexGridApproverRolesTableId---"
    And I perform quick search for "Automation" in "---announcement:-:flexGridApproverRolesTableId---" panel
    And I click on "Delete" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I refresh the page
    And I click on "Delete" icon for "{SavedValue:PM Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I refresh the page
    And I click on "Delete" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I refresh the page
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    Then I softly see field "Rating" as "Passed"
    Then I softly see field "Comments" as "Passed"
    Then I softly see field "Reviewed by" as "{SavedValue:FO Username}"
    When I click on submit review
    Then I softly see value "Submitted" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "<Announcement Type>" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Directed Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Directed Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Directed Announcement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see status in Progress-bar is "Reviewed" and is "green"
    When I navigate to "Responsibilities" tab
    And I expand nested table containing column value "Fiscal Reviewer"
    Then I softly see value "Passed" for title "Review Comments" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see value "Passed" for title "Rating" inside table "---announcement:-:flexGridApproverRolesTableId---"
    And I navigate to "Setup" sub tab
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I navigate to "Overview" sub tab
    And I enter value "-1" into field "fieldApplicationDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Application Due Date cannot be in the past. |
    When I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I enter value "10" into field "fieldApplicationDueDate__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "green"
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Directed Announcements"
    When I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    Then I softly cannot see row level action button "Delete" against "Record id" in flex table with id "---announcement:-:annoucementTableId---"
    Examples:
      | Announcement Type |
      | Directed          |

  @announcementWithBlankBudgetPeriod @smoke
  Scenario Outline: Validate that user should not submit announcement with blank budget period dates
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    Then I see the following messages in the page details :
      | Financial Tab - There should be no gap between the dates. Enter the correct Budget Periods Start Dates and End Dates. |

    Examples:
      | Announcement Type |
      | Directed          |

  @73767 @34763 @34765 @34766 @announcementApproval @announcementPendingTaskPostApproval @announcementCompletedTaskPostApproval @smoke
  Scenario Outline: Validate that after approval of an Announcement task get added to its completed task table. || Validate the approval of an Announcement || Validate that after approval of an Announcement task get deleted from pending task table.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
#    When I click on advance filter "#advfAnnouncementKeyOutcomes" of table id "---announcement:-:kpiflextableid---"
#    When I enter advance filter values inside id "advfAnnouncementKeyOutcomes"
#      | Title | Contains | AAtamation |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:kpiflextableid---"
    And I refresh the page
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
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
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "{SavedValue:Automation Runtime Directed Announcement}" inside table
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Announcement Type |
      | Directed          |

  @announcementSendBackToOwner @announcementSendBackPendingTaskToOwner @announcementPostSendBackCheckFieldHistory
  Scenario Outline: Validate the send back functionality of an Announcement || Validate that after send back from approvers owner should not get pending task || Validate the field history after send back of an announcement
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
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
    And I "Send to Owner" in the approval decision
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "History" sub tab
    Then I softly see that "Announcement" is in "Draft" status
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "{SavedValue:Automation Runtime Directed Announcement}" inside table
    Examples:
      | Announcement Type |
      | Directed          |

  @announcementApprovalRejection @announcementPostRejectionCheckInListView @announcementRejectPendingTaskForNextApprover @announcementPostRejectCheckFieldHistory @announcementPostRejectCompletedTaskForUser @announcementPostRejectPendingTaskForUser
  Scenario Outline: Validate the rejected announcement will reflect under "Rejected Announcements" list view || Validate the field history after rejection of an announcement || Validate that after rejection of an Announcement task get added to it's completed task table. || Validate the reject functionality of an Announcement || Validate that after rejection from 1st approver, 2nd user should not get pending task || Validate that after rejection of an Announcement task get deleted from pending task table.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
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
    And I "Disapprove" in the approval decision
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I navigate to "History" sub tab
    Then I softly see value "Rejected" for title "New Value" inside table "History"
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "{SavedValue:Automation Runtime Directed Announcement}" inside table
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhaseCompletedTasks" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "PhaseCompletedTasks"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly do not see values "Record Id" and "{SavedValue:Automation Runtime Directed Announcement}" inside table
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Rejected Directed Announcements"
    When I perform quick search for "Record Id" in "---announcement:-:annoucementTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---announcement:-:annoucementTableId---"
    Examples:
      | Announcement Type |
      | Directed          |

  @74132 @userAllowToDownloadPDFInvitedApplication @skipOnJenkins
  Scenario: To verify system allow to download PDF for Invited Applicants section in overview tab of announcement.
    When I click on "Edit" in the page details
    And I click on top right button "Associate Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST1" in "---announcement:-:directedAddInviteApplicantTableId---" panel
    When I click "Associate" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I click on parallel menu button in flex table title "Invited Applicants"
    And I select "Download as PDF" from parallel lines dropdown of "Invited Applicants"
    When I download the file
    Then I see "Invited Applicants" on page "1" of "govgrants" pdf file