@preAplicationWB @regression @app
Feature: Pre-Application scenarios without background

  @70252 @70254 @verifyCreateApplicationandQualifyButtons
  Scenario: Verify whether SPI user is able to qualify opportunity a Pre-Application| Verify Create Pre- Application button is displayed to SR User when User click on Qualify Button.
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    Then I softly see that "Automation Announcement for Pre-Application" is in "Qualified" status
    Then I softly can see top right button "Create Pre-Application" in page detail
    Then I collect all the soft asserts

  @70253 @spaUserCannotSubmitanPre-application
  Scenario: Validate the SPA users should not be able to Submit the Pre Application
    Given I am on "SUBPORTAL" portal
    And I login as "SPA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    Then I cannot see top right button "Submit Application" in page detail

  @70660 @70661 @70662 @preApplRequiredIsYesAnnouncementCreation @deepika
  Scenario: Validate whether the User is able to create a Pre Application only when the Opportunity setting for Pre Applciation Required (Yes) |
  Validate whether User is able to view the following error message "Reached the Maximum number of Applications" when the limit has been reached.
  Validate whether User is able to view the Leverage column in the budget grid when the value set as Yes.
    Given I delete the record "Automation Pre-App Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I enter "Edition2" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Given I delete the record "Automation Pre-App Announcement" from the object "Application"
    When I delete the record "Automation Pre-App Announcement" from the object "PreApplication"
    And I delete the record "Automation Pre-App Announcement" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Pre-App Announcement" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Pre-App Announcement" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    Then I softly see that "Automation Pre-App Announcement" is in "Qualified" status
    Then I softly can see top right button "Create Pre-Application" in page detail
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Pre-App Announcement" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    Then I softly see field "Other Leverage" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I click on "Submit to Grantor" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "Automation Pre-App Announcement" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "Automation Pre-App Announcement" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Then I collect all the soft asserts

  @70663 @preApplRequiredIsNoAnnouncementCreation @deepika
  Scenario: Validate whether the User is able to create Pre Application only when the Opportunity setting for Pre Application (No)
  Validate whether the user can submit the Pre Application Submission before the due date
    Given I delete the record "Automation Competitive Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Announcements - All"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Competitive Announcement" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Competitive Announcement" inside table
    When I click on "Qualify" in the page details
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Announcements - All"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Unpublish" in the page details
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I perform quick search for "Automation Competitive Announcement" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    Then I softly do not see "Automation Competitive Announcement" has been added in "---applicationIntake:-:publishedOpputunityTableId---" flex table
    Then I collect all the soft asserts

  @preappDueDateValidation @deepika
  Scenario: Validate whether User will be able to submit the pre- application on the last date for submission.
  Validate once the Announcement is published and Pre-Application is in created status, later the announcement is unpublished then the User will not be able to see the Submit to Grantor on pre-application
    Given I delete the record "Automation Competitive Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
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
    When I click on "Edit" in the page details
    And I enter "PreAppDueDate" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "PreApplication Due Date" is getting updated with todays date
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Competitive Announcement" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Competitive Announcement" inside table
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Pre-Application" in page detail
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Announcements - Published"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Unpublish" in the page details
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "Automation Competitive Announcement" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "Automation Competitive Announcement" inside table
    Then I softly cannot see top right button "Submit to Grantor" in page detail
    Then I collect all the soft asserts

