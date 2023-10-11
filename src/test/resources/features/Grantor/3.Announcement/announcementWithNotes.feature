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
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10      | Yes                  |
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
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10      | No                  |
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
