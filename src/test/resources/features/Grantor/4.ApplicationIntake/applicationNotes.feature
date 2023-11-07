@applicationNotes @grantor-regression @grantor-parallel-regression @app @regression @ApplicationExecution-reg
Feature: Application Intake scenarios without background

  @228678 @ValidatePMPOEXEADMINFDusershouldbeabletoAddnotesbutEditDeletetheirownnotesonapplicationisinSubmittograntorstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM PO EXE ADMIN FD user should be able to Add notes but Edit Delete their own notes on application is in 'Submit to grantor' state
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I click on "Submit Application" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of EXE User | Automation Notes |
    Then I softly see value "Notes Record Of EXE User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PO User | Automation Notes |
    Then I softly see value "Notes Record Of PO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                      | Description      |
      | Notes Record Of ADMIN User | Automation Notes |
    Then I softly see value "Notes Record Of ADMIN User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FD User | Automation Notes |
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"

  @228683 @228699 @ValidatePMPOEXEADMINFDusershouldbeabletoAddnotesbutEditDeletetheirownnotesonapplicationisinReviewInitiatedstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM PO EXE ADMIN FD user should be able to 'Add' notes but Edit Delete their own notes on application is in Review Initiated state
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Intake" and properties "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Intake}" on announcement "{SavedValue:Automation Runtime Announcement Application Intake}" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of EXE User | Automation Notes |
    Then I softly see value "Notes Record Of EXE User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PO User | Automation Notes |
    Then I softly see value "Notes Record Of PO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                      | Description      |
      | Notes Record Of ADMIN User | Automation Notes |
    Then I softly see value "Notes Record Of ADMIN User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FD User | Automation Notes |
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    #228699
    And I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of ADMIN User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"

  @228687 @ValidatePMEXEFOusershouldbeabletoAddnotesbutEditDeletetheirownnotesonapplicationisinReviewedstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM EXE FO user should be able to Add notes but Edit Delete their own notes on application is in Reviewed state
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Intake" and properties "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Intake}" on announcement "{SavedValue:Automation Runtime Announcement Application Intake}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of EXE User | Automation Notes |
    Then I softly see value "Notes Record Of EXE User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FO User | Automation Notes |
    Then I softly see value "Notes Record Of FO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"

  @228689 @ValidatePMPOEXEFOFDusershouldbeabletoAddnotesbutEditDeletetheirownnotesonapplicationisinNegotiationInitiatedstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM PO EXE FO FD user should be able to Add notes but Edit Delete their own notes on application is in Negotiation Initiated state
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edit_2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of EXE User | Automation Notes |
    Then I softly see value "Notes Record Of EXE User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FO User | Automation Notes |
    Then I softly see value "Notes Record Of FO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PO User | Automation Notes |
    Then I softly see value "Notes Record Of PO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FD User | Automation Notes |
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"

  @228691 @ValidatePMPOEXEFDusershouldbeabletoAddnotesbutEditDeletetheirownnotesonapplicationisinNegotiationsubmittedstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM PO EXE FD user should be able to Add notes but EditDelete their own notes on application is in Negotiation submitted state
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edit_2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    Then I softly can see page block "Applicant Response"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Submitted"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Submitted"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of EXE User | Automation Notes |
    Then I softly see value "Notes Record Of EXE User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Submitted"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FO User | Automation Notes |
    Then I softly see value "Notes Record Of FO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Submitted"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PO User | Automation Notes |
    Then I softly see value "Notes Record Of PO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Negotiation Submitted"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FD User | Automation Notes |
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"

  @228696 @228698 @ValidatePMPOEXEFOFDusershouldnotabletoAddnotesnotesonapplicationisinconvertedtoawardstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM PO EXE FO FD user should not able to Add notes notes on application is in converted to award state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Intake}" on announcement "{SavedValue:Automation Runtime Announcement Application Intake}" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    When I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement Application Intake}"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Converted to Award"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    #228698
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Converted to Award"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    #228698
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Converted to Award"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    #228698
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Converted to Award"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    #228698
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Converted to Award"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    #228698
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"

  @228709 @ValidatePMEXEusershouldnotabletoEditDeletenotesaddedbySRonapplicationisinReviewInitiatedstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM EXE user should not able to Edit Delete notes added by S R on application is in 'Review Initiated' state
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of SPI User | Automation Notes |
    Then I softly see value "Notes Record Of SPI User" for title "Title" inside table "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Notes Record Of SPI User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Notes Record Of SPI User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"

  @228930 @ValidatePMPOEXEusershouldbeabletoAddnotesbutEditDeletetheirownnotesonapplicationisinCompleteNegotiationstate @Sprint-12-US-226970 @Notes @TBE
  Scenario: Validate PM PO EXE user should be able to Add notes but Edit Delete their own notes on application is in 'Complete Negotiation' state
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edit_2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    Then I softly can see page block "Applicant Response"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    When I click on "Complete Negotiation" in the page details
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" against the value "Notes Record Of PM User" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of EXE User | Automation Notes |
    Then I softly see value "Notes Record Of EXE User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FO User | Automation Notes |
    Then I softly see value "Notes Record Of FO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PO User | Automation Notes |
    Then I softly see value "Notes Record Of PO User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    And I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside table
    Then I softly see field "Status" as "Review Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---applicationIntake:-:applicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:applicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FD User | Automation Notes |
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---applicationIntake:-:applicationNotesTableId---"