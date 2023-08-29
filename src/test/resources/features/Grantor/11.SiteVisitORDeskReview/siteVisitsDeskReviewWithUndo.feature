@siteVisitDeskReviewWB @grantor-regression @grantor-parallel-regression @siteVisit @regression @siteVisitUndo
Feature: Validate all scenarios in the Site Visit with Undo

  @279063 @VerifyFDuserassinglestepapproverstep1canabletoseeUNDObuttonafterApprovedtheSiteVisitbyassignedapprover
  Scenario: Verify FD user as single step approver(step 1) can able to see UNDO button after Approved the Site Visit by assigned approver
    Given I activated standalone subaward "Automation Runtime Award for Amendment Request" with properties "default" of type "Formula_By_Applicant"
    Given I activated standalone subaward "Automation Runtime Award for Associate Amendment Request" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for Amendment Request}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for Amendment Request}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:FD Username}  | Step 1      |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award for Associate Amendment Request}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
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
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I can see top right button "Undo" in page detail
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:homeCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "---deskreview:-:homeCompletedTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:homePendingTasksTableId---" panel
    Then I softly do not see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "---deskreview:-:homeCompletedTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "No" on modal confirmation box
    Then I see status in Progress-bar is "Approved" and is "Green"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:homeCompletedTaskTableId---" panel
    Then I softly see value "Cancelled" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---deskreview:-:homeCompletedTaskTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:homeCompletedTaskTableId---"
    And I navigate to "History" sub tab
    And I see "{SavedValue:FD Username}" against "Re-approval (Pending for first approval)" in approval history
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Pending"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "History" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "EGMS ID" inside table "History"
    Then I softly see value "{SavedValue:FD Username}" for title "Changed By" inside table "History"
    Then I softly see value "Approved" for title "Old Value" inside table "History"
    Then I softly see value "Submitted for Approval" for title "New Value" inside table "History"
    Then I softly see snapshot with name containing "Site_Visit_Submit_For_Approval.pdf" as name
    And I click on hyperlink containing value "Site_Visit_Submit_For_Approval.pdf"
    And I switch to parent tab



