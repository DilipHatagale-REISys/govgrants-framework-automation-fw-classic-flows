@preAplicationWB @grantor-regression @grantor-parallel-regression @app
Feature: Pre-Application scenarios without background

  @71921 @71411 @71412 @71410 @70252 @70254 @71925 @verifyCreateApplicationandQualifyButtons
  Scenario: Verify whether SPI user is able to qualify opportunity a Pre-Application| Verify Create Pre- Application button is displayed to SR User when User click on Qualify Button.
  Validate whether user is able to view the qualify button and qualify the opportunity before creating the pre-application
  Validate the user is able to create Pre Application only when the Opportunity setting for Pre Applciation Required (Yes)
  Validate whether User will be able to enter the required information for the creation on Pre Application before the Due date
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    And I wait for "1" seconds
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Pre-Application}" for title "Title" inside table "---applicationIntake:-:activeOpportunitiesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    Then I softly see field "Pre-Application Required?" as "Yes"
    Then I softly can see top right button "Qualify" in page detail
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Announcement for Pre-Application}" is in "Qualified" status
    Then I softly can see top right button "Create Pre-Application" in page detail
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:qualifiedTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Pre-Application}" for title "Opportunity Name" inside table "---applicationIntake:-:qualifiedTableId---"

  @72575 @70253 @75595 @spaUserCannotSubmitanPre-application
  Scenario: Validate the SPA users should not be able to Submit the Pre Application | Validate whether SPI user can continue to proceed without providing application title while creating a pre-application
  Validate whether users from other organizations will be able to create Pre-Applications
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    And I login as "SPA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I clear the value from field "Title__c"
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Pre-Application Title is required to save. |
    And I enter value "{SavedValue:Automation Runtime Announcement for Pre-Application}" into field "Title__c"
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
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Pre-Application" in page detail

  @70660 @72623 @70662 @70661 @preApplRequiredIsYesAnnouncementCreation @deepika @smoke
  Scenario: Validate whether the User is able to create a Pre Application only when the Opportunity setting for Pre Applciation Required (Yes) |
  Validate whether User is able to view the following error message "Reached the Maximum number of Applications" when the limit has been reached.
  Validate whether User is able to view the Leverage column in the budget grid when the value set as Yes. |Validate the user  will be able to view the the Program Income field on the overview tab when the value set as Yes.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    Then I softly see that "{SavedValue:Automation Runtime Announcement for Pre-App}" is in "Qualified" status
    Then I softly can see top right button "Create Pre-Application" in page detail
    And I click on "Create Pre-Application" in the page details
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail

  @70663 @preApplRequiredIsNoAnnouncementCreation @deepika
  Scenario: Validate whether the User is able to create Pre Application when the Opportunity setting for Pre Application (No)
    And I published "Competitive" type announcement having name "Automation Runtime Announcement for PreApp and App" and properties "default"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for PreApp and App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for PreApp and App}" inside table
    When I click on "Qualify" in the page details
    Then I softly cannot see top right button "Create Pre-Application" in page detail

  @71115 @71114 @preappDueDateValidation @deepika  @buglogged113230
  Scenario: Validate whether User will be able to submit the pre- application on the last date for submission.
  Validate once the Announcement is published and Pre-Application is in created status, later the announcement is unpublished then the User will not be able to see the Submit to Grantor on pre-application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for PreApp and App" and properties "TODAY_PREAPP_DUE_DATE"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for PreApp and App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for PreApp and App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    Then I softly see field "PreApplication Due Date" is getting updated with todays date
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for PreApp and App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for PreApp and App}" inside table
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Pre-Application" in page detail
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for PreApp and App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for PreApp and App}" inside table without waiting for record
    And I click on "Unpublish" in the page details
    Given I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for PreApp and App}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for PreApp and App}" inside table
    Then I softly cannot see top right button "Submit to Grantor" in page detail

  @71413 @userCannotCreatePreAppWhenSettingIsNo @deepika
  Scenario: Validate whether User is able to create Pre Application only when the Opportunity setting for Pre Application (No)
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly see field "Pre-Application Required?" as "No"
    When I click on "Qualify" in the page details
    Then I softly cannot see top right button "Create Pre-Application" in page detail

  @72516 @72518 @34154 @72519 @72520 @72515 @preapplicationInformationCopiedToApplication @deepika @buglogged100926 @buglogged109204 @buglogged169487
  Scenario: Validate the Pre Application information is copied to Application | Validate whether user is able to acknowledge the application submission by entering the mandatory details.
  Validate the Match Percentage validation during submit for approval when the Match required setting as Yes | Validate when the pre-application is submitted to grantor then the pending task is created for PM user
  Validate the once the PM user accepts the pre-application when is submitted to grantor using the pending task, then the task moved from pending to Completed task table
  Validate other than record Owner Pm , other users will not be to Accept submitted Pre-Application
    Given I published "Directed" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "Subaward Floor" as "subawardfloor"
    And I save the field labeled "Subaward Ceiling" as "subawardcieling"
    And I save the field labeled "Match Required?" as "matchrequired"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    And I enter "Edition1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Requested Amount should be greater than or equal to the Subaward Floor Amount. Adjust the requested budget in Budget period section on Budget tab. |
      | Overview Tab - Enter an Acknowledgement before submitting this Pre-Application.                                                                                 |
      | Budget Tab - Enter budget details for the first budget period before submitting the Pre-Application to the Grantor.                                             |
      | Budget Tab - Provide the match details (Cash Match/Non-Cash Match) to submit this application.                                                                  |
      | Budget Tab - The Subrecipient Match cannot be less than the match requirement.                                                                                  |
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "Checked" into field "Agreement5__c"
    And I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Requested Amount should be greater than or equal to the Subaward Floor Amount. Adjust the requested budget in Budget period section on Budget tab. |
      | Budget Tab - Enter budget details for the first budget period before submitting the Pre-Application to the Grantor.                                             |
      | Budget Tab - Provide the match details (Cash Match/Non-Cash Match) to submit this application.                                                                  |
      | Budget Tab - The Subrecipient Match cannot be less than the match requirement.                                                                                  |
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    And I get the "EGMS ID"
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
    And I softly see "No Records Found" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Accept" in the page details
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:preappCompletedTasksTableId---" panel
    Then I softly see "Record Id" inside flex table with id "---preApplication:-:preappCompletedTasksTableId---"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "RecipientPreApplications" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see selected element "{SavedValue:subawardfloor}"
    Then I softly see selected element "{SavedValue:subawardcieling}"
    Then I softly see selected element "{SavedValue:matchrequired}"

  @72522 @preapplicationQualifiedIsAddedToTheTable @deepika @smoke
  Scenario: Validate once Application is qualified then user can view the Qualified Application from Qualfied Table and it is removed from Non -yet qualified table
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:qualifiedTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Pre-Application}" for title "Opportunity Name" against the value "Qualified" inside table "---applicationIntake:-:qualifiedTableId---"
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    Then I softly do not see "{SavedValue:Automation Runtime Announcement for Pre-Application}" has been added in "---preApplication:-:notYetQualifiedTable---" flex table

  @72576 @75866 @75865 @preApplicationSubmittedToGrantorPendingTask @buglogged125701  @buglogged169487
  Scenario: Validate whether user can change the pre-application due date while creating the pre-application
  Validate whether pre-application title field is editable while creating the pre-application | Validate whether the Announcement owner receives an email notification when the pre-application is submitted to grantor |
  Validate whether the external user recieves an email notification when the pre-application is accepted by the grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---announcement:-:competitiveTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside flex table with id "---announcement:-:competitiveTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnId"
    Given I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I click on "Create Pre-Application" in the page details
    Then I softly see fields "Title_c" is in edit mode
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I get the "EGMS ID"
    And I save the field containing "EGMS ID" as "preappID"
    When I click on "Submit to Grantor" in the page details
    #buglogged125701
    And I pause execution for "200" seconds
    Then I softly can see mail notification for "INTERNAL" user with following subject:
      | Pre-Application Submitted for Announcement {SavedValue:AnnId} by SAN DIEGO ELECTRICAL TRAINING TRUST |
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:preappID}" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:preappID}" inside table
    When I click on "Accept" in the page details
    And I pause execution for "150" seconds
    And I checkout to yopmail with mailid "Automationspi3@yopmail.com"
    And I refresh the page
    Then I see the mail subject is as follows :
      """
      Pre-Application {SavedValue:Automation Runtime Announcement for Pre-Application} {SavedValue:AnnId} has been Accepted
      """
