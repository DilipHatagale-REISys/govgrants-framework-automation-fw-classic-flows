@grantor-regression @grantor-parallel-regression @progressReport @progressReportForms @regression
Feature: Validate scenarios in Progress Report Notes

  @236019 @VerifythatPMsercanaddnotesinProgressreportrecordinsubmittograntorstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario: Verify that <PM> User can add notes in Progress report record in submit to grantor states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236023 @VerifythatPMUsercanaddnotesinProgressreportrecordinsubmittograntorstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario: Verify that <PM> User can add notes in Progress report record in submit to grantor states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PM  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236024 @236026 @VerifythatPMUsercanaddnotesinProgressreportrecordinsubmittograntorstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario: Verify that <PM> User can add notes in Progress report record in submit to grantor states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation EXE user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation EXE  | Notes Record2| Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record | Automation Notes  |
    Then I softly see value "Notes Record" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    #236026
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation FO  | Notes Record4 | Automation Notes4|
    Then I softly see value "Notes Record4" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record4" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record4" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---paymentRequest:-:advancePaymentNotesTableId---"

  @236032 @VerifythatPeerReviewerFDUsercanaddnotesinProgressreportrecordinSentforreviewstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario: Verify that  Peer Reviewer<FD> User can add notes in Progress report record in Sent for review states and edit /delete only his own notes.
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation ADMIN user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation FO  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236036 @VerifythatAdminCannotAddNotesInProgressreportRecordwhenrecordisinCreatedstateAndCanonlyEditDeletehisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario: Verify that <Admin > Can not Add Notes In Progress report Record ,when record  is in Created state And Can only /Edit /Delete his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation ADMIN user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I select "Progress Reports" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:progID}"
    And I perform quick search for "{SavedValue:progID}" in "ProgressReports__c" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "ProgressReports__c" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"

  @236041 @VerifythatSPIUsercanaddnotesinProgressreportrecordinCreatedstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario: Verify that <SPI> User can add notes in Progress report record in  Created states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation SPI3" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By       | Title         | Description      |
      |Automation SPI3  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236042 @VerifythatSPAUsercanaddnotesinProgressreportrecordinSentbacktoSrstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario:Verify that <SPA> User can add notes in Progress report record in  Sent back to S/r states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                     | Progress Report |
      | {SavedValue:PM Username} | Step 1          |
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "green"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation SPA" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By      | Title         | Description      |
      |Automation SPA  | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes3" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record3" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236154 @VerifythatAdminCannotAddNotesInProgressreportRecordwhenrecordisinSendbacktosrstateAndCanonlyEditDeletehisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario:Verify that <Admin> Can not Add Notes In Progress report Record ,when record  is in Send back to s/r state And Can only /Edit /Delete his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation ADMIN user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                        | Progress Report |
      | {SavedValue:ADMIN Username} | Step 1          |
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "green"
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By        | Title         | Description      |
      |Automation ADMIN  | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes3" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record3" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236156 @VerifythatAdminCannotAddNotesInProgressreportRecordwhenrecordisinSubmitforapprovalapprovedstateAndCanonlyEditDeletehisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario:Verify that <Admin > Can not Add Notes In Progress report Record ,when record  is in Submit for approval/approved state And Can only /Edit /Delete his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation ADMIN user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                        | Progress Report |
      | {SavedValue:ADMIN Username} | Step 1          |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title         | Description      |
      |Notes Record1  | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes3" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record3" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title         | Description      |
      |Notes Record2  | Notes Record4 | Automation Notes4|
    Then I softly see value "Notes Record4" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record4" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record4" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236158 @VerifythatAdminCannotAddNotesInProgressreportRecordwhenrecordisinForceclosedstateAndCanonlyEditDeletehisownnotes @sprint-12-US-234322 @hitesh @Notes
  Scenario:Verify that <Admin> Can not Add Notes In Progress report Record ,when record  is in Force closed state And Can only /Edit /Delete his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:PM Username}  | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---progressReport:-:internalProgressReportFlexTableId---"
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Force Closed"
    Then I softly see status in Progress-bar is "Force Closed" and is "red"
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title         | Description      |
      |Notes Record1  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236046 @VerifythatAuditorusercanonlyreadthenotes @sprint-12-US-234322 @hitesh @Notes
  Scenario:Verify that <Auditor> user can only read the notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation SPI3" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                      | Progress Report |
      | {SavedValue:EXE Username} | Step 1          |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    And I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressreport:-:internalProgressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---progressreport:-:progressNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---progressreport:-:progressNotesTableId---"

  @236045 @VerifythatINDUserCantAddnotesInProgressReportIftherecordstatusisintheSubmittedtoGrantorAndCanOnlyEditDeleteNotesAddedbyhim @sprint-12-US-234322 @hitesh @Notes
  Scenario:Verify that <IND> User Cant Add notes In Progress Report If the record status is in the Submitted to Grantor  And Can Only Edit /Delete Notes Added by him
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation IND" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By      | Title         | Description      |
      |Automation IND  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236171 @236176 @VerifythatSPIUsercannotaddnotesinProgressreportrecordinsubmitforreviewstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes 
  Scenario: Verify that <SPI> User cannot add notes in Progress report record in  submit for review states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---progressReport:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title         | Description      |
      |Notes Record1  | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes3" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record3" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---progressReport:-:peerReviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    #236176
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title         | Description      |
      |Notes Record2  | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes3" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record3" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236177 @236179 @VerifythatSPIUsercannotaddnotesinProgressreportrecordinsubmitforapprovalstatesandeditdeleteonlyhisownnotes  @sprint-12-US-234322 @hitesh @Notes 
  Scenario: Verify that <SPI> User cannot add notes in Progress report record in submit for approval states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                      | Progress Report |
      | {SavedValue:EXE Username} | Step 1          |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description     |
      |Notes Record1  | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes3" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record3" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description     |
      |Notes Record2  | Notes Record3 | Automation Notes3|
    Then I softly see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes3" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record3" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record3" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @236187 @VerifythatSPIUsercannotaddnotesinProgressreportrecordinForceclosedstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes 
  Scenario:Verify that <SPI> User cannot add notes in Progress report record in Force closed states and edit /delete only his own notes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Direct Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:PM Username}  | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    Then I softly see field "Status" as "Force Closed"
    Then I softly see status in Progress-bar is "Force Closed" and is "red"
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title         | Description      |
      |Notes Record1  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @238024 @238025 @VerifySPIusercanaddnoteinsendbacktosubrecipientstate @sprint-12-US-234322 @hitesh @Notes 
  Scenario:Verify <SPI>user can add note in send back to subrecipient state
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                        | Progress Report |
      | {SavedValue:EXE Username}   | Step 1          |
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "green"
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Title          | Title          | Description     |
      |Notes Record1  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @238028 @Verifyindusercanaddnoteinsendbacktosubrecipientstateandcanabletoeditdeletehisownnote @sprint-12-US-234322 @hitesh @Notes 
  Scenario:Verify <ind> user can add note in send back to subrecipient state and can able to edit/delete his own note
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation PM user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                        | Progress Report |
      | {SavedValue:EXE Username}   | Step 1          |
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent Back to Subrecipient" and is "green"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation IND" for title "Created By" inside table "---progressreport:-:progressNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By      | Title         | Description      |
      |Automation IND  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"

  @238029 @VerifythatSPAUsercannotaddnotesinProgressreportrecordinSubmittedforapprovalstatesandeditdeleteonlyhisownnotes @sprint-12-US-234322 @hitesh @Notes 
  Scenario:VerifythatSPAUsercannotaddnotesinProgressreportrecordinSubmittedforapprovalstatesandeditdeleteonlyhisownnotes
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "Automation ADMIN user" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I save the field labeled "Subaward ID" as "SubAwardID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I enter the following values into flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                        | Progress Report |
      | {SavedValue:ADMIN Username} | Step 1          |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - All"
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:progressReportFlexTableId---" panel
    When I click on "View" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:progressReportFlexTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---progressreport:-:progressNotesTableId---"
    When I edit the following rows inline in flex table with id "---progressreport:-:progressNotesTableId---" by clicking "Edit" :
      |Created By      | Title         | Description      |
      |Automation SPA  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---progressreport:-:progressNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---progressreport:-:progressNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---progressreport:-:progressNotesTableId---"


