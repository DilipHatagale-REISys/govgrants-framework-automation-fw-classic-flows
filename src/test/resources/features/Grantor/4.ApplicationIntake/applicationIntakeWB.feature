@applicationIntakeWB @grantor-regression @grantor-parallel-regression @app @regression @ApplicationExecution-reg @ApplicationClassic
Feature: Application Intake scenarios without background

  @76373 @69366 @65078 @VerifyCreateApplicationButton @keerti @smoke
  Scenario: Verify whether SPI user is able to qualify opportunity | Verify Create Application button is displayed to SR User when User click on Qualify Button.
  Validate whether SPI has access to 'Not yet Qualified' list view
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    Then I softly see that "{SavedValue:Automation Runtime Announcement Application Review}" has been added in flextable with Id "---applicationReview:-:reviewsTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Announcement Application Review}" is in "Qualified" status
    Then I softly can see top right button "Create Application" in page detail

  @70257 @73937 @73940 @73935 @73941 @70255 @70256 @spaUserCannotQualifyTheApplication @deepika
  Scenario: Validate as another SPI / SPA user should not be able to Qualify for the second time| Validate SPA user view the Create Application button in page details
  Validate SPA user can View the Qualified Application under 'Qualified' and not under 'Not Yet Qualified'
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---" without waiting for record
    And I click on "Qualify" in the page details
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:qualifiedTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Opportunity Name" inside table "---applicationIntake:-:qualifiedTableId---"
    When I click on advance filter "#advfqae" of table id "---applicationIntake:-:qualifiedTableId---"
    When I enter advance filter values inside id "advfqae"
      | Opportunity Name | Contains | {SavedValue:Automation Runtime Announcement Application Review} |
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Opportunity Name" inside table "---applicationIntake:-:qualifiedTableId---"
    When I enter advance filter values inside id "advfqae"
      | EGMS ID | Contains | Aatam123 |
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    And I refresh the page
    And I click toggle button to select "Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:qualifiedTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Opportunity Name" inside table "---applicationIntake:-:qualifiedTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    Then I softly cannot see top right button "Qualify" in page detail
    Then I softly can see top right button "Create Application" in page detail
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationReview:-:reviewsTableId---"

  @72579 @77380 @76374 @70258 @spaUsersCannotSubmitAnApplication @deepika
  Scenario: Validate the SPA users should not be able to Submit the Application | Validate whether SPI user can continue to proceed without providing application title while creating a application
  Validate whether user should be able to enter the required information for the creation  Application | Validate that the user is able to view the added setting while the creating an application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    When I clear the value from field "Title__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Application Title is required to save. |
    And I enter value "{SavedValue:Automation Runtime Announcement Application Review}" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Project Abstract" as "Automation application Project abstract"
    And I navigate to "Budget" sub tab
    Then I softly see field "Justification for Project Cost" as "Justified"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPA" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    Then I cannot see top right button "Submit Application" in page detail

  @70464 @userCannotQualifyApplicationSecondTime @deepika @wip @NotValid
  Scenario: Validate whether user should not able to qualify the announcement again for once it is Qualified
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    When I click on "Qualify" in the page details
    #requested manual qa to provide correct test steps
    Then I see the following messages in the page details :
      | This Opportunity has already been qualified for your Organization. |

  @70463 @73366 @70462 @userCanEnterBudgetDetailsApplTitleasOppurtunityTitleField @deepika
  Scenario: To verify that the budget field is editable for the Subrecipient (SPI User) under budget tab on Application | Validate the Application created date is updated with Today's date
  To verify that the Application title is enforced on the created application on overview tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Announcement Application Review}"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Created Date" is getting updated with todays date
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Construction" for title "Category Name" inside table "---applicationIntake:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$1,300.00" for title "Total Project Cost" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @70460 @70461 @goalsAndObjectivesInApplication @deepika
  Scenario: To Verify that the Goals and Objectives are not editable and are added by default associated to the Application should be displayed correctly
  To validate that the Mini page layout appear when mouse is hovered to the link in Application and takes to associated Program
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "oppurtunityId"
    And I save the field labeled "Program" as "programName"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Proposal" sub tab
    Then I softly see value "Automation Permanent Objective" for title "Title" inside table "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:goalsAndObjectivesTableId---" :
      | Title                          | Actions |
      | Automation Permanent Objective | View    |
    When I navigate to "Overview" sub tab
    And I mouse hover to link contains "{SavedValue:oppurtunityId}"
    And I click "{SavedValue:programName}" link present on hovered tooltip
    Then I softly see page title contains as "Automation Permanent Internal Program"

  @73755 @71110 @appdueDateValidation @deepika @smoke
  Scenario: Validate whether User will be able to submit the application on the last date for submission.| Validate once the announcement is published, then it will be availble for external SPI/SPA users under Oppurtunities Tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for App Intake and PreApp" and properties "TODAY_APP_DUE_DATE"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I get the "EGMS ID"
    Then I softly see field "Application Due Date" is getting updated with todays date
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    Then I softly see "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside flex table with id "---applicationIntake:-:publishedOpputunityTableId---"
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside table
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Application" in page detail

  @71104 @72578 @72624 @77151 @77152 @71107 @71109 @71108 @unpublishedAnnouncementCannotSubmitApplication @deepika @buglogged113216 @buglogged113230
  Scenario: Validate once the Announcement is published and Application is in created status, later the announcement is unpublished then the User will not be able to see the Submit Application
  Validate whether the Applicant will be able to view qualify button on the same funding opportunity after republish
  Validate whether the Applicant will be able to create a New Application from the republish announcement and oppurtunity |Validate whether the Applicant will be able to Submit the New Application from the republish announcement and oppurtunity
  Validate whether User will be able to see the Unpublished status on the Application | Validate whether when the user click on unpublish button of announcement status of announcement changes to created and SPI user cannot see announcement at external side
  Validate all Applications owner (SPI) will be notified about the unpublish | Validate User will not be able to Qualify the Funding Opportunity when  the Funding Opportunity becomes unpublished{SavedValue:Automation Runtime Announcement for App Intake and PreApp}
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for App Intake and PreApp" and properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I get the "EGMS ID"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Unpublish" in the page details
    And I save the field labeled "EGMS ID" as "Under Revision"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I pause execution for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "Record Id" in "---announcement:-:NotYetQualifiedTableId---" panel
    Then I softly do not see value "Record Id" for title "Announcement ID" inside table "---announcement:-:NotYetQualifiedTableId---"
      # This is bug - 77149
    #When I pause execution for "120" seconds
    #Then I softly can see mail notification for "EXTERNAL" user with following subject:
    #  | Announcement {SavedValue:unpublished} has been Unpublished |
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---applicationIntake:-:qualifiedTableId---" panel
    And I wait for "1" seconds
   # When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside table without waiting for record
   # Then I softly cannot see top right button "Qualify" in page detail
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter values into fields
      | Value | Field                           |
      | Test  | fieldAnnouncementDescription__c |
    And I navigate to "Financials" sub tab
    And I enter values into fields
      | Value | Field                 |
      | Test  | fieldJustification__c |
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 3       |
    And I pause execution for "3" seconds
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
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---" without waiting for record
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "Green"

  @71112 @71113 @appDueDateValidation @deepika
  Scenario: Validate the Application Submission before the due date | Validate whether the application due date on Announcement is reflecting same while creating an application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for App Intake and PreApp" and properties "TODAY_APP_DUE_DATE"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    When I get the "EGMS ID"
    And I save the field containing "Application Due Date" as "AppDueDate"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for App Intake and PreApp}" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "Application Due Date" as "ApplDueDate"
    Then I softly see that the saved value "{SavedValue:AppDueDate}" and "{SavedValue:ApplDueDate}" are equal
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I see status in Progress-bar is "Submitted" and is "Green"

  @71408 @71488 @71490 @71489 @preApplicationSettinsAsNowhileAnnouncementCreation @deepika
  Scenario: Validate whether user is able to create Application only when the Opportunity setting for Pre Application (No)
  Validate whether User will be able to view the Match column in the budget grid when the value set as Yes
  Validate whether User will be able to view the Leverage column in the budget grid when the value set as Yes.
  Validate whether User should be able to view the focus area page block when the focus are is sett as Yes while announcement creation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    Then I softly see field "Leverage Allowed?" as "Yes"
    Then I softly see field "Pre-Application Required?" as "No"
    Then I softly see field "Focus Area Required?" as "Yes"
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Match Required?" as "Yes"
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary by Focus Area"
    When I expand nested table containing column value "BP01"
    Then I softly see all values "$0.00" under column "Total Match" inside flextable with id "---applicationIntake:-:budgetPeriodTableId---"
    And I softly see all values "$0.00" under column "Other Leverage" inside flextable with id "---applicationIntake:-:budgetPeriodTableId---"

  @72305 @72306 @isKeyContactWhileCreatingApplication @deepika
  Scenario: Validate whether user can see a Sucess message after making the Contact User a Is key Contact and associate the Project Role
  Validate whether user can change the address in Primary place of Performace while creating an Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:NotYetQualifiedTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I clear the value from field "Addressline1__c"
    And I enter "AddressValues" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Address line 1" as "Sterling"
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

  @72307 @34330 @newApplicationOncetheOppurtunitySubmittedToGrantor @deepika
  Scenario: Validate whether user is able to create a new/multiple applications from same Oppurtunity once it is Converted to an Application | Verify snapshot is not added to the Snapshot History after Application is submitted to Grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:NotYetQualifiedTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Proposal" sub tab
    Then I softly cannot see page block "Work Plan"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---" without waiting for record
    Then I softly can see top right button "Create Application" in page detail
    When I navigate to "Performance" sub tab
    Then I softly verify that field "Automation Permanent Objective" is not editable by entering "Select" value
    When I navigate to "History" sub tab
    Then I softly cannot see field "Snapshot History" inside page block

  @72308 @77658 @34324 @72309 @userCanEditApplicationInCreatedStatusAndCannotInSubmitTedStatus @deepika
  Scenario: Validate whether the User can view the edit icon for the application that is in Created Status and Submiited to Grantor Status
  Validate whether SPI user have delete access to delete the Application that is in Created Sttaus
  Verify SPI & SPA user is not able to Submit Application to Grantor with Requested Amount is less than or equal to the Subaward Floor Amount
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:NotYetQualifiedTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationIntake:-:recipientApplications---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I click on "Submit Application" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationIntake:-:recipientApplications---"

  @72511 @SPIUserCannotdeleteTheCreatedApplication
  Scenario: Validate whether SPI user has the ability to delete the created Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:recipientApplications---" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Announcement Application Intake}" in flex table with id "---applicationIntake:-:recipientApplications---"

  @72512 @72513 @75965 @75966 @matchPercentageIFsetAsYES @deepika @skipOnJenkins
  Scenario: Validate the Match Percentage validation during submit for approval when the Match required setting as Yes | Validate if user submits the application without one key personal contact details then the system should throw an error message|
  Validate History Field is getting updated for PM user when Application status is Submitted to Grantor | Validate whether the Internal user is able to view the Snapshot after Application is Submitted to Grantor status
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field containing "Match Required?" as "Yes"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - To submit this application, provide the match details (Cash Match/Non-Cash Match).    |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                       |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                 |
      | Overview Tab - Specify at least one key Personnel for Application in contacts/key personnel table. |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    When I navigate to "History" sub tab
    Then I softly see value "Submitted to Grantor" for title "New Value" inside table "History"
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I click on hyperlink containing value "Submission"
    When I download the file
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @33799 @createdANDQualifiedApplication @deepika
  Scenario: Validate whether SPI & SPA users are able to view the qualified and created Statuses
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see that "{SavedValue:Automation Runtime Announcement Application Intake}" is in "Created" status

  @73283 @otherOrganizationUserCannotViewApplication
  Scenario: Validate the Aplications are not visible for other organizations Users
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    And And I login to "Grants Portal" app as "SA" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:recipientApplications---"

  @73284 @applicationVisibity
  Scenario Outline: Validate the Applications are visible for their own organization and for child organizations.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:recipientApplications---" panel
    Then I see "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    Examples:
      | User |
      | SPI3 |
      | SPA  |

  @34315 @appDueDatepassed @deepika @needStaticRecordsForThis
  Scenario Outline: Validate SPI & SPA user is not able to Create an Application if Application Due Date is passed
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "---AUTOEnvData:-:Automation_Formula_Closed_Announcement_By_Applicant---" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:Automation_Formula_Closed_Announcement_By_Applicant---" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I save the field containing "Application Due Date" as "Date"
    Then I softly see field "Application Due Date" contains date less than todays date
    Then I softly cannot see top right button "Create Application" in page detail
    Examples:
      | User | Key User        |
      | SPI3 | Automation SPI3 |
      | SPA  | Automation SPA  |

  @73367 @spiUserCanViewAllocatedAmountOnceSubmittedToGrantor @deepika @buglogged129432
  Scenario Outline: Validate whether SPI & SPA user were able to view the allocated amount once the Oppurtunity is Converted to Application when Announcement is of type - Formula
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" and properties "BY_APPLICANT"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside table without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Proposal" sub tab
    Then I softly cannot see page block "Work Plan"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "<userType>" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside table without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field containing "Type" as "Formula"
    And I navigate to "Financials" sub tab
    Then I see value "$1000" for title "Allocation Amount" inside table "---applicationIntake:-:formulaAllocatedAmountTableId---"
    Examples:
      | User | userType        |
      | SPI3 | Automation SPI3 |

  @73516 @73517 @supportingDocValidationOnApplication @deepika @needSupportingDocuSupportInAPI
  Scenario: Validate whether User will be able to attach any document if the supporting document details mentioned in the Announcement
  Validate if suppoting document is not uploaded by user while submitting the application then the system should throw an error message on screen
  Validate user will be able to view and add additional focus areas while creating an application only when the published announcemnt has additional focus areas
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PROGRAM_FOR_PREAPP_SUPP_DOC_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    #When I perform quick search for "Automation Permanent Focus Area" in "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" panel
    Then I softly see that "Automation Permanent Focus Area" has been added in flextable with Id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    #IssueisResolveNeedtocheckforthisscenario #checktagabove
    Then I softly see the following messages in the page details contains:
      | Attachments Tab - Each mandatory item listed in the checklist must be completed before submitting this Application. |
    When I navigate to "Forms and Files" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents"
    Then I softly see "Supporting Documents" has been added in "Attachments" flex table

  @73750 @73751 @validateFilterCriteriaForGoalsAndObjectives @deepika
  Scenario: Validate the searched functionality for goals and Objectives Associated in section of Performance tab in Application | Validate the filter criteria for Goals and Objectives in Proposal Tab while creating Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Announcement Application Review}" is in "Qualified" status
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Proposal" sub tab
    And I save the value from row "1" for column name "Title" as "SavedTitle" from flex table "---applicationIntake:-:goalsAndObjectivesTableId---"
    #And I perform quick search for "{SavedValue:SavedTitle}" in "---applicationIntake:-:goalsAndObjectivesTableId---" panel
    Then I softly see value "{SavedValue:SavedTitle}" for title "Title" inside table "---applicationIntake:-:goalsAndObjectivesTableId---"

  @73753 @announcementInApprovedStatusWillNotBeAOppurtunity @deepika
  Scenario: Validate if the announcment is in Approved status and not published status then the record will not be available for SPI/SPA users under oppurtunity
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
    And I enter "AppDueDate" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
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
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "flexGridAnnouncementChecklists" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Automation  | Mandatory | Application | Active |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "AnnouncementId"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnouncementId}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnouncementId}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnouncementId}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnouncementId}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnouncementId}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnouncementId}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnouncementId}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"

  @73818 @73820 @73821 @75505 @directedPublishedAnnouncementUnderOppurtunitiesTab @deepika
  Scenario: Validate whether SPI user is able to view the Directed Announcement under Oppurtunities Tab once it is published | Validate whether the SPI user can qualify and create the Application from published Directed Announcement
  Validate Opportunities created from 'Directed Announcements' are available for qualification for users for all Invited Applicants |
  Validate other than invited applications, other users cannot view the Published announcement under oppurtunities when selected announcement of type Directed
    Given I published "Directed" type announcement having name "Automation Runtime Directed Announcement" and properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Directed Announcement}" in "ActiveFundingOpportunities" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Directed Announcement}" inside flex table with id "ActiveFundingOpportunities"
    And I get the "EGMS ID"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Directed Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see "{SavedValue:Automation Runtime Directed Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Directed Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Directed Announcement}" is in "Qualified" status
    Then I softly can see top right button "Create Application" in page detail
    #bug
