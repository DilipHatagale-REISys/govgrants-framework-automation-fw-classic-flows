@grantsAwardNotesAndSuppDoc @grantor-regression @grantor-parallel-regression @grantAndAward @regression
Feature: Validate all scenarios of grants and award Notes and Supporting Document

  @234421 @234422 @ValidatethatSarahPmcanaddnotesinGrantrecordwhenGrantisincreatedstate @Sprint-13-US-201925 @vaibhav @Notes
  Scenario: Validate that Sarah PM can add notes in Grant record when Grant is in created state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    #234422
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                 | Description      |
      | EXE User Notes Record | Automation Notes |
    Then I softly see value "EXE User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "EXE User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "EXE User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"

  @234426 @ValidatethatRobertPOcanaddnotesinGrantrecordwhenGrantisincreatedstate @Sprint-13-US-201925 @vaibhav @Notes
  Scenario: Validate that Robert PO can add notes in Grant record when Grant is in created state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                | Description      |
      | PO User Notes Record | Automation Notes |
    Then I softly see value "PO User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "PO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "PO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"

  @234427 @234430 @234433 @ValidatethatAdmincanaddnotesinGrantrecordwhenGrantisinActivestate @Sprint-13-US-201925 @vaibhav @Notes
  Scenario: Validate that Admin can add notes in Grant record when Grant is in Active state
    And I activated standalone subaward "Automation Runtime Award" with properties "default-Automation PO user" of type "Competitive"
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                   | Description      |
      | Admin User Notes Record | Automation Notes |
    Then I softly see value "Admin User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "Admin User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "Admin User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    #234430
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                | Description      |
      | FO User Notes Record | Automation Notes |
    Then I softly see value "FO User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "FO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "FO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Admin User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Admin User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    #234433
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                | Description      |
      | FD User Notes Record | Automation Notes |
    Then I softly see value "FD User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "FD User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "FD User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Admin User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Admin User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "FO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "FO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"

  @234545 @234544 @ValidatethatVictorEXEcaneditdeletehisownnotesinGrantrecordwhenGrantisinclosedstate @Sprint-13-US-201925 @vaibhav @Notes
  Scenario: Validate that Victor EXE can edit delete his own notes in Grant record when Grant is in closed state
    And I activated standalone subaward "Automation Runtime Award" with properties "default-Automation EXE user" of type "Competitive"
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                | Description      |
      | PO User Notes Record | Automation Notes |
    Then I softly see value "PO User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "PO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "PO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                 | Description      |
      | EXE User Notes Record | Automation Notes |
    Then I softly see value "EXE User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "EXE User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "EXE User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
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
      | Name           | Closeout |
      | Automation EXE | Step 1   |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly see value "EXE User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "EXE User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "EXE User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    #234544
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly see value "PO User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "PO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "PO User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"

  @234543 @ValidatethatSarahPmcannotaddnotesinGrantrecordwhenGrantisinTerminatedstate @Sprint-13-US-201925 @vaibhav @Notes
  Scenario: Validate that Sarah Pm can not add notes in Grant record when Grant is in Terminated state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantsNotesTableId---" by clicking "Add" :
      | Title                | Description      |
      | PM User Notes Record | Automation Notes |
    Then I softly see value "PM User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "PM User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "PM User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:associateModalTableId---" is "All"
    And I check "Automation Permanent Focus Area2" boxes in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "8" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    Then I softly see field "Status" as "Terminated"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly see value "PM User Notes Record" for title "Title" inside table "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Edit" against "PM User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"
    Then I softly can see row level action button "Delete" against "PM User Notes Record" in flex table with id "---subAwardStandAlone:-:grantsNotesTableId---"

  @236063 @236079 @ValidatePMusershouldabletoaddnotesfromsameorganizationwhensubawardisincreatedstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate PM user should able to add notes from same organization when subaward is in created state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title               | Description      |
      | PM User Award Notes | Automation Notes |
    Then I softly see value "PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:associateModalTableId---" is "All"
    And I check "Automation Permanent Focus Area2" boxes in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "8" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    #236079
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                              | Description      |
      | Sent S/R State PM User Award Notes | Automation Notes |
    Then I softly see value "Sent S/R State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Sent S/R State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Sent S/R State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236109 @236112 @236120 @236359 @validatePOusershouldabletoaddnotesfromsameorganizationwhensubawardisinsubmittedforreviewstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate PO user should able to add notes from same organization when subaward is in submitted for review state
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:associateModalTableId---" is "All"
    And I check "Automation Permanent Focus Area2" boxes in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                      | Description      |
      | Submitted Review State PO User Award Notes | Automation Notes |
    Then I softly see value "Submitted Review State PO User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    #236120
    Then I softly can see row level action button "Edit" against "Submitted Review State PO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Submitted Review State PO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                       | Description      |
      | Submitted Review State PO1 User Award Notes | Automation Notes |
    Then I softly see value "Submitted Review State PO1 User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    #236120
    Then I softly can see row level action button "Edit" against "Submitted Review State PO1 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Submitted Review State PO1 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Submitted Review State PO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Submitted Review State PO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    #236359
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                              | Description      |
      | Reviewed State FO User Award Notes | Automation Notes |
    Then I softly see value "Reviewed State FO User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Reviewed State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Reviewed State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "7" seconds
    And I click on submit review
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    #236112
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                               | Description      |
      | Reviewed State PO1 User Award Notes | Automation Notes |
    Then I softly see value "Reviewed State PO1 User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Reviewed State PO1 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Reviewed State PO1 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236260 @ValidatewhenPOuserallowrecordeditingisyesthenpeerreviewerShouldabletoaddnotesinsentforreviewstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate when PO user allow record editing is yes then peer reviewer should able to add notes in sent for review state
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                      | Description      |
      | Submitted Review State PO User Award Notes | Automation Notes |
    Then I softly see value "Submitted Review State PO User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Submitted Review State PO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Submitted Review State PO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                      | Description      |
      | Submitted Review State FO User Award Notes | Automation Notes |
    Then I softly see value "Submitted Review State FO User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Submitted Review State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Submitted Review State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236360 @236363 @236366 @236376 @ValidateEXEuserallowrecordeditingisyesthepeerreviewershouldabletoeditdeletethenotesinsentforreviewstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario Outline: Validate EXE user allow record editing is yes then peer reviewer should able to edit & delete the notes in sent for review state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FO | Program Reviewer | Automation Description | 5        | <filter>             |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                       | Description      |
      | Submitted Review State EXE User Award Notes | Automation Notes |
    Then I softly see value "Submitted Review State EXE User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Submitted Review State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Submitted Review State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                      | Description      |
      | Submitted Review State FO User Award Notes | Automation Notes |
    Then I softly see value "Submitted Review State FO User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Submitted Review State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Submitted Review State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "7" seconds
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Files" sub tab
    Then I softly see top right button "Add" inside flex table "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                              | Description      |
      | Reviewed State FO User Award Notes | Automation Notes |
    Then I softly see value "Reviewed State FO User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Reviewed State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Reviewed State FO User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

    Examples:
      | filter |
      | Yes    |
      | No     |

  @236391 @236407 @236423 @236440 @236542 @236544 @236545 @ValidateAdminusershouldnotabletoaddnoteswhenawardissubmitforapprovalstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate Admin user should not able to add notes when award is submit for approval state
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #236391
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #236542
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #236544
    Then I softly see field "Status" as "Approved"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    #236407
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    #236545
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    #236423
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    #236440
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236450 @236451 @236549 @ValidateAdminusershouldnotabletoaddnoteswhenawardispendingactivationstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate Admin user should not able to add notes  when award is pending activation state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default-Automation ADMIN user" of type "Directed"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                         | Amendment Request |
      | {SavedValue:ADMIN1 Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 3000  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    #236450
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    #236451
    Then I softly see status in Progress-bar is "Amended" and is "Green"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #236549
    Then I softly see status in Progress-bar is "Amended" and is "Green"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236453 @ValidateAdminusershouldnotabletoaddnoteswhenawardisclosedforcedclosedstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate Admin user should not able to add notes  when award is closed state
    And I activated standalone subaward "Automation Runtime Award" with properties "default-Automation EXE user" of type "Competitive"
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Status" as "Active"
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
      | Name           | Closeout |
      | Automation EXE | Step 1   |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Completed" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236107 @ValidateGranteePMusershouldabletoaddnotesfromotherorganizationwhensubawardisinsubmittedtoreviewstate @Sprint-14-US-234263 @vaibhav @Notes @wip
  Scenario: Validate Grantee PM user should able to add notes from other organization when subaward is in submitted to review state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Sarah PM      | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                         | Description      |
      | Submitted Review State Sarah User Award Notes | Automation Notes |
    Then I softly see value "Submitted Review State Sarah User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Submitted Review State Sarah User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Submitted Review State Sarah User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236488 @236495 @236504 @236515 @236518 @236524 @ValidatewhenEXEusercanabletoeditdeletethenotesonrowlevelwhichisaddedbytheirowninsubmitforapprovalstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate when EXE user can able to edit & delete the notes on row level which is added by their own in submit for approval state
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:associateModalTableId---" is "All"
    And I check "Automation Permanent Focus Area2" boxes in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                              | Description      |
      | Created State EXE User Award Notes | Automation Notes |
    Then I softly see value "Created State EXE User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                             | Description      |
      | Created State PM User Award Notes | Automation Notes |
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    #236518
    Then I softly see field "Status" as "Created"
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "8" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    #236518
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    #236518
    Then I see field "Status" as "Accepted"
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Created State EXE User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    #236515,236518
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    #236495
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Created State EXE User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    #236515,236518
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    And I navigate to "Files" sub tab
    #236504
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Created State EXE User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    #236515,236518
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    #236524
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Created State EXE User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State EXE User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236531 @236535 @236541 @236559 @ValidatewhenawardisinSenttoSrbeforeapprovalstatethenSPIusersshouldabletoaddthenotesbutexternaluserwhoisnottheownerofthenotesthenshouldnoteditanddeletenotes @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate when award is in Sent to S/r before approval state then SPI users should able to add the notes but external user who is not the owner of the notes then should not edit and delete notes
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:associateModalTableId---" is "All"
    And I check "Automation Permanent Focus Area2" boxes in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "8" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    Then I see field "Status" as "Sent to Subrecipient"
    And I navigate to "Files" sub tab
    #236559
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                  | Description      |
      | Sent to SR State SPI3 User Award Notes | Automation Notes |
    Then I softly see value "Sent to SR State SPI3 User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Sent to SR State SPI3 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Sent to SR State SPI3 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    Then I see field "Status" as "Sent to Subrecipient"
    And I navigate to "Files" sub tab
    Then I softly see value "Sent to SR State SPI3 User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Sent to SR State SPI3 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Sent to SR State SPI3 User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    #236535
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                 | Description      |
      | Sent to SR State SPA User Award Notes | Automation Notes |
    Then I softly see value "Sent to SR State SPA User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Sent to SR State SPA User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Sent to SR State SPA User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Edit" :
      | Created By     | Title                            | Description       |
      | Automation SPA | Sent to SR State SPA Award Notes | Automation Notes1 |
    Then I softly see value "Sent to SR State SPA Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Sent to SR State SPA Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Sent to SR State SPA Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    And I click on "Delete" icon for "Sent to SR State SPA Award Notes" inside flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly do not see value "Sent to SR State SPA Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    #236541
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    Then I softly see field "Status" as "Accepted"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236534 @ValidatewhenawardisinSenttoSrbeforeapprovalstatethenINDusersshouldabletoaddthenotes @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate when award is in Sent to S/r before approval state then IND users should able to add the notes
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFieldsIndUser" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_By_Applicant" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:IND Username} | Project Director/Manager | Checked          |
    And I pause execution for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I pause execution for "8" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    Then I see field "Status" as "Sent to Subrecipient"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                                 | Description      |
      | Sent to SR State IND User Award Notes | Automation Notes |
    Then I softly see value "Sent to SR State IND User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Sent to SR State IND User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Sent to SR State IND User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236546 @236547 @ValidateINDusershouldnotabletoaddnoteswhenawardisActivatedstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate IND user should not able to add notes  when award is Activated state
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "SUBRECIPIENT_ORG_IND_USER-Automation ADMIN user" of type "Directed"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #236546
    Then I softly see field "Status" as "Activated"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                              |
      | Automation Test Description | fieldFundingChangeJustification__c |
      | 2000                        | fieldRequestedChangeInBudget__c    |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                         | Amendment Request |
      | {SavedValue:ADMIN1 Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 3000                 | 150        | 150            |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                     |
      | 3000  | fieldRevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #236547
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236556 @ValidateSPAusershouldnotabletoaddnoteswhenawardisrejectedstate @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate SPA user should not able to add notes when award is rejected state
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see field "Status" as "Rejected"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236557 @236558 @ValidateSPAusershouldnotabletoaddnoteswhenawardissubmittedforreview @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate SPA user should not able to add notes  when award is submitted for review
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I select value inside table "---subAwardStandAlone:-:associateModalTableId---" is "All"
    And I check "Automation Permanent Focus Area2" boxes in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I wait for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "8" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FO | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I pause execution for "7" seconds
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #236558
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @236562 @ValidateAuditorusershouldonlyreadnotes @Sprint-14-US-234263 @vaibhav @Notes
  Scenario: Validate Auditor user should only read notes
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:notesAwardTableId---" by clicking "Add" :
      | Title                             | Description      |
      | Created State PM User Award Notes | Automation Notes |
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly can see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Add" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly see value "Created State PM User Award Notes" for title "Title" inside table "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Edit" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"
    Then I softly cannot see row level action button "Delete" against "Created State PM User Award Notes" in flex table with id "---subAwardStandAlone:-:notesAwardTableId---"

  @223427 @223451 @223454 @223456 @223457 @223458 @223460 @223463 @ValidateAwardasAdminusercannotabletoseeActioncolumnundersupportingdocumentchecklistonAwardisinSendtosrafterApprovalstatewhensupportingdocumentchecklisiscreatedforAwardwhilecreatingdirectGrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate Award as Admin user can not able to see 'Action' column under supporting document checklist on Award is in "Send to s/r after Approval" state when supporting document checklist is created for Award while creating direct Grant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    #223451
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    #223457
    And I click modal button "Cancel"
    Then I see "Add Supporting Documents Checklist" modal is closed
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    #223456
    When I navigate to "Files" sub tab
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    Then I do not see "Cancel" button is disabled at modal under library
    And I refresh the page
    When I click on "Accept" in the page details
    #223460
    Then I softly see the following messages in the page details contains:
      | FilesTab - Complete each mandatory item listed in the checklist before submitting this Subaward. |
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    When I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:awardSuppDocTableId---"
    #223454
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    Then I see "Upload File from Computer" page block displayed
    Then I see only the following ordered options in dropdown field "WorkspaceFilesUpload" :
      | Select file classification | Template for Award | Others |
    #223458
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    Then I see "Upload" button is disabled at modal under library
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Files" sub tab
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    When I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click on "Accept after Approval" in the page details
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    #223463
    And I navigate to "Files" sub tab
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"

  @223452 @223453 @223455 @223461 @223462 @223466 @ValidateasINDUsercanabletoseeoptionUploadFilefromComputerwhennewmodalgetOpennamedasAddSupportingDocumentChecklistafterClickingonUploadTemplateiconofsupportingdocumentchecklistonAward @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate as IND user can able to see option "Upload File from Computer" when new modal get open named as 'Add Supporting Document Checklist' after clicking on "Upload Template" icon of supporting document checklist on Award
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFieldsIndUser1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:IND Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #223453
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    Then I softly see "Upload File from Computer" page block displayed
    Then I softly see "Classification" inside page block detail
    Then I softly see "Upload File" inside page block detail
    Then I softly see "Description" inside page block detail
    When I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click on "Accept" in the page details
    #223462
    And I navigate to "Files" sub tab
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    Then I see "Upload File from Computer" page block displayed
    #223455
    Then I see "Upload" button is disabled at modal under library
    Then I see "Cancel" button is displayed On Modal
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    And I click modal button "Upload"
    And I click on "Accept after Approval" in the page details
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    And I navigate to "Files" sub tab
    #223461
    Then I softly see value "View" for title "Subrecipient Document Link" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    #223466
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Activated" and is "Green"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:grantSupportDocTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required | Applies To | Status |
      | Award       | Optional | Award      | Active |
    Then I softly see value "Optional" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:grantSupportDocTableId---"

  @223464 @ValidateINDusershouldnotseeerrormessageifusertriestosubmittheAwardtoGrantoronlyifinternalusercreateGrant&selectappliestoAwardandRequiredfieldisOptional @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate IND user should not see error message if user tries to submit the Award to Grantor only if internal user create Grant & select applies to=Award and Required field is 'Optional'
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFieldsIndUser1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required | Applies To | Status |
      | Award       | Optional | Award      | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:IND Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    Then I softly see status in Progress-bar is "Accepted" and is "Green"

  @223469 @223471 @ValidateAdminusernewawardownercanabletoseenewtemplatelinkonsupportingdocumentchecklistonAwardwhenuseruploadedtemplatelinkwhilecreatingdirectgrantafterthatagainuploadedonActivegrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate Admin user new award owner can able to see new template link on supporting document checklist on Award when user uploaded template link while creating direct grant after that again uploaded on Active grant
    Given I activated standalone subaward "Automation Runtime Award" with properties "Automation ADMIN user" of type "Competitive"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I click on "Upload Template" icon for "Automation" inside flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click in table hyperlink containing value "View"
    Then I softly verify that the file "Attachment.pdf" is downloaded
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                    | Field               |
      | Automation Justification | fieldTncComments__c |
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "TermsCondId"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name             | Amendment Request |
      | Automation ADMIN | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:TermsCondId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:TermsCondId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    #223471 Commented below due to bug Bug Id:-223888 and US are created for this Enhancement
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
#    And I click toggle button to select "Grants - Active"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
#    Then I navigate to "Subawards" sub tab
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
#    Then I softly see that "Subaward" is in "Activated" status
#    When I navigate to "Files" sub tab
#    Then I softly do not see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"

  @223477 @ValidateINDusershouldseefollowingerrormessageifusertriestoAcceptafterapprovalonlyifinternalusercreateGrant&selectappliestoAwardandRequiredfieldisMandatory @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate IND user should see following error message if user tries to Accept after approval only if internal user create Grant & select applies to=Award and Required field is Mandatory
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFieldsIndUser1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:IND Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    When I navigate to "Terms" sub tab
    And I wait for "3" seconds
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | FilesTab - Complete each mandatory item listed in the checklist before submitting this Subaward. |

  @223478 @223700 @223312 @223386 @223395 @ValidateasAdminusercanseeActioncolumnshouldgethideonsupportingdocumentchecklistonAwardisincreatedstatewhensupportingdocumentchecklistiscreatedforAwardwhilecreatingdirectGrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate as Admin user can see 'Action' column should get hide on supporting document checklist on Award is in 'created' state when supporting document checklist is created for Award while creating direct Grant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I click on "Upload Template" icon for "Award" inside flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I click in table hyperlink containing value "View"
    Then I softly verify that the file "Attachment.pdf" is downloaded
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Files" sub tab
    #223312,223386
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly cannot see row level action button "Upload Template" against "Award" in flex table with id "---subAwardStandAlone:-:awardSuppDocTableId---"
    #223700, 223395
    And I click in table hyperlink containing value "View"
    Then I softly verify that the file "Attachment.pdf" is downloaded
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:grantSupportDocTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required | Applies To | Status |
      | Award       | Optional | Award      | Active |
    Then I softly see value "Optional" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:grantSupportDocTableId---"
    And I click on "Upload Template" icon for "Automation" inside flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" with wait for record
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Others" from computer
    And I click in table hyperlink containing value "View"
    Then I softly verify that the file "AttachmentTesting.pdf" is downloaded
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see value "Optional" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly cannot see row level action button "Upload Template" against "Award" in flex table with id "---subAwardStandAlone:-:awardSuppDocTableId---"
    And I click in table hyperlink containing value "View"
    Then I softly verify that the file "AttachmentTesting.pdf" is downloaded

  @223400 @223405 @223410 @ValidateasAdminusercannotabletoseetemplatelinkinsupportingdocumentchecklistonAwardwhendocumentisnotuploadedbyuserwhilecreatingdirectGrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate as Admin user can not able to see template link in supporting document checklist on Award when document is not uploaded by user while creating direct Grant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly cannot see row level action button "Upload Template" against "Award" in flex table with id "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly see value "Not Applicable" for title "Template Link" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Files" sub tab
    #223405
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see value "Not Applicable" for title "Template Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see value "Not Applicable" for title "Subrecipient Document Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Files" sub tab
    #223410
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see value "Not Applicable" for title "Template Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see value "Not Applicable" for title "Subrecipient Document Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    When I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    Then I softly see value "View" for title "Subrecipient Document Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    And I save the link value from row "1" for column name "Subrecipient Document Link" as "SubrecipientDocumentLink" from flex table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    And I click in table hyperlink containing value "{SavedValue:SubrecipientDocumentLink}"
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @223401 @223402 @ValidateasAdminusercannotabletoseesupportingdocumentchecklistonAwardwhensupportingdocumentchecklistisnotcreatedforAwardwhilecreatingdirectGrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate as Admin user can not able to see supporting document checklist on Award when supporting document checklist is not created for Award while creating direct Grant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Award       | Mandatory | Desk Review | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Files" sub tab
    Then I see "No Records Found" inside flex table with id "---subAwardStandAlone:-:awardSuppDocTableId---"
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Files" sub tab
    #223402
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"

  @223425 @ValidateasAdminusercannotabletoseeActioncolumnundersupportingdocumentchecklistonAwardisinSendtosrstatebeforeapprovalwhensupportingdocumentchecklistcreatedorAwardwhilecreatingdirectGrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate as Admin user can not able to see "Action" column under supporting document checklist on Award is in "Send to s/r" state before approval when supporting document checklist is created for Award while creating direct Grant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFieldsIndUser1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I click on "Upload Template" icon for "Automation" inside flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:IND Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    #223425
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:awardSuppDocTableId---"
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:awardSuppDocTableId---"

  @223415 @ValidateasINDusercanabletouploadtemplateatsrsideundersupportingdocumentchecklistonAwardisinSendtosrafterApprovalstatewhensupportingdocumentchecklistiscreatedforAwardwhilecreatingdirectGrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate as IND user can able to upload template at s/r side under supporting document checklist on Award is in "Send to s/r after Approval" state when supporting document checklist is created for Award while creating direct Grant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFieldsIndUser1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I click on "Upload Template" icon for "Award" inside flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" with wait for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:IND Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    When I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    Then I softly see value "View" for title "Template Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see value "View" for title "Subrecipient Document Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    And I save the link value from row "1" for column name "Subrecipient Document Link" as "SubrecipientDocumentLink" from flex table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    And I click in table hyperlink containing value "{SavedValue:SubrecipientDocumentLink}"
    Then I softly verify that the file "Attachment.pdf" is downloaded

  @223815 @ValidateassrusercannotabletoseeActioncolumnundersupportingdocumentchecklistonAwardisinRejectedstatebeforeapprovalwhensupportingdocumentchecklistiscreatedforAwardwhilecreatingdirectGrant @Sprint-10-US-217547 @vaibhav @SuppDoc
  Scenario: Validate as s/r user can not able to see "Action" column under supporting document checklist on Award is in "Rejected" state before approval when supporting document checklist is created for Award while creating direct Grant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "abc" into field "fieldGrantDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:grantSupportDocTableId---" by clicking "Add" :
      | Description | Required  | Applies To | Status |
      | Award       | Mandatory | Award      | Active |
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name              | Award  |
      | Automation ADMIN1 | Step 1 |
    And I wait for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "9" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly can see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    When I click on "Attach" icon for "Award" inside flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---" without waiting for record
    Then I softly see "Add Supporting Documents Checklist" opens in overLay window
    Then I see only the following ordered options in dropdown field "WorkspaceFilesUpload" :
      | Select file classification | Template for Award | Others |
    When I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    Then I softly see value "View" for title "Subrecipient Document Link" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    And I save the link value from row "1" for column name "Subrecipient Document Link" as "SubrecipientDocumentLink" from flex table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    And I click in table hyperlink containing value "{SavedValue:SubrecipientDocumentLink}"
    Then I softly verify that the file "Attachment.pdf" is downloaded
    When I click on "Reject" in the page details
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Files" sub tab
    Then I softly see value "Mandatory" for title "Required" against the value "Award" inside table "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly do not see "Actions" in flex table header "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"
    Then I softly cannot see row level action button "Attach" against "Award" in flex table with id "---subAwardStandAlone:-:RecipientSubAwardChecklistTableId---"