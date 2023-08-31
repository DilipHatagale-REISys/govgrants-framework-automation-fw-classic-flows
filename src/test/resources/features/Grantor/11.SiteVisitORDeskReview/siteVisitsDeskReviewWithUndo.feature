@siteVisitDeskReviewWB @grantor-regression @grantor-parallel-regression @siteVisit @regression @siteVisitUndo
Feature: Validate all scenarios in the Site Visit with Undo

  @279083 @VerifynewFDuserLaststepapprovercanseeUNDObuttononApprovedstateofSiteVisitwhenapprovaltaskistransferfromoneFDstep1usertootherFDuserstep1 @sprint-2-US-289061 @hitesh @Undo
  Scenario:Verify new FD user (Last step approver)can see UNDO button on Approved state of Site Visit when approval task is transfer from one FD (step1)user to other FD user(step 1)
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:FD Username}  | Step 1     |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Given I click on "Conduct" in the page details
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FD1"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly do not see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---sitevisits:-:manageSiteVisitTableId---"
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I can see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FD1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation FD" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Approved"
    Given I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Site Visit" against the value "Automation FD1" inside table "---sitevisits:-:approverSiteVisitTableId---"
    Then I softly see value "NA" for title "Site Visit" against the value "Automation FD" inside table "---sitevisits:-:approverSiteVisitTableId---"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I checkout to yopmail with mailid "automationfd1@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}.
      """
    Then I see the mail text is as follows :
  """
  Hello,

   This email is to notify you that approver #Automation FD1 has initiated undo action.

   Details:
   EGMS ID: {SavedValue:DeskReview}
   Record Name: {SavedValue:Automation Runtime Award Desk Review}

   Log in to EGMS and click here to start reviewing the details.

   Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

   Thank you.
   The EGMS Team
    """
    And I checkout to yopmail with mailid "automationfd@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    Then I do not see the mail text is as follows :
  """
  Hello,

   This email is to notify you that approver #Automation FD1 has initiated undo action.

   Details:
   EGMS ID: {SavedValue:DeskReview}
   Record Name: {SavedValue:Automation Runtime Award Desk Review}

   Log in to EGMS and click here to start reviewing the details.

   Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

   Thank you.
   The EGMS Team
    """
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Notification: Approver has initiated Undo Action on #{SavedValue:DeskReview}.
      """
    Then I see the mail text is as follows :
  """
  Hello,

   This email is to notify you that approver #Automation FD1 has initiated undo action.

   Details:
   EGMS ID: {SavedValue:DeskReview}
   Record Name: {SavedValue:Automation Runtime Award Desk Review}

   Log in to EGMS and click here to start reviewing the details.

   Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

   Thank you.
   The EGMS Team
    """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "FD1" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Send Back | Forward |
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Please select appropriate action before submitting.|
    When I select radio button "Send back" in the approval decision
    And I submit the approval in the approval decision
    Then I can see the message "Comments are Required." in the approval decision
    When I "Send Back" in the approval decision
    Then I softly see the following messages in the page details contains:
      | Successfully sent to Owner. It may take few minutes to process record |
    Then I softly see field "Status" as "In Progress"
    Then I softly see status in Progress-bar is "In Progress" and is "green"