#    Then I softly can see mail notification for "EXTERNAL" user with following subject:
#      | Pre-Application {SavedValue:Automation Runtime Announcement for Pre-Application} {SavedValue:AnnId} has been Accepted |

  @72523 @SPIUserCannotdeleteTheCreatedPreApplication
  Scenario Outline: Validate whether SPI/SPA user has the ability to delete the created pre-Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "RecipientPreApplications" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Announcement for Pre-Application}" in flex table with id "RecipientPreApplications"
    Examples:
      | User |
      | SPI3 |
      | SPA  |

  @72524 @34048 @OppurtunityFieldsARENOtEditableInDraftStatus
  Scenario: Validate whether user can edit the Opportunity Overview page block fields when the pre-application is in draft status |Validate whether SPI & SPA users are able to view the qualified and created Status of Qualified Pre-Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Opportunity Title" is not editable
    And I softly see field "Opportunity Type" is not editable
    And I softly see field "Pre-Application Due Date" is not editable
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    Then I softly see that "{SavedValue:Automation Runtime Announcement for Pre-Application}" is in "Qualified" status
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "RecipientPreApplications" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside flex table with id "RecipientPreApplications"
    Then I softly see that "{SavedValue:Automation Runtime Announcement for Pre-Application}" is in "Created" status

  @72625 @errorMessageOfPreApplicationDueDate @deepika
  Scenario: Validate whether system generates an error message when Pre Application Due Date is greater than Application Due Date while submitting information
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
    Then I softly see the following messages in the page details contains:
      | Pre-Application Due Date cannot be after Application Due Date |

  @34290 @otherOrganizationUserCannotViewPreApplication @deepika
  Scenario: Validate the Pre-applications are visible for other organizations
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I see total records count "Total Records: 1" in flex table "---applicationIntake:-:activeOpportunitiesTableId---"

  @34006 @preApplicationVisibity @deepika
  Scenario Outline: Validate the Pre-applications are visible for their own organization and for child organizations.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see that "{SavedValue:Automation Runtime Announcement for Pre-Application}" has been added in flextable with Id "---applicationIntake:-:activeOpportunitiesTableId---"
    Examples:
      | User |
      | SPI3 |
      | SPA  |

  @34147 @validateRequestedAmountIsGreateThanSubawardFloorAmount @deepika  @buglogged169487
  Scenario: Verify SPI & SPA user is not able to Submit Pre-Application to Grantor with Requested Amount greater than Subaward Floor Amount
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I click on "Create Pre-Application" in the page details
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
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Requested Amount should be greater than or equal to the Subaward Floor Amount. Adjust the requested budget in Budget period section on Budget tab. |

  @73866 @73870 @qualifyAnnSPAUser @jitendra
  Scenario: To verify user allow to view Qualified opportunity  in opportunity tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I get the "EGMS ID"
    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:qualifiedOpprtunitesTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Pre-Application}" for title "Opportunity Name" inside table "---preApplication:-:qualifiedOpprtunitesTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    Then I softly see field "Status" as "Qualified"

  @34045 @editCreatedApplication @deepika
  Scenario Outline: Verify SPI & SPA user (Record owner of Application) is able to edit created Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "RecipientPreApplications" panel
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime Announcement for Pre-Application}" in flex table with id "RecipientPreApplications"
    Examples:
      | User |
      | SPI3 |
      | SPA  |

  @73518 @focusAreaSettingAsNoWhileAnnouncementCreation @deepika
  Scenario: Validate when the focus area setting from the funding opportunity is No, then SPI User should be able to view the focus area settings as No and cannot see the page block
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APP_YES_FOCUS_AREA_NO"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I cannot see page block "Focus Area"

  @35054 @34353 @33998 @validateListOfSubmittedApplication @deepika  @buglogged169487
  Scenario: Verify when SPI (Record owner of Pre-Application) submit the Pre-Application to Grantor then it is displayed in the list of Submitted Pre-Applications and disappeared from the list of Not yet qualified Opputunities
  Verify if the opportunity has only one focus area, then the application budget periods are automatically associated to that focus area |
  Validate whether SPI user can edit the pre-application once it is submitted to grantor.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I navigate to "Performance" sub tab
    Then I softly can see page block "Focus Areas"
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Then I softly see "Focus Areas" page block displayed
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---preApplication:-:notYetQualifiedTable---"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---preApplication:-:recipientPreApplicationsTableId---"

  @34156 @75962 @75963 @75964 @preAppHistoryFieldGetUdated @deepika @skipOnJenkins
  Scenario: Validate History Field is getting updated for PM user when Pre Application status is Submitted to Grantor.| Validate the History field is getting updated when internal user accepts the pre-application
  Validate whether the Internal user is able to view the Snapshot after Pre-Application is Submitted to Grantor status | Validate whether spi user can view the snapshot once the pre-application is submitted to grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I click on "Create Pre-Application" in the page details
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
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "data.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    When I navigate to "History" sub tab
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I wait for "7" seconds
    Then I softly see snapshot with name containing "SnapShot on" as name
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
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    And I click on hyperlink containing value "Submission"
    When I download the file
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @34146 @preAppCannotBeSubmittedWithZeroAmount @deepika  @buglogged169487
  Scenario: Verify SPI user is not able to Submit Pre-Application to Grantor with zero budget/requested amount
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I navigate to "Performance" sub tab
    And I click on "Create Pre-Application" in the page details
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
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Requested Amount should be greater than or equal to the Subaward Floor Amount. Adjust the requested budget in Budget period section on Budget tab. |
      | Budget Tab - Enter budget details for the first budget period before submitting the Pre-Application to the Grantor.                                             |
      | Budget Tab - Provide the match details (Cash Match/Non-Cash Match) to submit this application.                                                                  |
      | Budget Tab - The Subrecipient Match cannot be less than the match requirement.                                                                                  |

  @76379 @spaCannotViewCreatedPreApplicationBySPI @deepika
  Scenario: Validate whether created Pre-Application by SPI user(Record owner of pre- Application)are visible for their child (SPA) organizations
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I navigate to "Performance" sub tab
    And I click on "Create Pre-Application" in the page details
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
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    Then I see total records count "Total Records: 1" in flex table "---preApplication:-:recipientPreApplicationsTableId---"

  @77449 @77450 @77451 @77452 @77453 @77454 @77455 @unpublishedAnnouncementCannotSubmitpreApplication @deepika @buglogged113216 @buglogged113230
  Scenario: Validate whether User will be able to view the submit to grantor button if the application due date changes to the future date
  Validate once the Announcement is published and Application is in created status, later the announcement is unpublished then the User will not be able to see the Submit to Grantor Button
  Validate whether the Applicant will be able to view qualify button of pre-application on the same funding opportunity after republish
  Validate whether the Applicant will be able to create a New pre-application from the republish announcement and oppurtunity |Validate whether the Applicant will be able to Submit the New Application to grantor from the republish announcement and oppurtunity
  Validate whether when the user click on unpublish button of announcement status of announcement changes to created and SPI user cannot see announcement at external side
  Validate User will not be able to Qualify the Funding Opportunity when the Funding Opportunity becomes unpublished
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I get the "EGMS ID"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnouncementId"
    And I click on "Unpublish" in the page details
    And I save the field labeled "EGMS ID" as "unpublished"
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnouncementId}" in "---announcement:-:opportunityNotQtableId---" panel
    Then I softly do not see value "{SavedValue:AnnouncementId}" for title "Announcement ID" inside table "---announcement:-:opportunityNotQtableId---"
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I softly cannot see top right button "Qualify" in page detail
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I softly can see top right button "Qualify" in page detail
    When I click on "Qualify" in the page details
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    Then I softly can see top right button "Submit to Grantor" in page detail
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
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"

  @77583 @preApplicationMatchrequiredYes @deepika
  Scenario: Validate whether User will be able to view the Match column in the budget grid when the value set as Yes while announcement creation with pre-application is set as yes
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES_AND_NO_MATCH"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    Then I softly see field "Leverage Allowed?" as "Yes"
    Then I softly see field "Pre-Application Required?" as "Yes"
    Then I softly see field "Focus Area Required?" as "Yes"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Match Required?" as "No"
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Focus Areas"
    Given I expand nested table containing column value "BP01"
    Then I softly see all values "$0.00" under column "Total Match" inside flextable with id "---preApplication:-:budgetCategoryGridTableId---"
    Then I softly see all values "$0.00" under column "Other Leverage" inside flextable with id "---preApplication:-:budgetCategoryGridTableId---"

  @77656 @snapshotHistoryPreApplication @deepika @skipOnJenkins
  Scenario: Validate whether SPI user will be able to take the snapshot on page when the pre-application is in draft status and is saved under snapshot history
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Snapshot on"
    When I download the file
    Then I see "Draft" on page "1" of "govgrants" pdf file

  @53151 @75961 @72622 @preApplicationCreationProgramIncomeValidation @smoke
  Scenario: Validate the Creation of Pre Application | Validate the user  will be able to view the the Program Income field on the overview tab when the value set as No.
  Validate the title entered while creating the pre-application reflects same under Oppurtunity Name
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement PreApplication" and properties "PRE_APP_YES_PROGRAM_INCOME_NO"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement PreApplication}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement PreApplication}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Announcement PreApplication}"
    When I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "No"
    Then I softly cannot see field "Estimated Program Income For Project Period" inside page block

  @174845 @174846 @174858 @174860 @174876 @174879 @174883 @174885 @ValidatesubmittedpreapplicationsendbacktonegotiationfromgrantorsideafterselectingtheRequesNegotiation @sprint-8 @vaibhav
  Scenario: Validate submitted pre application send back to negotiation from grantor side after selecting the Request Negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
     #174846
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Request Negotiation" in the page details
     #174858
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
     #174876
    Then I softly can see page block "Negotiation Request Details"
    Then I softly can see page block "Explanation of Negotiations Needed"
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    #174879
    And I save the field labeled "Due Date" as "DueDate"
    Then I softly see field "Status" as "Created" in "Negotiation Request Details" pageblock
    Then I softly see field "Pre-Application Sections for Negotiation" as "Files and Forms: Forms"
    Then I softly see field "Due Date" as "{SavedValue:DueDate}"
     #174885
    Then I softly see field "Due Date" inside page block
    Then I softly see field "Pre-Application Sections for Negotiation" inside page block
     #174883
    Then I softly see field "Details" as "Negotiation Initiated"
    And I click on "Send to Subrecipient" in the page details
     #174860
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    Then I softly can see "Negotiations" sub tab at view detail page

  @174849 @ValidatewhenpreapplicationisAcceptthenRequestNegotiationbuttonishidefromGrantor @sprint-8 @vaibhav
  Scenario: when pre-application is Accept then "Request Negotiation" button is hide  from Grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Accept" in the page details
    Then I softly cannot see top right button "Request Negotiation" in page detail

  @178505 @ValidateonRejectedpreapplicationnegotiationtabshouldbehiddenifthenegotiationisnotinitiated @sprint-8 @vaibhav
  Scenario: on Rejected preapplication negotiation tab should be hidden if the negotiation is not initiated
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Reject" in the page details
    Then I softly cannot see "Negotiations" sub tab at view detail page
    Then I softly see field "Status" as "Rejected"

  @178468 @Validatetaskcreatedwhennegotiationrequestpreapplicationissendtosubrecipient @sprint-8 @vaibhav
  Scenario: task is created when negotiation request preapplication  is send to subrecipient
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---home:-:externalPendingTasktableId---"

  @176549 @Validatesaveandcancelbuttonisdisplayedonsubrecipientside @sprint-8 @vaibhav
  Scenario: Validate save and cancel button is displayed on subrecipient side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Edit" in the page details
    Then I can see top right button "Cancel" in page detail
    Then I can see top right button "Save" in page detail

  @176528 @176525 @176521 @ValidateDuedatefieldisdisplayedonsubrecipientside @sprint-8 @vaibhav
  Scenario: Validate Due date field is displayed on subrecipient side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "Due Date" as "DueDate1"
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Due Date" as "{SavedValue:DueDate1}"
     #176525
    Then I softly see field "Pre-Application Sections for Negotiation" inside page block
     #176521
    When I click on "Edit" in the page details
    Then I see textarea field "fieldApplicantResponse__c" is editable

  @176515 @ValidatebuttonRequestNegotiationisdisplayedonGrantortoInitiateNegotiation @sprint-8 @vaibhav
  Scenario: button Request Negotiation is displayed on Grantor to Initiate Negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I softly can see top right button "Request Negotiation" in page detail

  @176508  @ValidateSubrecipientuserisabletosubmittograntorthenegotiationrequestpreapplication @sprint-8 @vaibhav
  Scenario: Subrecipient  user is able to  submit to grantor the negotiation request  preapplication
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "Due Date" as "DueDate1"
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock

  @174890 @ValidateDueDatefieldshouldbeRequiredtosubmitunderNegotiationRequestdetailssectiononGrantorSide @sprint-8 @vaibhav
  Scenario: Due Date field should be Required to submit under Negotiation Request details section on Grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    And I enter "FileFormForms" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Due Date is required to save under Negotiations. |

  @174900 @174903 @ValidateExplanationofnegotiationneededfieldshouldbeRequairedtosubmitunderNegotiationRequestdetailssectiononGrantorSide @sprint-8 @vaibhav
  Scenario: Explanation of negotiation needed field should be Required to submit under Negotiation Request details section on Grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    And I enter "FileFormForms1" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Details is required to save under Negotiations. |
     #174903
    Then I softly see fields "fieldExplanationOfRevisionsNeeded__c" is in edit mode

  @175041 @ValidateusershouldabletoclickonSendtoSubrecipientbuttononGrantorSide @sprint-8 @vaibhav
  Scenario: Validate user should able to click on Send to Subrecipient button  on Grantor Side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock

  @175042 @ValidateInternalUsershouldabletoeditthefieldafterinclickonRequestnegotiation @sprint-8 @vaibhav
  Scenario: Validate Internal User should able to edit the field after in click on Request negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see fields "fieldRevisionDueDate__c" is in edit mode
    Then I softly see fields "fieldPreApplicationSectionsforRevision__c" is in edit mode
    Then I softly see fields "fieldExplanationOfRevisionsNeeded__c" is in edit mode

  @175045 @175053 @Validatesubrecipientshouldabletotoseethestatusofpre-applicationisNegotiationInitiated @sprint-8 @vaibhav
  Scenario: Validate subrecipient should able to to see the status of pre-application is Negotiation Initiated
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "FileFormForms2" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I softly see field "Status" as "Negotiation Initiated"
      #175053
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I softly can see top right button "Request Negotiation" in page detail

  @175055 @usershouldabletoselectthepicklistvalueat"NegotiationsRequestDetails"sectionin"Pre-ApplicationSectionforNegotiation"multi-picklist. @Sprint-8 @Vrishali
  Scenario: Verify user should able to select the picklist value at "Negotiations Request Details" section in "Pre-Application Section for Negotiation" multi-pick list.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "PreAppContactgrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see field "Other Leverage" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see fields "fieldPreApplicationSectionsforRevision__c" is in edit mode

  @174695 @Thestatusonpre-applicationwhennegotiationisinitiatedonsubrecipientside @Sprint-8 @Vrishali
  Scenario:The status on pre-application when negotiation is initiated on subrecipient side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    Then I softly can see "Negotiations" sub tab at view detail page
    Then I softly see field "Status" as "Negotiation Initiated"

  @174725 @TheApplicantResponsesectionisdisplayedfortheNegotiationtab @Sprint-7 @Vrishali
  Scenario: Verify the Applicant Response section is displayed for the Negotiation tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I pause execution for "3" seconds
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    Then I softly see "Applicant Response" page block displayed

  @174700 @Theeditbuttonisdisplayedonpre-applicationsonsubrecipientside @Sprint-8 @Vrishali
  Scenario: Verify the edit button is displayed on pre-applications on subrecipient side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    Then I can see top right button "Edit" in page detail

  @174878 @ValidateNegotiationRequestDetailssectionshouldcontaintheNegotiationdetailsfortheapplicanttoviewonGrantorSide @sprint-8 @vaibhav
  Scenario Outline: Validate Negotiation Request Details section should contain the Negotiation details for the applicant to view on Grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I hovering mouse on help text icon inside page block detail "Negotiation Request Details"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                                                                              |
      | This section contains negotiation details for the applicant to view, enter all details before sending to the Subreceipent |

  @176545 @ValidatehelptextdisplayedfortheNegotiationrequestdetailssectiononsubrecipientside @sprint-8 @vaibhav
  Scenario Outline: Validate help text displayed for the Negotiation request details section on subrecipient side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I navigate to "Negotiations" sub tab
    When I hovering mouse on help text icon inside page block detail "Negotiation Request Details"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                |
      | This section contains negotiation details from the Grantor. |

  @176517 @Validatehelptextisdisplayedonsubrecipientsideforpreapplicationforapplicantresponsesection @sprint-8 @vaibhav
  Scenario Outline: help text is displayed on subrecipient side for pre-application for applicant  response section
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I navigate to "Negotiations" sub tab
    When I hovering mouse on help text icon inside page block detail "Applicant Response"
    Then I softly see "<new_helpText>" shown as help text
    Examples:
      | new_helpText                                                             |
      | Provide a brief explanation of the negotiations made to the application. |

  @169921 @169923 @169926 @169927 @169928 @169932 @170092 @ValidateUserShouldAbleToSeeEDitViewPreviewButtonInFilesForm @sprint-7 @vaibhav
  Scenario: Validate User Should Able To See EDit View Preview Button In Files Form
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    Then I can see row level action button "View" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Then I can see row level action button "Edit" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Then I can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
     #169923
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    Then I softly see fields "fieldQuestion1__c" is in edit mode
    Then I softly see fields "fieldQuestion3__c" is in edit mode
    Then I softly see fields "fieldsbirEmpNumber__c" is in edit mode
    Then I softly see fields "fieldExperienceLevel__c" is in edit mode
    Then I softly see fields "fieldAppplicationSubmitted__c" is in edit mode
    Then I softly see fields "fieldSubmittedOnForm__c" is in edit mode
     #169928
    Then I see only the following ordered options in dropdown field "fieldExperienceLevel__c" :
      | --None-- | 0-5 years | 5-10 years | 10-20 years | 20 and more years |
     #169926
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
     #169927
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
     #170092
    Then I softly can see top right button "Edit" in page detail
     #169932
    Then I softly can see top right button "Validate" in page detail
    And I click on "Back" in the page details
    Then I softly see value "100%" for title "Percentage" against the value "Standard Pre-Application form" inside table "---preApplication:-:preAppFormTableId---"


  @170093 @ValidateusershouldabletoseeErrorMessageonvalidatebutton @sprint-7 @vaibhav
  Scenario: Validate user should able to see Error Message on validate button
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Automation Test" values from "fieldQuestion1__c"
    And I enter "Automation Test" values from "fieldQuestion3__c"
    And I enter "9" values from "fieldsbirEmpNumber__c"
    And I enter "Automation Test" values from "fieldAppplicationSubmitted__c"
    And I enter "5" values from "fieldSubmittedOnForm__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Please complete all the required for Save/Submit questions. |

  @170096 @170097 @170100 @170101 @ValidateusershouldabletoseetheSuccessMessageonvalidatebutton @sprint-7 @vaibhav
  Scenario: Validate user should able to see the Success Message on validate button
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
     #170100
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
     #170097
    And I click on "Back" in the page details
    Then I softly see value "100%" for title "Percentage" against the value "Standard Pre-Application form" inside table "---preApplication:-:preAppFormTableId---"
     #170101
    When I click on "Submit to Grantor" in the page details
    Then I can see row level action button "View" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Then I can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Then I cannot see row level action button "Edit" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"

  @170102 @ValidateSPI&SPAbothusercanedittheformmanytimesbeforesubmittingthepreapplication @sprint-7 @vaibhav
  Scenario Outline: Validate SPI & SPA both user can edit the form many times before submitting the pre-application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "<User>" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | <Name> | Project Role             | Is Key Contact |
      |        | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see field "Other Leverage" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I can see row level action button "Edit" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Examples:
      | User | Name                       |
      | SPI3 | {SavedValue:SPI3 Username} |
      | SPA  | {SavedValue:SPA Username}  |

  @170105 @ValidateusershouldabletoseetheEditValidateBackbuttonaftersavingthepreapplicationform @sprint-7 @vaibhav
  Scenario: Validate user should able to see the Edit Validate Back button after saving the preapplication form
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Back" in page detail

  @174520 @Validatepreapplicationisaccepted/rejectedthenusershouldonlyviewpreviewtheforminformtable @sprint-7 @vaibhav
  Scenario Outline: Validate preapplication is accepted/rejected then user should only view preview the form in form table
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "<Button>" in the page details
    When I navigate to "Files and Forms" sub tab
    Then I can see row level action button "View" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Then I can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Then I cannot see row level action button "Edit" against "Standard Pre-Application form" in flex table with id "---preApplication:-:preAppFormTableId---"
    Examples:
      | Button |
      | Accept |
      | Reject |

  @174728 @TheExplanationofRevisionsneededsectiondisplayedonnegotiationsectionisreadonlyonsubrecipientside @Sprint-7 @Vrishali
  Scenario: Verify the Explanation of Revisions needed section  displayed on negotiation section is read only on subrecipient side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    Then I softly see field "Explanation of Negotiations Needed" is not editable

  @174697 @Theusercaneditonlythosesectionwhichareselectedbygrantorwhileinitiatingthenegotiationrequestonpre-applicationonSubrecipientside @Sprint-8 @Vrishali
  Scenario: the user can edit only those section which are selected by grantor while initiating the negotiation request on pre-application on Subrecipient side
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I click on "Edit" in the page details
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldProjectAbstract__c" is in edit mode
    Then I softly see fields "fieldProjectGoal__c" is in edit mode
    Then I softly see fields "fieldProjectBeneficiaries__c" is in edit mode
    And I navigate to "Files and Forms" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"

  @174727 @Thesubrecipientuserisabletosavedetails @Sprint-7 @Vrishali
  Scenario: Verify the subrecipient user is able to save details
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I pause execution for "3" seconds
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I click on "Edit" in the page details
    And I enter "Edition_v" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Files and Forms" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    When I upload attachment "Permanent Records.xlsx" of type "Other" from computer
    And I navigate to "Overview" sub tab
    Then I softly see field "Title" inside page block
    Then I softly see field "Project Abstract" as "Automation Pre-application abstract descriptionAutomation Pre-application abstract description"
    Then I softly see field "Project Goals (Provide performance metrics, if any)" as "Automation Pre-application goals descriptionAutomation Pre-application goals description"
    Then I softly see field "Project Beneficiaries (Target Population)" as "Automation Pre-application beneficiary descriptionAutomation Pre-application beneficiary description"
    And I navigate to "Files and Forms" sub tab
    Then I softly see value "Other" for title "Classification" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"

  @174537 @ValidateUsershouldnotsubmitthepre-applicationifpre-applicationformisnotfillthe100%&asperfillingfield%shouldbedisplayontheform @Sprint-7 @Vrishali
  Scenario: Verify user should not submit the pre-application if pre-application form is not fill the 100% & as per filling field % should be display on the form
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
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
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_v" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Files Tab - All mandatory forms must be 100% completed. |