#    When I re-login as "SA" user on "SUBPORTAL" portal
#    And I navigate to "Opportunities" tab
#    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
#    When I click toggle button to select "Not Yet Qualified Opportunities - All"
#    And I perform quick search for "{SavedValue:Automation Runtime Directed Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
#    Then I softly see "{SavedValue:Automation Runtime Directed Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
#    When I click on "View" icon for "{SavedValue:Automation Runtime Directed Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
#    When I click on "Qualify" in the page details
#    Then I softly see that "{SavedValue:Automation Runtime Directed Announcement}" is in "Qualified" status
#    Then I softly can see top right button "Create Application" in page detail
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Directed Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"

  @73822 @73823 @75503 @75504 @formulaPublishedAnnouncementUnderOppurtunitiesTab @deepika
  Scenario: Validate whether SPI user is able to view the Formula Announcement under Oppurtunities Tab once it is published |Validate whether the SPI user can qualify and create the Application from published Formula Announcement
  Validate all the invited applicants can view the published announcement under Oppurtunities when selected announcement of type Formula| Validate other than invited applications, other users cannot view the Published announcement under oppurtunities when selected announcement of type Formula
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "ActiveFundingOpportunitiesFormula" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "ActiveFundingOpportunitiesFormula"
    When I get the "EGMS ID"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Formula Announcement}" is in "Qualified" status
    Then I softly can see top right button "Create Application" in page detail
    #bug
