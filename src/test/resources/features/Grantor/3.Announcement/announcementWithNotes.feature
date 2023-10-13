@announcement @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all notes scenarios in the  Announcement tab

  @219720 @ValidatePMADMINusercanAddeditdeletehisnotesonacompetitiveannouncmentincreatedstatus @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate PM/ADMIN user can Add/edit/delete his notes on a competitive announcment in created status
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement for Pre-App"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @219729 @ValidateEXEusercanAddeditdeletehisnotesonadirectedannouncementincreatedstatus @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate EXE user can Add/edit/delete his notes on a directed announcement in created status
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @219730 @ValidatePOusercanAddeditdeletehisnotesonaformulaannouncementincreatedstatus @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate PO user can Add/edit/delete his notes on a formula announcement in created status
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @219732 @ValidateEXEusercanAddeditdeletehisnotesonacompetitiveannouncementwhenallowrecordeditisYesandevenifreviewissubmitted&announcementismarkedReviewed @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate EXE user can Add/edit/delete his notes on a competitive announcement  when allow record edit is Yes and even if review is submitted & announcement is marked  Reviewed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement for Pre-App"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                      | Responsibility   | Description               | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Program Reviewer | Review Financial details | 10      | Yes                  |
    And I refresh the page
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I click on submit review
    Then I softly see value "Submitted" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @219734 @ValidateFiscalReviewerPMusercanAddeditdeletehisnotesonadirectedannouncementwhichisinstatusSubmittedforReview&allowrecordeditisno @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate Fiscal Reviewer PM user can Add/edit/delete his notes on a directed announcement which is in status Submitted for Review & allow record edit is no
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | No                  |
    And I refresh the page
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I click on submit review
    Then I softly see value "Submitted" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @219736 @ValidatePMEXEFOusercanAddeditdeletehisnotesonacompetitiveannouncementinsubmittedforapprovalstatus @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PM/ EXE / FO user can Add/edit/delete his notes on a competitive announcement in submitted for approval status
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement for Pre-App"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:PM Username}  | Step 1       |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record3" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record4" into field "Title"
    And I enter value "Automation Notes4" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record6" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record7" into field "Title"
    And I enter value "Automation Notes7" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record7" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @219742 @ValidatePMEXEPOusercanAddeditdeletehisnotesonaformulaannouncementwhichisApproved @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate PM/EXE/PO user can Add/edit/delete his notes on a formula announcement which  is Approved
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:PM Username}  | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record3" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record4" into field "Title"
    And I enter value "Automation Notes4" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record6" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record7" into field "Title"
    And I enter value "Automation Notes7" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record7" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @220087 @220157 @ValidateProgramReviewerEXEusercanAddeditdeletehisnotesonaformulaannouncementwhichisinstatusSubmittedforReviewandallowrecordeditisNo @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate Program Reviewer EXE user can Add/edit/delete his notes on a formula announcement which is in status Submitted for Review and allow record edit is No
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                      | Responsibility   | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Program Reviewer | Review Financial details | 10       | No                   |
    And I refresh the page
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I click on submit review
    Then I softly see value "Submitted" for title "Status" inside table "---announcement:-:flexGridApproverRolesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #220157
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    #220087
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @220094 @ValidatePMEXEFOADMINusercanAddeditdeletehisnotesonaformulaannouncementwhichisPublished @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate PM/EXE/FO/ADMIN user can Add/edit/delete his notes on a formula announcement which is Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Status" as "Published"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record3" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record4" into field "Title"
    And I enter value "Automation Notes4" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Status" as "Published"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record6" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record7" into field "Title"
    And I enter value "Automation Notes7" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record7" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Status" as "Published"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record9 | Automation Notes9 |
    Then I softly see value "Notes Record9" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record9" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record9" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record9" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record10" into field "Title"
    And I enter value "Automation Notes10" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record10" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes10" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title          | Description       |
      | Notes Record11 | Automation Notes11 |
    Then I softly see value "Notes Record11" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record11" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record11" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @220096 @ValidatePMEXEFOusercanAddeditdeletehisnotesonacompetitiveannouncementwhichisPublished @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PM/EXE/FO user can Add/edit/delete his notes on a competitive announcement which is Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement for Pre-App"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:PM Username}  | Step 1       |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record3" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record4" into field "Title"
    And I enter value "Automation Notes4" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record6" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record7" into field "Title"
    And I enter value "Automation Notes7" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record7" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @220104 @220163 @ValidatePMEXEFOusercanAddeditdeletehisnotesonadirectedannouncementwhichisPublished @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate PM/EXE/FO user can Add/edit/delete his notes on a directed announcement which  is Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation PM  | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter "budget_Details_Subaward_Yes" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record3" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record4" into field "Title"
    And I enter value "Automation Notes4" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record6" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record7" into field "Title"
    And I enter value "Automation Notes7" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record7" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    #220163
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Published" and is "green"
    Then I softly cannot see row level action button "Edit" against "Notes Record4" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record4" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220110 @ValidatePMEXEFOusercanAddeditdeletehisnotesonaformulaannouncementwhichisRevised @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate PM/EXE/FO user can Add/edit/delete his notes on a formula announcement which  is Revised
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record1" into field "Title"
    And I enter value "Automation Notes1" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Status" as "Under Revision"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record3" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record4" into field "Title"
    And I enter value "Automation Notes4" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Status" as "Under Revision"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I click on "Edit" icon for "Notes Record6" inside flex table with id "---announcement:-:AnnouncementNotestableId---"
    And I enter value "Notes Record7" into field "Title"
    And I enter value "Automation Notes7" into field "Body"
    And I click on top right button "Save" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record7" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @220138 @ValidatePOusercanteditdeletenotesaddedbyPMuseronaapprovedcompetitiveannouncement @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PO user cant edit/ delete notes added by PM user on a approved competitive announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement for Pre-App"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:PM Username}  | Step 1       |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Files" sub tab
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220164 @ValidatePMPOusercantaddnotesbuteditdeletehisnotesoncompetitiveannouncementwhichisRejected @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PM/PO user cant add notes but edit/delete his notes on competitive announcement which is Rejected
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement for Pre-App"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes1|
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:PM Username}  | Step 1       |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Edit" :
     |Created By     | Title         | Description      |
     |Automation PM  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record3" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Edit" :
      |Created By     | Title         | Description      |
      |Automation PO  | Notes Record4 | Automation Notes4|
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record4" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @220165 @ValidateEXEFDusercantaddnotesbuteditdeletehisnotesondirectedannouncementcreatedbyPMwhichisRejected  @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate EXE/FD user cant add notes but edit/delete his notes on directed announcement created by PM which is Rejected
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation PM  | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter "budget_Details_Subaward_Yes" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "4" seconds
    And I "Reject" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Edit" :
      |Created By      | Title         | Description      |
      |Automation EXE  | Notes Record2 | Automation Notes2|
    Then I softly see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Edit" :
      |Created By      | Title         | Description      |
      |Automation FD   | Notes Record4 | Automation Notes4|
    Then I softly see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---announcement:-:AnnouncementNotestableId---"
    And I click on "Delete" icon for "Notes Record4" inside flex table with id "---announcement:-:AnnouncementNotestableId---" without waiting for record
    Then I softly do not see value "Notes Record4" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"

  @220169 @ValidateEXEFOusercantaddnotesoncompetitiveannouncementwhichisClosed @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate EXE/FO user cant add notes on competitive announcement which is Closed
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:CompetitiveClosedAnnoucement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:CompetitiveClosedAnnoucement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:CompetitiveClosedAnnoucement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:CompetitiveClosedAnnoucement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220170 @ValidatePMADMINusercantaddnotesondirectedannouncementwhichisClosed @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PM/ADMIN user cant add notes on directed announcement which is Closed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:ClosedStateAnnouncement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedStateAnnouncement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:ClosedStateAnnouncement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedStateAnnouncement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220171 @ValidateFDPOusercantaddnotesonformulaannouncementwhichisClosed @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate FD/PO user cant add notes on formula announcement which is Closed
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "{SavedValue:FormulaClosedAnnoucement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:FormulaClosedAnnoucement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "{SavedValue:FormulaClosedAnnoucement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:FormulaClosedAnnoucement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220175 @ValidatePMEXEADMINcantaddnotesonCompetitiveannouncementhavingstatusasArchived @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PM/EXE/ADMIN cant add notes on Competitive announcement having status as Archived
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:CompetitiveArchivedAnnoucement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:CompetitiveArchivedAnnoucement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:CompetitiveArchivedAnnoucement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:CompetitiveArchivedAnnoucement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:CompetitiveArchivedAnnoucement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:CompetitiveArchivedAnnoucement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220177 @ValidatePOFOFDcantaddnotesonDirectedannouncementhavingstatusasArchived @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PO/FO/FD cant add notes on Directed announcement having status as Archived
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:DirectedArchivedAnnoucement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:DirectedArchivedAnnoucement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:DirectedArchivedAnnoucement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:DirectedArchivedAnnoucement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:DirectedArchivedAnnoucement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:DirectedArchivedAnnoucement}" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220178 @ValidatePMPOADMINcantaddnotesonFormulaannouncementhavingstatusasArchived @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate PM/PO/ADMIN cant add notes on Formula announcement having status as Archived
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220179 @ValidateAuditorusercantaddnotesoncompetitiveannouncementwhichisPublished @sprint-9-US-201923 @hitesh @Notes
  Scenario:Validate Auditor user cant add notes on competitive announcement which is Published
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement for Pre-App"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:PM Username}  | Step 1       |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220180 @ValidateuserwithAuditorprofilecantaddnotesondirectedannouncementwhichisapproved  @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate user with Auditor profile cant add notes on directed announcement which is approved
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation PM  | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter "budget_Details_Subaward_Yes" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "Record id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220182 @ValidateuserwithAuditorprofilecantaddnotesonformulaannouncementwhichissubmittedforapproval @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate user with Auditor  profile cant add notes on formula announcement which is submitted for approval
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementNotestableId---" by clicking "Add" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---announcement:-:AnnouncementNotestableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---announcement:-:AnnouncementNotestableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @220166 @ValidateFOADMINPOusercantaddnotesonformulaannouncementwhichcreatedbyPO&isRejected @sprint-9-US-201923 @hitesh @Notes
  Scenario: Validate FO/ADMIN/PO user cant add notes on formula announcement which created by PO & is Rejected
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:PO Username}  | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
