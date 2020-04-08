@preAplicationWB @regression @app
Feature: Pre-Application scenarios without background

  @70252 @70254 @71410 @71411 @71412 @71921 @71925 @verifyCreateApplicationandQualifyButtons
  Scenario: Verify whether SPI user is able to qualify opportunity a Pre-Application| Verify Create Pre- Application button is displayed to SR User when User click on Qualify Button.
  Validate whether user is able to view the qualify button and qualify the opportunity before creating the pre-application
  Validate the user is able to create Pre Application only when the Opportunity setting for Pre Applciation Required (Yes)
  Validate whether User will be able to enter the required information for the creation on Pre Application before the Due date
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "SPA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    Then I softly do not see value "Automation Announcement for Pre-Application" for title "Title" inside table "---applicationIntake:-:activeOpportunitiesTableId---"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    Then I softly see field "Pre-Application Required?" as "Yes"
    Then I softly see field "Application Due Date" contains date less than todays date
    Then I softly can see top right button "Qualify" in page detail
    When I click on "Qualify" in the page details
    Then I softly see that "Automation Announcement for Pre-Application" is in "Qualified" status
    Then I softly can see top right button "Create Pre-Application" in page detail
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    Then I softly see value "Automation Announcement for Pre-Application" for title "Title" inside table "---applicationIntake:-:qualifiedTableId---"

  @70253 @72575 @75595 @spaUserCannotSubmitanPre-application
  Scenario: Validate the SPA users should not be able to Submit the Pre Application | Validate whether SPI user can continue to proceed without providing application title while creating a pre-application
  Validate whether users from other organizations will be able to create Pre-Applications
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    And I login as "SPA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I clear the value from field "Title__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Pre-Application Title is Required to save. |
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
    Then I softly cannot see top right button "Submit Application" in page detail
    Given I am on "SUBPORTAL" portal
    And I login as "SA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Pre-Application" in page detail

  @70660 @70661 @70662 @72623 @preApplRequiredIsYesAnnouncementCreation @deepika @smoke
  Scenario: Validate whether the User is able to create a Pre Application only when the Opportunity setting for Pre Applciation Required (Yes) |
  Validate whether User is able to view the following error message "Reached the Maximum number of Applications" when the limit has been reached.
  Validate whether User is able to view the Leverage column in the budget grid when the value set as Yes. |Validate the user  will be able to view the the Program Income field on the overview tab when the value set as Yes.
    Given I delete the record "Automation Pre-App Announcement" from the object "PreApplication"
    When I delete the record "Automation Pre-App Announcement" from the object "Application"
    And I delete the record "Automation Pre-App Announcement" from the object "Qualified Announcement"
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
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    Then I softly see field "Estimated Program Income For Project Period" inside page block
    And I navigate to "Budget" sub tab
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

  @70663 @preApplRequiredIsNoAnnouncementCreation @deepika
  Scenario: Validate whether the User is able to create Pre Application only when the Opportunity setting for Pre Application (No)
    Given I delete the record "Automation Announcement for Application Intake and PreApplication" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncementforApp" values from "Announcement_Field_Values.xlsx"
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
    And I perform quick search for "Automation Announcement for Application Intake and PreApplication" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Intake and PreApplication" inside table
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
    And I perform quick search for "Automation Announcement for Application Intake and PreApplication" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    Then I softly do not see "Automation Announcement for Application Intake and PreApplication" has been added in "---applicationIntake:-:publishedOpputunityTableId---" flex table

  @71114 @71115 @preappDueDateValidation @deepika
  Scenario: Validate whether User will be able to submit the pre- application on the last date for submission.
  Validate once the Announcement is published and Pre-Application is in created status, later the announcement is unpublished then the User will not be able to see the Submit to Grantor on pre-application
    Given I delete the record "Automation Announcement for Application Intake and PreApplication" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncementforApp" values from "Announcement_Field_Values.xlsx"
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
    And I perform quick search for "Automation Announcement for Application Intake and PreApplication" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Intake and PreApplication" inside table
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Pre-Application" in page detail
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application Intake and PreApplication" into field "Title__c"
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
    And I perform quick search for "Automation Announcement for Application Intake and PreApplication" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Intake and PreApplication" inside table
    Then I softly cannot see top right button "Submit to Grantor" in page detail

  @71413 @userCannotCreatePreAppWhenSettingIsNo @deepika
  Scenario: Validate whether User is able to create Pre Application only when the Opportunity setting for Pre Application (No)
    Given I delete the record "Automation Announcement for Application Intake" from the object "Application"
    And I delete the record "Automation Announcement for Application Intake" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Intake" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Intake" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly see field "Pre-Application Required?" as "No"
    When I click on "Qualify" in the page details
    Then I softly cannot see top right button "Create Pre-Application" in page detail

  @34154 @72515 @72516 @72518 @72519 @72520 @preapplicationInformationCopiedToApplication @deepika
  Scenario: Validate the Pre Application information is copied to Application | Validate whether user is able toa cknowledge the application submission by entering the mandatory details.
  Validate the Match Percentage validation during submit for approval when the Match required setting as Yes | Validate when the pre-application is submitted to grantor then the pending task is created for PM user
  Validate the once the PM user accepts the pre-application when is submitted to grantor using the pending task, then the task moved from pending to Completed task table
  Validate other than record Owner Pm , other users will not be to Accept submitted Pre-Application
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "Subaward Floor" as "subawardfloor"
    And I save the field labeled "Subaward Ceiling" as "subawardcieling"
    And I save the field labeled "Match Required?" as "matchrequired"
    And I save the field containing "Match Required?" as "No"
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Enter an Acknowledgement before submitting this Pre-Application. |
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "Checked" into field "Agreement5__c"
    And I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Requested Amount should be greater than or equal to Subaward Floor Amount.                         |
      | Budget Tab - Enter budget details for the first budget period before submitting a Pre-Application to the Grantor. |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    Then I softly see "Record Id" has been added in "---preApplication:-:pendingTaskTableId---" flex table
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Accept" in the page details
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:preappCompletedTasksTableId---" panel
    Then I softly see "Record Id" has been added in "---preApplication:-:preappCompletedTasksTableId---" flex table
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "Automation Announcement for Application" in "RecipientPreApplications" panel
    When I click on "View" icon for "Automation Announcement for Application" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see selected element "{SavedValue:subawardfloor}"
    Then I softly see selected element "{SavedValue:subawardcieling}"
    Then I softly see selected element "{SavedValue:matchrequired}"

  @72522 @preapplicationQualifiedIsAddedToTheTable @deepika @smoke
  Scenario: Validate once Application is qualified then user can view the Qualified Application from Qualfied Table and it is removed from Non -yet qualified table
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:qualifiedTableId---" panel
    Then I softly see value "Automation Announcement for Pre-Application" for title "Opportunity Name" against the value "Qualified" inside table "---applicationIntake:-:qualifiedTableId---"
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    Then I softly do not see "Automation Announcement for Pre-Application" has been added in "---preApplication:-:notYetQualifiedTable---" flex table

  @72576 @75866 @72344 @75865 @preApplicationSubmittedToGrantorPendingTask @productBusinessFlowSanity
  Scenario: Validate once the Grantor accepts the submitted pre-application then the changes status to Accepted | Validate whether user can change the pre-application due date while creating the pre-application
  Validate whether pre-application title field is editable while creating the pre-application | Validate whether the Announcement owner receives an email notification when the pre-application is submitted to grantor |
  Validate whether the external user recieves an email notification when the pre-application is accepted by the grantor
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnId"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "200" seconds
    Then I softly can see mail notification for "INTERNAL" user with following subject:
      | Pre-Application Submitted for Announcement by SAN DIEGO ELECTRICAL TRAINING TRUST |
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Accept" in the page details
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    And I pause execution for "200" seconds
    Then I softly can see mail notification for "EXTERNAL" user with following subject:
      | Pre-Application Automation Announcement for Application for Announcement has been Accepted |

  @72523 @SPIUserCannotdeleteTheCreatedPreApplication
  Scenario Outline: Validate whether SPI/SPA user has the ability to delete the created pre-Application
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "Automation Announcement for Application" in "RecipientPreApplications" panel
    Then I cannot see row level action button "Delete" against "Automation Announcement for Application" in flex table with id "RecipientPreApplications"
    Examples:
      | User |
      | SPI  |
      | SPA  |

  @72524 @34048 @OppurtunityFieldsARENOtEditableInDraftStatus
  Scenario: Validate whether user can edit the Opportunity Overview page block fields when the pre-application is in draft status |Validate whether SPI & SPA users are able to view the qualified and created Status of Qualified Pre-Application
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Opportunity Title" is not editable
    Then I softly see field "Opportunity Type" is not editable
    Then I softly see field "Pre-Application Due Date" is not editable
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    Then I softly see that "Automation Announcement for Pre-Application" is in "Qualified" status
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "Automation Announcement for Pre-Application" in "RecipientPreApplications" panel
    Then I softly see that "Automation Announcement for Pre-Application" is in "Created" status

  @72625 @errorMessageOfPreApplicationDueDate @deepika
  Scenario: Validate whether system generates an error message when Pre Application Due Date is greater than Application Due Date while submitting information
    Given I delete the record "Automation Announcement for Application Intake and PreApplication" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncementforApp" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I enter value "30" into field "fieldApplicationDueDate__c"
    And I enter value "40" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Pre-Application Due Date cannot be after Application Due Date |

  @34290 @otherOrganizationUserCannotViewPreApplication @deepika
  Scenario: Validate the Pre-applications are not visible for other organizations
    When I am on "SUBPORTAL" portal
    And I login as "SA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"

  @34006 @preApplicationVisibity @deepika
  Scenario Outline: Validate the Pre-applications are visible for their own organization and for child organizations. |
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see that "Automation Announcement for Pre-Application" has been added in flextable with Id "---applicationIntake:-:activeOpportunitiesTableId---"
    Examples:
      | User |
      | SPI  |
      | SPA  |

  @34147 @validateRequestedAmountIsGreateThanSubawardFloorAmount @deepika
  Scenario: Verify SPI & SPA user is not able to Submit Pre-Application to Grantor with Requested Amount greater than Subaward Floor Amount
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 1000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Requested Amount should be greater than or equal to Subaward Floor Amount. |

  @73866 @73870 @qualifyAnnSPAUser @jitendra
  Scenario: To verify user allow to view Qualified opportunity  in opportunity tab
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I get the "EGMS ID"
    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:qualifiedOpprtunitesTableId---" panel
    Then I softly see value "Automation Announcement for Pre-Application" for title "Opportunity Name" inside table "---preApplication:-:qualifiedOpprtunitesTableId---"
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    Then I softly see field "Status" as "Qualified"

  @34045 @editCreatedApplication @deepika
  Scenario Outline: Verify SPI & SPA user (Record owner of Application) is able to edit created Application
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "Automation Announcement for Pre-Application" in "RecipientPreApplications" panel
    Then I can see row level action button "Edit" against "Automation Announcement for Pre-Application" in flex table with id "RecipientPreApplications"
    Examples:
      | User |
      | SPI  |
      | SPA  |

  @73518 @focusAreaSettingAsNoWhileAnnouncementCreation @deepika @wip
  Scenario: Validate when the focus area setting from the funding opportunity is No, then SPI User should be able to view the focus area settings as No and cannot see the page block
    Given I delete the record "Automation Pre-App Announcement" from the object "Application"
    When I delete the record "Automation Pre-App Announcement" from the object "PreApplication"
    And I delete the record "Automation Pre-App Announcement" from the object "Qualified Announcement"
    Given I delete the record "Automation Pre-App Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation of Second Modal" values from "Announcement_Field_Values.xlsx"
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
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Pre-App Announcement" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Pre-App Announcement" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Pre-App Announcement" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I cannot see page block "Focus Area"

  @33998 @34353 @35054 @validateListOfSubmittedApplication @deepika
  Scenario: Verify when SPI (Record owner of Pre-Application) submit the Pre-Application to Grantor then it is displayed in the list of Submitted Pre-Applications and disappeared from the list of Not yet qualified Opputunities
  Verify if the opportunity has only one focus area, then the application budget periods are automatically associated to that focus area |
  Validate whether SPI user can edit the pre-application once it is submitted to grantor.
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I navigate to "Performance" sub tab
    Then I softly can see page block "Focus Areas"
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Area" page block displayed
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---preApplication:-:notYetQualifiedTable---"
    When I navigate to "Applications" sub tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---preApplication:-:recipientPreApplicationsTableId---"

  @75962 @75963 @34156 @75964 @preAppHistoryFieldGetUdated @deepika @skipOnJenkins
  Scenario: Validate History Field is getting updated for PM user when Pre Application status is Submitted to Grantor.| Validate the History field is getting updated when internal user accepts the pre-application
  Validate whether the Internal user is able to view the Snapshot after Pre-Application is Submitted to Grantor status | Validate whether spi user can view the snapshot once the pre-application is submitted to grantor
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnId"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Pre-Application" as name
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "History" sub tab
    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"
    When I click on "Accept" in the page details
    Then I softly see value "Accepted" for title "New Value" inside table "History"
    And I softly see value "Submitted to Grantor" for title "Old Value" inside table "History"
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    And I click on hyperlink containing value "Submission"
    When I download the file
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @34146 @preAppCannotBeSubmittedWithZeroAmount @deepika
  Scenario: Verify SPI user is not able to Submit Pre-Application to Grantor with zero budget/requested amount
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I navigate to "Performance" sub tab
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 0      | 0          | 0              | 0              |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Requested Amount should be greater than or equal to Subaward Floor Amount.                         |
      | Budget Tab - Enter budget details for the first budget period before submitting a Pre-Application to the Grantor. |

  @76379 @spaCannotViewCreatedPreApplicationBySPI @deepika
  Scenario: Validate whether created Pre-Application by SPI user(Record owner of pre- Application)are visible for their child (SPA) organizations
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I navigate to "Performance" sub tab
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "Automation Pre-App Announcement" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I see "No Records Found" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"