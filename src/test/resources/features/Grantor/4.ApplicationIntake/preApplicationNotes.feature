@preAplicationNotes @grantor-regression @grantor-parallel-regression @app @regression
Feature: Pre-Application scenarios without background

  @225095 @225099 @ValidatePMPOEXEFOAdminsenotabletoEditDeletenoteswhichisaddedbySPIUserwhichisinnegotiationinitiatedstate @Sprint-11-US-224418 @Notes
  Scenario: Validate PM PO EXE FO Admin user is not able to Edit Delete notes which is added by SPI User which is in negotiation initiated state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
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
    Then I softly see top right button "Add" inside flex table "---preApplication:-:preApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit_Notes" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    #225099
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    #225099
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    #225099
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    #225099
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    #225099
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"

  @225101 @ValidatePMPOEXEADMINusershouldbeabletoAdnotesbuEditDeletetheirownnotesonpreapplicationisinSubmittograntorstate @Sprint-11-US-224418 @Notes
  Scenario: Validate PM PO EXE ADMIN user should be able to 'Add' notes but 'Edit/Delete' their own notes on pre-application is in 'Submit to grantor' state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
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
    Then I softly see top right button "Add" inside flex table "---preApplication:-:preApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PM User | Automation Notes |
    Then I softly see value "Notes Record Of PM User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                    | Description      |
      | Notes Record Of EXE User | Automation Notes |
    Then I softly see value "Notes Record Of EXE User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of EXE User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of EXE User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of PO User | Automation Notes |
    Then I softly see value "Notes Record Of PO User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of PO User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of PO User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FO User | Automation Notes |
    Then I softly see value "Notes Record Of FO User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FO User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FO User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of PM User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                      | Description      |
      | Notes Record Of ADMIN User | Automation Notes |
    Then I softly see value "Notes Record Of ADMIN User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of ADMIN User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of ADMIN User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"

  @225107 @225109 @ValidatePMPOEXEADMINusercannotAddnotesbutEditDeletetheirownnotesonpreapplicationsinRejectedstate @Sprint-11-US-224418 @Notes
  Scenario Outline: Validate PM PO EXE ADMIN user can not 'Add' notes but 'Edit/Delete' their own notes on pre-application is in 'Rejected' state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES-<filter>"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
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
    Then I softly see top right button "Add" inside flex table "---preApplication:-:preApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                        | Description      |
      | Notes Record Of Grantor User | Automation Notes |
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    #225109
    When I click on "Accept" in the page details
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "RecipientPreApplications" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Converted to Application"
    When I navigate to "Forms and Files" sub tab
    #225107
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Examples:
      | User  | filter                |
      | PM    | Automation PM user    |
      | EXE   | Automation EXE user   |
      | PO    | Automation PO user    |
      | ADMIN | Automation ADMIN user |

  @225130 @226079 @ValidatePMPOEXEADMINusercannotAddnotesbutEditDeletetheirownnotewhenpreappisNegotiationInProgressstate
  Scenario Outline: Validate PM PO EXE ADMIN user can not 'Add' notes but 'Edit/Delete' their own notes when pre-app is 'Negotiation In Progress' state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES-<filter>"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
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
    Then I softly see top right button "Add" inside flex table "---preApplication:-:preApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                        | Description      |
      | Notes Record Of Grantor User | Automation Notes |
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit_Notes" values from "PreApplication_Field_Values.xlsx"
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
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation In Progress"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    Then I softly see field "Status" as "Negotiation In Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    #226079
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Negotiation In Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Examples:
      | User | filter              |
      | PM   | Automation PM user  |
      | EXE  | Automation EXE user |

  @226077 @ValidateFDusercanAddnotesbutEditDeletetheirownnotesonpreapplicationisinAcceptedstate @Sprint-11-US-224418 @Notes
  Scenario: Validate FD user can Add notes but Edit Delete their own notes on pre-application is in 'Accepted' state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
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
    Then I softly see top right button "Add" inside flex table "---preApplication:-:preApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                        | Description      |
      | Notes Record Of Grantor User | Automation Notes |
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I click on "Accept" in the page details
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Accepted"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"

  @225104 @226081 @226082 @ValidatePMPOEXEADMINusercannotAddnotesbutEditDeletetheirownnotesonpreapplicationisinRejectedstate @Sprint-11-US-224418 @Notes
  Scenario: Validate PM PO EXE ADMIN user can not 'Add' notes but Edit Delete their own notes on pre-application is in Rejected state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
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
    Then I softly see top right button "Add" inside flex table "---preApplication:-:preApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    #226082
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FD User | Automation Notes |
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                        | Description      |
      | Notes Record Of Grantor User | Automation Notes |
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I click on "Reject" in the page details
    Then I softly see field "Status" as "Rejected"
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see value "Notes Record Of Grantor User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Forms and Files" sub tab
    #226081
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of Grantor User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"

  @226083 @226084 @ValidateFDusercannotAddnotesbutEditDeletetheirownnotesonpreapplicationisinNegotiationInitiatedstate @Sprint-11-US-224418 @Notes
  Scenario: Validate FD user cannot Add notes but Edit Delete their own notes on pre-application is in Negotiation Initiated state
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
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
    Then I softly see top right button "Add" inside flex table "---preApplication:-:preApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:preApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:preApplicationNotesTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    #226082
    Then I softly see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I enter the following values into flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Notes Record Of FD User | Automation Notes |
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I see field "Status" as "Submitted to Grantor"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit_Notes" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly see field "Status" as "Negotiation Initiated"
    When I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "Add" inside flex table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly see value "Notes Record Of FD User" for title "Title" inside table "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Of FD User" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---preApplication:-:grantorPreApplicationNotesTableId---"