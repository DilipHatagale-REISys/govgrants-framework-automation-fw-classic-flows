@organizationalSiteVisitWB @grantor-regression @grantor-parallel-regression @siteVisit @regression @organizationalSiteVisitUndo
Feature: Validate all scenarios in Organizational Site Visit With Undo

  @289790 @289791 @289792 @289793 @289797 @289798 @289808 @VerifywhenPmapprovercanclickonundobuttoninOrganizationalSiteVisitrecordwhenrecordisinApprovedstate @sprint-2-US-288691 @hitesh @Undo
  Scenario: Verify when Pm approver can click on undo button in Organizational Site Visit record when record is in Approved state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PO Username}  | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:FD Username} | Step 2     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 3     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM Username}  | Step 4     |
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
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #289797 #289798
    Then I can see top right button "Undo" in page detail
    Then I can see top right button "Send to Subrecipient" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "No" on modal confirmation box
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    #289791
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Undo" in page detail
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Send Back | Forward |
      #289808
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:homeCompletedTaskTableId---" panel
    Then I softly see value "Cancelled" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---sitevisits:-:homeCompletedTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:homePendingTasksTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---sitevisits:-:homePendingTasksTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    #289792
    Then I can see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    #289793
    Then I softly see status in Progress-bar is "Approved" and is "green"
    Then I cannot see top right button "Undo" in page detail

  @289794 @289799 @289803 @VerifythatwhenExeapproverForwardtheOrganizationalSiteVisitApprovaltaskForwardedApproverwillseeUNDObuttonandnotpreviousOne @sprint-2-US-288691 @hitesh @Undo
  Scenario:Verify that when Exe approver Forward the Organizational Site Visit Approval task , Forwarded Approver will see UNDO button and not previous One.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PO Username}  | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 2     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM1 Username}  | Step 3     |
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
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    #289799
    Then I can see top right button "Undo" in page detail
    Then I cannot see top right button "Send to Subrecipient" in page detail
    And I click on "Undo" in the page details without processing
    #289803
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "No" on modal confirmation box
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Send Back | Forward |

  @289800 @289801 @VerifythatPMapproveruserwillnotseeUNDObuttoninSendtoSrstateofOrganizationalSiteVisitrecord @sprint-2-US-288691 @hitesh @Undo
  Scenario: Verify that PM approver user will not see UNDO button in Send to S/r state of Organizational Site Visit record.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PO Username}  | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM1 Username} | Step 2     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 3     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM Username}  | Step 4     |
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
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    Then I can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    #289801
    Then I cannot see top right button "Undo" in page detail

  @289802 @VerifythatAdminapproveruserwillnotseeUNDObuttoninClosedstateofOrganizationalSiteVisit @sprint-2-US-288691 @hitesh @Undo
  Scenario: Verify that Admin approver user will not see UNDO button in Closed state of Organizational Site Visit
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PO Username}  | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                        | Site Visit|
      | {SavedValue:PM Username}     | Step 2   |
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
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I can see top right button "Undo" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"
    Then I cannot see top right button "Undo" in page detail

  @289804 @VerifythatafterPOuserclickonUndobuttonEmailwillbesenttoPreviousApproverandOwnerofOrganizationalSiteVisitrecord @sprint-2-US-288691 @hitesh @Undo
  Scenario:Verify that after POuser click on Undo button Email will be sent to Previous Approver and Owner of Organizational Site Visit record
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username}  | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM1 Username} | Step 2     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PO Username} | Step 3     |
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
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "No" on modal confirmation box
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
    And I checkout to yopmail with mailid "automationpo@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:SitevVisitId}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:SitevVisitId}

    Record Name: {SavedValue:Automation Runtime Award Site Visit}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:SitevVisitId}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:SitevVisitId}

    Record Name: {SavedValue:Automation Runtime Award Site Visit}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """
    Then I refresh the page
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
    Notification: Approver has initiated Undo Action on #{SavedValue:SitevVisitId}
      """
    Then I see the mail text is as follows :
      """
    Hello,

    This email is to notify you that approver has initiated undo action.

    Details:

    EGMS ID: {SavedValue:SitevVisitId}

    Record Name: {SavedValue:Automation Runtime Award Site Visit}

    Log in to EGMS and click here to start reviewing the details.

    Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

    Thank you.
    The EGMS Team
    """

  @289805 @VerifythatafterEXEuserclickonUndobuttonAllthetablesofOrganizationalSiteVisitwillnotgetaffected @sprint-2-US-288691 @hitesh @Undo
  Scenario:Verify that after EXE user click on Undo button All the tables of Organizational Site Visit will not get affected
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PO Username}  | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM1 Username} | Step 2     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 3     |
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
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "No" on modal confirmation box
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:participateassociateContactsId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateAwardId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---orgLevelSiteVisits:-:siteVisitAddFilesTableId---"
    Then I softly cannot see top right button "Add" in flex table with id "---orgLevelSiteVisits:-:siteVisitNotesTableId---"

  @290426 @304192 @VerifyPOusercannotseeundobuttoninnotifiedstateofOrganizationalSiteVisit @sprint-2-US-288691 @hitesh @Undo
  Scenario:Verify PO user can not see undo button in notified state of Organizational Site Visit
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    Then I softly see status in Progress-bar is "Notified" and is "green"
    Then I cannot see top right button "Undo" in page detail
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM Username}  | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PM1 Username} | Step 2     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 3     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:PO Username}  | Step 4     |
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
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I cannot see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Undo" in page detail
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Send Back | Forward |
    And I "Send Back" in the approval decision
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Then I cannot see top right button "Undo" in page detail