#    When I login to "Grants Portal" app as "SA" user
#    And I navigate to "Opportunities" tab
#    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
#    When I click toggle button to select "Not Yet Qualified Opportunities - All"
#    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
#    Then I softly see "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
#    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
#    When I click on "Qualify" in the page details
#    Then I softly see that "{SavedValue:Automation Runtime Formula Announcement}" is in "Qualified" status
#    Then I softly can see top right button "Create Application" in page detail
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"

  @75496 @qualifySuccessMessage @deepika @wip @notValid
  Scenario:  Validate user will be able to view the success message for qualification.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    Then I softly see the following messages in the page details contains:
      | Application is successfully qualified |

  @75501 @75502 @otherOrgUserCanAlsoQualifyAndCreateApplication @deepika
  Scenario: Validate Opportunities created from 'Competitive Announcements' are available for all External users under Oppurtunities
  Validate Opportunities created from 'Competitive Announcements' are available for all external users and can qualify and create the Applications
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    Then I softly see "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---" without waiting for record
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Announcement Application Review}" is in "Qualified" status
    Then I softly can see top right button "Create Application" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Announcement Application Review}" is in "Qualified" status
    Then I softly can see top right button "Create Application" in page detail

  @34017 @34291 @focusAreaSettingAsNO @deepika
  Scenario: Validate when the funding opportunity  has focus area setting as No then the  User will not be able to view the focus area section when creating the Application
  Validate whether the user is able to Edit the budget category while creating an Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "FOCUS_AREA_NO"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly cannot see page block "Focus Area"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 0          | 0              | 0              |
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$1,000.00" for title "Budget" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"

  @34322 @zeroBudgetRequestedAmount @deepika
  Scenario: Verify SPI user is not able to Submit Application to Grantor with zero budget/requested amount
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 0      | 0          | 0              | 0              |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                                |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                                  |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                            |

  @76376 @76378 @contactAssociationforApplication @deepika
  Scenario Outline: Validate whether SPI user is allowed to add contacts while creating an Application | Validate whether created Application by SPI user(Record owner of Application)are visible for their child (SPA) organizations
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:NotYetQualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:NotYetQualifiedTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I click "Add" after selection of "Automation SPA" by showing entries "All" in flex table with id "---applicationIntake:-:associateNewContactsTableId---"
    And I refresh the page
    Then I see that "<Contact>" has been added in flextable with Id "---applicationIntake:-:applicationContactsTableId---"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    Examples:
      | Contact        |
      | Automation SPA |

  @77044 @34324 @requestedAmountMustBeLessThanCelingAmount @deepika
  Scenario: Verify SPI & SPA user is not able to Submit Application to Grantor with Requested Amount less than Subaward Floor Amount |
  Validate when the supporting documents  checklist are not entered by Announcement owner then Applicant will not be able to upload any document while submitting the application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I pause execution for "5" seconds
    #77044
   # Then I softly see "No records found" inside flex table with id "---applicationIntake:-:supportedDocumentsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |

  @77046 @77045 @77047 @77048 @budgetGridColumnValidation @deepika
  Scenario: Validate the SPI cannot view the Goals and Objectives page block when it is set as No while Announcement creation| Validate the SPI cannot view the Work Plan required page block when it is set as No while Announcement creation
  Validate whether SPI user can submit the application without adding supporting documents when the required documents are optional |
  Validate when the Funding Opportunity Detailed budget Grid Setup as Yes then User will be able to view the Bulid up Line in the Budget Grid
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Proposal" sub tab
    Then I softly cannot see page block "Work Plan"
   # Then I softly cannot see page block "Goals and Objectives"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "Green"

  @77585 @expiredApplicationErrorMessage @deepika
  Scenario: Validate user should not be able to Qualify on the Closed opportunity and an error message is displayed as "Funding Opportunity Cannot be Qualified after Deadline"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Expired"
    And I perform quick search for "Automation Runtime Announcement Application106771" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Automation Runtime Announcement Application106771" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | An Application cannot be submitted after the Application Due Date. |

  @77657 @snapshotHistoryApplication @deepika @skipOnJenkins
  Scenario: Validate whether SPI user will be able to take the snapshot on page when the Application is in Created status and is saved under snapshot history
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Snapshot on"
    When I download the file
    Then I see "Created" on page "1" of "govgrants" pdf file

  @195250 @ValidateapplicationrelatedpendingtaskshouldgeneratedfornewAnnownerifapplicationcreatedfromoldownerevenAnnownershiptaskreassigntootheruser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate application related pending task should generated for new Ann owner if application created from old owner even if Ann ownership task reassign to other user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    When I click on "Edit" in the page details
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    Then I softly do not see value "{SavedValue:AppEGMSID}" for title "EGMS ID" inside table "---negotiation:-:phasePendingTasksTableId---"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---applicationReview:-:announcementListTableId---"

  @196695 @ValidateAppApplicationistransfertonewuserafterAnnownershipwillgetchangewithsettingpre-appasYes @sprint-4-US-197579 @vaibhav @reassignment
  Scenario: Validate App Application is transfer to new user after Ann ownership will get change with setting pre-app as 'Yes'
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see field "Other Leverage" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Accept" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "RecipientPreApplications" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see status in Progress-bar is "Created" and is "Green"

  @196705 @ValidateApp-RevNewPOownercaninitiateappreviewprocessrelatedAnnownerwillchangeownershipandassigntonewuser @sprint-4-US-197579 @vaibhav @reassignment
  Scenario: Validate App-Rev New PO owner can initiate app review process if it's related Ann owner will change ownership and assign to new user
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    Then I softly can see "Related Log" sub tab at view detail page

  @196715 @ValidateAppS\RSPIuserofapplicationownershouldnotchangeevenifappownershipchangeafterAnnownerwilgetchangeincreatedbyfield @sprint-4-US-197579 @vaibhav @reassignment
  Scenario: Validate App S\R SPI user of application owner should not change even if app ownership change after Ann owner will get change in created by field
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Title" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see field "Created by" as "Automation SPI3"

  @196713 @ValidateAppoldownercanonlyviewtheapplicationoncetheAnnownerchangehisownershipfromEXEtonewEXEuser @sprint-4-US-197579 @vaibhav @reassignment
  Scenario: Validate App old owner can only view the application once the Ann owner change his ownership from EXE to new EXE user
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see row level action button "Edit" against "Automation SPI3" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    Then I softly cannot see row level action button "Edit" against "Automation Permanent KPI" in flex table with id "---applicationReview:-:kpiTableId---"

  @196756 @196759 @ValidateApp-RevNewEXEownercaninitiateappreviewprocessifitsrelatedAnnownerwillchangeownershipandassigntonewuser @sprint-4-US-197579 @vaibhav @reassignment
  Scenario: Validate App-Rev New EXE owner can initiate app review process if it's related Ann owner will change ownership and assign to new user
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    Then I softly can see "Related Log" sub tab at view detail page
    #196759
    Then I softly can see top right button "Extend Dates" in page detail
    Then I softly can see top right button "Unpublish" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---announcement:-:approversTableId---"
    When I navigate to "Related Log" sub tab
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:reviewStepsTableId---"

  @196855 @ValidateApp-RevnewAppownercanseerelatedlogtabafterAnnownershipwillgetchange @sprint-4-US-197579 @vaibhav @reassignment
  Scenario: Validate App-Rev new App owner can see 'related log' tab after Ann ownership will get change
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
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
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    Then I softly can see "Related Log" sub tab at view detail page

  @197064 @ValidateAppemailshouldbegeneratedfornewownerforAppifitrelatedAnnownershipassigntootheruser @sprint-4-US-197579 @vaibhav @reassignment
  Scenario: Validate App email should be generated for new owner for App if it's related Ann ownership assign to other user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Title" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly can see row level action button "Request Negotiation" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Application Negotiation {SavedValue:Automation Runtime Announcement Application Review} : Application {SavedValue:EGMSID} hasbeen Resubmitted by the Subrecipient
      """
    Then I see the mail text is as follows :

      """
      Hello,

      This email is to notify you that the Application {SavedValue:EGMSID} for the Announcement  {SavedValue:Automation Runtime Announcement Application Review} has been resubmitted for review by Automation SPI3.

      Log in to EGMS and click here to access the negotiation request.

      Please do not reply to this system-generated email. You may contact the Governates Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @235107 @234957 @DirectedAnnVerifyasSPIusercannotseeRecommendedbudgetfieldisvisibleunderbudgetsummarywhenAppstatusisCreatedSubmittoGrantor&ReviewinitiatedbeforeFDMstate @sprint-13-US-224176 @komal @Allocation
  Scenario Outline: Directed Ann_ Verify as SPI user can not see Recommended budget field is visible under budget summary when App status is Created, Submit to Grantor & Review initiated before FDM state
  | Competitive Ann_ Verify as SPI user can not see Recommended budget field is visible under budget summary when App status is Created, Submit to Grantor & Review initiated before FDM state |
    Given I published "<Announcement Type>" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    Then I see the header is "Application" in the page details
    When I navigate to "Budget" sub tab
    #235107 #234957
    Then I softly cannot see field "Recommended Budget" inside page block
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Budget" sub tab
    #235107 #234957
    Then I softly cannot see field "Recommended Budget" inside page block
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "3" seconds
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Budget" sub tab
    #235107 #234957
    Then I softly cannot see field "Recommended Budget" inside page block
    Examples:
      | Announcement Name                            | Announcement Type |
      | {SavedValue:Automation Runtime Announcement} | Directed          |
      | {SavedValue:Automation Runtime Announcement} | Competitive       |

  @219498 @219488 @219634 @219640 @DirectedAnnVerifyasSPIuserIcanseeRecommendedbudgetfieldisvisibleunderbudgetsummarysectionwhenAppstatusisnegotiationcompleted @sprint-13-US-224176 @komal @Allocation @wip
  Scenario Outline: Directed Ann_ Verify as SPI user I can see Recommended budget field is visible under budget summary section when App status is negotiation completed
  | Directed Ann_ Verify as SPI user I can see Recommended budget field is visible under budget summary when App status is negotiation initiated state |
  | Competitive Ann_ Verify as SPI user I can see Recommended budget field is visible under budget summary when App status is negotiation initiated state|
  | Competitive Ann_ Verify as SPI user I can see Recommended budget field is visible under budget summary section when App status is negotiation completed |
    Given I published "<Announcement Type>" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Overview: Project Information" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    And I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    #219488 #219634
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Budget" sub tab
    Then I softly see field "Recommended Budget" inside page block
    #219498 #219640
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Budget" sub tab
    Then I softly see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | Announcement Type |
      | {SavedValue:Automation Runtime Announcement} | Directed          |
      | {SavedValue:Automation Runtime Announcement} | Competitive       |

  @219489 @219636 @DirectedAnnVerifyasSPAuserIcanseeRecommendedbudgetfieldisvisibleunderbudgetsummarywhenAppstatusisnegotiationSenttoSR @sprint-13-US-224176 @komal @Allocation @wip
  Scenario Outline: Directed Ann_ Verify as SPA user I can see Recommended budget field is visible under budget summary when App status is negotiation Sent to S\R
    | Competitive Ann_ Verify as SPA user I can see Recommended budget field is visible under budget summary when App status is negotiation Sent to S\R |
    Given I published "<Announcement Name>" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation SPA user"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Overview: Project Information" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    And I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    #219489 #219636
    When I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I navigate to "Budget" sub tab
    Then I softly see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | Announcement Type |
      | {SavedValue:Automation Runtime Announcement} | Directed          |
      | {SavedValue:Automation Runtime Announcement} | Competitive       |

  @219494 @219638 @DirectedAnnVerifyasINDuserIcanseeRecommendedbudgetfieldisvisibleunderbudgetsummarysectionwhenAppstatusisnegotiationinitiated @sprint-13-US-224176 @komal @Allocation
  Scenario Outline: Directed Ann_ Verify as IND user I can see Recommended budget field is visible under budget summary section when App status is negotiation initiated
    Given I published "<Announcement Type>" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Overview: Project Information" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    And I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:publishedOpputunityTableId---" without waiting for record
    #219494 #219638
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | Announcement Type |
      | {SavedValue:Automation Runtime Announcement} | Directed          |
      | {SavedValue:Automation Runtime Announcement} | Competitive       |

  @219507 @219641 @DirectedAnnVerifyasINDuserIcanseeRecommendedbudgetfieldisvisibleunderbudgetsummarysummarywhenAppstatusisconverttoaward @sprint-13-US-224176 @komal @Allocation
  Scenario Outline: Directed Ann Verify as IND user I can see Recommended budget field is visible under budget summary summary when App status is convert to award
    Given I published "<Announcement Type>" type announcement having name "Automation Runtime Announcement" and properties "default"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    And I created approved FDM on application "<Announcement Name>"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I save the value from row "1" for column name "EGMS ID" as "appEGMSID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "3" seconds
    Then I softly see that "Subaward" is in "Created" status
    And I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside flex table with id "---applicationIntake:-:publishedOpputunityTableId---" without waiting for record
    #219507 #219641
    Then I softly see field "Status" as "Converted to Award"
    When I navigate to "Budget" sub tab
    Then I softly see field "Recommended Budget" as "$1,000.00"

    Examples:
      | Announcement Name                            | Announcement Type |
      | {SavedValue:Automation Runtime Announcement} | Directed          |
      | {SavedValue:Automation Runtime Announcement} | Competitive       |

  @219584 @219679 @DirectedAnnVerifyRecommendedbudgetfieldshouldnotdisplayforSPIonapplicationifitsrelatedFDMwillrejectduringapproval @sprint-13-US-204132 @komal @Allocation @wip
  Scenario Outline: Directed Ann_ Verify 'Recommended budget' field should not display for SPI on application if it's related FDM will reject during approval
  | Competitive Ann 'Recommended budget' field should not display for SPI on application if it's related FDM will reject during approval |
    Given I published "<Announcement Type>" type announcement having name "Automation Runtime Announcement" and properties "default-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000               | 1000                    | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    And I "Disapprove" in the approval decision
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    #219584 #219679
    Then I softly see field "Recommended Budget" inside page block

    Examples:
      | Announcement Name                            | Announcement Type | User |
      | {SavedValue:Automation Runtime Announcement} | Directed          | EXE  |
      | {SavedValue:Automation Runtime Announcement} | Competitive       | EXE  |

  @313662 @VerifyPMusercanseethevalueBudgetTabFocusAreareplacedwithBudgetTabBudgetSummarybyFocusAreaintheApplicationsectionforNegotiationonFDMFANO @sprint-8-US-308117 @hitesh
  Scenario Outline: Verify PM user can see the value "Budget Tab: Focus Area" replaced with "Budget Tab: Budget Summary by Focus Area" in the Application section for Negotiation on FDM (FA= NO)
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION_YES_FOCUS_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "BUDGETCATEGORY_NO_FOCUSAREA"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    Then I see multipicklist field "fieldApplicationSectionsForRevision__c" contains value "Budget Tab: Budget Summary by Focus Area" under list "Application Sections for Revision - Available"
    Then I do not see multipicklist field "fieldApplicationSectionsForRevision__c" contains value "Budget: Focus Area" under list "Application Sections for Revision - Available"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

