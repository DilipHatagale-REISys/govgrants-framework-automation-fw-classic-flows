@applicationIntakeAllocation @grantor-regression @grantor-parallel-regression @app @regression
Feature: Validate all scenarios in the Formula Announcement tab

  @219696 @ValidateSPIUseruserabletoseetheBudgetsummarysectionitshouldbevisibleatthetopofBudgetTabnotincludingnoncashmatchcashmatchotherleverage @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPI User user able to see the Budget summary section it should be visible at the top of Budget Tab(not including noncash match/cash match, other leverage)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"

  @219700 @ValidateSPIUserinbudgetsummarytabBudgetedAmountshouldbeequaltoAllocationAmount @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPI User in budget summary tab Budgeted Amount should be equal to Allocation Amount
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocated Amount" as "$1,000"

  @219703 @ValidateSPIUserifbudgetedamountisnotequaltoallocationamountthenerrormessageshouldgenerateonclickonsubmittograntorbutton @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPI User if budgeted amount is not equal to allocation amount then error message should generate on click on submit to grantor button
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1100   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
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
    Then I softly see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |

  @219714 @ValidateSPIUseriffocusareaisNoforformulaannouncementthenBudgetSummarybyFocusAreasectionshouldnotdisplayatS/Rside @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPI User if focus area is No for formula announcement then "Budget Summary by Focus Area" section should not display at S/R side
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
    When I click "Associate" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Budget Summary by Focus Area"

  @219716 @ValidateSPAUseriffocusareaisYesforformulaannouncementthenBudgetSummarybyFocusAreasectionshoulddisplayinbudgettabatS/Rside @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPA User if focus area is Yes for formula announcement then "Budget Summary by Focus Area" section should display in budget tab at S/R side
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
    When I click "Associate" after selection of "Automation EXE" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly can see page block "Budget Summary by Focus Area"

  @219842 @ValidateSPAUserWhenfocusareaisYesforformulaannouncementtheninBudgetSummarybyfocusaresectionbelowcolumns&ActionshouldbedisplayatS/Rside @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPA User When focus area is Yes for formula announcement then in Budget Summary by focus area section below columns & Action should be display at S/R side
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
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
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I see the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Focus Area | Allocation Amount | Budgeted Amount |

  @219852 @ValidateSPAUserusershouldabletoadd&removefocusareafrombudgetsummarybyfocusareasectionatS/Rside @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPA User user should able to add & remove focus area from budget summary by focus area section at S/R side
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see value "Automation Permanent Focus Area" for title "Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove Focus Area" against "Automation Permanent Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @219884 @ValidateSPAUserusershouldabletoad&removethefocusareafromBudgetSummarybyFocusAreasectionats/rside @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPA User user should able to add & remove the focus area from Budget Summary by Focus Area section at s/r side
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see value "Automation Permanent Focus Area" for title "Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see row level action button "Remove Focus Area" against "Automation Permanent Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @219896 @ValidateINDUserifusercreateformulaannouncementwithfocusareayesthenBudgetsummarysection&BudgetSummarybyFocusAreabothsectionshouldbedisplayinbudgettab @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate IND User if user create formula announcement with focus area yes then Budget summary section & Budget Summary by Focus Area both section should be display in budget tab
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
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
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly can see page block "Budget Summary by Focus Area"

  @219951 @ValidateINDUserbudgetedAmounteachfocusareashouldgetupdatedfromthebudgetsection @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate IND User budgeted Amount each focus area should get updated from the budget section
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I see value "Automation Permanent Focus Area" for title "Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$1,000" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @219969 @219973 @ValidateSPAUserwhenForannouncementswithallocationlevelByApplicantandFocusAreaisyesthenusershouldseetheBudgetSummarybyfocusAreaSection&budgetsummarysectionalso @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPA User when For announcements with allocation-level = By Applicant and Focus Area is yes then user should see the Budget Summary by focus Area Section & budget summary section also
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly can see page block "Budget Summary by Focus Area"
    #219973
    Then I see the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Focus Area  | Budgeted Amount |

  @219974 @219982 @ValidateSPIUseronopportunityoverviewsectionSubawardfloor&SubawardCellingfieldshouldbehideforformulaannouncement @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPI User on opportunity overview section Subaward floor & Subaward Celling field should be hide for formula announcement
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    Then I do not see below fields in "Opportunity Overview" page block
      | Award Ceiling |
      | Award Floor   |
    #219982
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Edit" in the page details
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPA Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
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
    Then I cannot see the following messages in the page details contains:
      | Overview Tab - Requested Amount should be less than or equal to Subaward Ceiling Amount. |
      | Overview Tab - Requested Amount should be more than or equal to Subaward floor Amount.   |

  @219960 @ValidateINDUserifbudgetedamount&AllocationAmountisnotequalthenusershouldabletoseetheerrormessageonclickonsubmittograntorbutton @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate IND User if budgeted amount & Allocation Amount is not equal then user should able to see the error message on click on submit to grantor button
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1100   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation IND" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
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
    Then I softly see the following messages in the page details contains:
      | Budget Tab- The Budgeted Amount is not matching the Allocation Amount for following Focus Areas {Automation Permanent Focus Area} |

  @219954 @ValidateINDUserFocusareasbudgetedamountmustbeequaltoAllocationamountforthatfocusareainbudgetsummarysection @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate IND User Focus area's budgeted amount, must be equal to Allocation amount for that focus area in budget summary section
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"