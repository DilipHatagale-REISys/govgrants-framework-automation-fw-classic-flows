@auditorApplication  @auditorNegotiations @auditor @parallel-regression @regression
Feature: Validate all scenarios for Auditor Profile in Application Module

  @73805 @auditorCannotViewCreatedStatusPreApplication
  Scenario: Validate whether Auditor can view the application that is in Created Status
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "Record Id" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    Then I softly see "No records found" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"

  @69163 @auditorCannotCreateNegotiation @buglogged151669
  Scenario: Validate Auditor should not be  able to  Create Negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "Auditor" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:fdmTableId---"

  @69164 @auditorCannotSend/CompleteNegotiations @buglogged151671
  Scenario: Validate Auditor should be able to View the record but shouldn't be able to Complete Negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    Then I see "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"

  @69165 @auditorViewRecordCannotCreateSubawardFromApprovedFDM @buglogged151669
  Scenario: Validate Auditor Can view the record but should not be  able to  Create Subaward From Approved FDM
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "Auditor" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:fdmTableId---" :
      | Announcement Title                               | Actions |
      | {SavedValue:Automation Runtime FDM Announcement} | View    |
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I see status in Progress-bar is "Approved" and is "green"

  @69166 @auditorApplication @smoke
  Scenario Outline: Validate Auditor should be able to View submitted application details but cannot edit the submitted application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
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
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "<Application Name>" in "---auditor:-:applicationTableId---" panel
    Then I softly cannot see row level action button "Edit" against "<Application Name>" in flex table with id "---auditor:-:applicationTableId---"
    When I click on "View" icon for "<Application Name>" inside table
    Then I see status in Progress-bar is "Submitted" and is "Green"
    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @69301 @auditorCannotAddAttachmentsAndNotes
  Scenario Outline: Verify User with Auditor profile has no ability to add attachments and notes.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Application}" for title "Title" inside table "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    Then I softly see field "Opportunity" as "{SavedValue:Automation Runtime Announcement for Application}"
    Then I softly see field "Status" as "Published"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
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
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---auditor:-:applicationTableId---" panel
    When I click on "View" icon for "<Application Name>" inside table
    And I navigate to "Forms and Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "GrantorApplicationFilesgrid"
    Then I softly cannot see top right button "Add" in flex table with id "GrantorApplicationNotesgrid"
    Examples:
      | Application Name                                             | User    |
      | {SavedValue:Automation Runtime Announcement for Application} | Auditor |

  @69941 @69940 @audiorPreApplicationToApplication
  Scenario Outline: Validate Auditor should have view / read  only access to submitted pre-application| Validate Auditor should not be  able to Review/Accept/Reject Preapplication
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
   And I navigate to "Overview" sub tab
   And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
     | Name                       | Project Role             | Is Key Contact |
     | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on top right button "Add Files" in flex table with id "---auditor:-:PreApplicationTableId---"
    When I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I click on "Accept" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI | 10     |
    And I get the "EGMS ID"
    When I navigate to "Forms and Files" sub tab
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
    Given I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    Then I softly cannot see top right button "Reject" in page detail
    Then I softly cannot see top right button "Accept" in page detail
    Examples:
      | Announcement Name                                        |
      | {SavedValue:Automation Runtime Announcement Application} |

  @69984 @auditorApplicationReview
  Scenario Outline: Validate auditor should have view / read  only access to completed status Application review
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Application Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Application Name>" inside table
    And I navigate to "Related Log" tab
    Then I see values "Pre-Screen Review" and "Completed" inside table
    Examples:
      | Application Name                                 | User    |
      | {SavedValue:Automation Runtime FDM Announcement} | AUDITOR |
