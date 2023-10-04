@organizationalDeskReviewWB @grantor-regression @grantor-parallel-regression @siteVisit @regression
Feature: Validate all scenarios in Organizational Desk Review Without Undo

  @308889 @ODR-VerifythatUNDOiconorbuttonisnotavailableontheactionbuttonsofOrganizationDeskreviewrecordontablethatispresentonsidebarorphaselevelorthatonOrganization @sprint-7-US-306815 @hitesh @Undo
  Scenario:ODR-Verify that UNDO icon or button is not  available on the action buttons of Organization Desk review record on table that is present on side bar or phase level or that on Organization
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:PM Username}  | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I navigate to "Home" tab
    And I select "Site Visits / Desk Reviews" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I perform quick search for "{SavedValue:DeskReviewID}" in "SiteVisit__c" panel
    Then I softly cannot see row level action button "Undo" against "{SavedValue:DeskReviewID}" in flex table with id "SiteVisit__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---deskreview:-:deskReviewGridViewTableId---" panel
    Then I softly cannot see row level action button "Undo" against "{SavedValue:DeskReviewID}" in flex table with id "---deskreview:-:deskReviewGridViewTableId---"

  @308898 @ODRVerifythatapproverundobuttonvisibilitywillchangeasperpositionofapproverofOrgdeskreviewlastormiddle @sprint-7-US-306815 @hitesh @Undo
  Scenario:ODR-Verify that approver undo button visibility will change as per position of approver of Org desk review last or middle
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:PO Username}  | Step 1      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:FO Username}  | Step 2      |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:PM Username}  | Step 3      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Send Back | Forward |
    And I "Send Back" in the approval decision
    Then I softly see field "Status" as "In Progress"
    Then I cannot see top right button "Undo" in page detail
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "Edit" :
      | Name                      | Desk Review |
      | {SavedValue:PM Username}  | NA          |
    And I edit the following rows inline in flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "Edit" :
      | Name                      | Desk Review |
      | {SavedValue:FO Username}  | NA          |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:PM Username}  | Step 2     |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:FO Username}  | Step 3      |
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail