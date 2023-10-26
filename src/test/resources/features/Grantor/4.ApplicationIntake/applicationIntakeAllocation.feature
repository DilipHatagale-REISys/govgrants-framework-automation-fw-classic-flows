@applicationIntakeAllocation @grantor-regression @grantor-parallel-regression @app @regression @ApplicationExecution-reg
Feature: Validate all scenarios in the Formula Announcement tab

  @219696 @ValidateSPIUseruserabletoseetheBudgetsummarysectionitshouldbevisibleatthetopofBudgetTabnotincludingnoncashmatchcashmatchotherleverage @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPI User user able to see the Budget summary section it should be visible at the top of Budget Tab(not including noncash match/cash match, other leverage)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
    When I login to "Grants Portal" app as "SPI3" user
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

  @219703 @ValidateSPIUserifbudgetedamountisnotequaltoallocationamountthenerrormessageshouldgenerateonclickonsubmittograntorbutton @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate SPI User if budgeted amount is not equal to allocation amount then error message should generate on click on submit to grantor button
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
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
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I login to "Grants Portal" app as "SPA" user
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
    When I login to "Grants Portal" app as "SPA" user
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
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA-Automation PO user"
#    When I login to "As a Grantor" app as "PO" user
#    And I navigate to "Announcements" tab
#    When I navigate to "Formula" content inside "Announcements" subheader on left panel
#    And I click toggle button to select "Draft Formula Announcements"
#    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
#    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
#    And I click modal button "Continue"
#    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    When I navigate to "Overview" sub tab
#    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "AnnEGMSID"
#    When I navigate to "Financials" sub tab
#    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
#    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
#    When I close "Associate Funding Accounts" modal by clicking the top right x button
#    And I refresh the page
#    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
#      | Funding Account             | Pre-Encumbrance |
#      | {SavedValue:fundingAccount} | 100             |
#    When I navigate to "Financials" sub tab
#    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
#    When I refresh the page
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
#      | Name                      | Announcement |
#      | {SavedValue:EXE Username} | Step 1       |
#    And I click on "Edit" in the page details
#    When I navigate to "Financials" sub tab
#    And I enter value "Justified" into field "Justification__c"
#    And I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
#    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
#    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
#    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
#    When I close "Add Organizations" modal by clicking the top right x button
#    And I refresh the page
#    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
#    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
#    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
#      | Title                           | Allocation Amount |
#      | Automation Permanent Focus Area | 1000              |
#    When I navigate to "Financials" sub tab
#    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Budget Period Name | Start Date | End Date |
#      | BP01               | 50         | 150      |
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
#    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Announcements" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
#    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
#    And I "Approve" in the approval decision
#    Then I softly see status in Progress-bar is "Approved" and is "Green"
#    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Announcements" tab
#    When I navigate to "Formula" content inside "Announcements" subheader on left panel
#    And I click toggle button to select "All Formula Announcements"
#    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
#    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
#    When I navigate to "Overview" sub tab
#    And I click on "Publish" in the page details
#    Then I softly see field "Status" as "Published"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
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
    Then I softly can see page block "Budget Summary by Focus Area"

  @219951 @ValidateINDUserbudgetedAmounteachfocusareashouldgetupdatedfromthebudgetsection @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate IND User budgeted Amount each focus area should get updated from the budget section
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
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
    When I login to "Grants Portal" app as "SPA" user
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
      | Focus Area | Budgeted Amount |

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
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    Then I cannot see the following messages in the page details contains:
      | Overview Tab - Requested Amount should be less than or equal to Subaward Ceiling Amount. |
      | Overview Tab - Requested Amount should be more than or equal to Subaward floor Amount.   |

  @219960 @ValidateINDUserifbudgetedamount&AllocationAmountisnotequalthenusershouldabletoseetheerrormessageonclickonsubmittograntorbutton @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate IND User if budgeted amount & Allocation Amount is not equal then user should able to see the error message on click on submit to grantor button
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
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
    Then I softly see the following messages in the page details contains:
      | Budget Tab- The Budgeted Amount is not matching the Allocation Amount for following Focus Areas {Automation Permanent Focus Area} |

  @219954 @ValidateINDUserFocusareasbudgetedamountmustbeequaltoAllocationamountforthatfocusareainbudgetsummarysection @sprint-11-US-203038 @vaibhav @Allocation
  Scenario: Validate IND User Focus area's budgeted amount, must be equal to Allocation amount for that focus area in budget summary section
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
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

  @219459 @219476 @219571 @219575 @DirectedAnnVerifyasSPIuserIcannotseesubawardfloorandsubawardceilingundertheoverviewtabinopportunityoverviewsectiononAppWithFocusAreaYes @sprint-11-US-203541 @komal @Allocation
  Scenario Outline: Directed Ann_ Verify as SPA/SPI  user I see new 'Budget summary', 'Budget Summary by Focus Area' and Budgeted Amount section on App in budget tab only if Focus area set as 'Yes' on Ann
  | Directed Ann Verify as SPI user I cannot see  subaward floor, sub-award ceiling under the overview tab in opportunity overview section on App |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219459
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219575
    Then I softly see field "Budgeted Amount" inside page block
    #219476
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219571
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Examples:
      | User |
      | SPA  |
      | SPI3 |

  @219479 @219572 @219577 @DirectedAnnasINDuserIseenewBudgetsummarysectionontopofbudgettabonAppsetasfocusareaisNo @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann as IND user I see new 'Budget summary' and 'Budgeted Amount' section on top of budget tab on App set as focus area is 'No'
  | Directed Ann_ Verify as IND user I should not see 'Budget Summary by Focus Area' section on App in budget tab if Focus area set as 'No' on Ann |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "INVITED_APPLICANT_IND_ORG_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219577
    Then I softly see field "Budgeted Amount" inside page block
    #219479
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219572
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @219532 @219569 @DirectedAnnVerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountlessthansubawardflooramountWithFocusAreaYes
  @DirectedAnnVerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountmorethansubawardCeilingamountWithFocusAreaYes @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount less than sub-award floor amount
  | Directed Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount more than sub-award Ceiling amount  |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    #219532
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
    #219569
    And I refresh the page
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    And I wait for "5" seconds
    When I click on "Submit Application" in the page details
#   TODO: Message disappearing shortly
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section. |

  @226900 @226896 @DirectedAnnVerifyasSPISPAIseeRequestedbudgetfieldnameshouldrenameasBudgetedAmountonAppunderoverviewtabwhenFocusareaNo @sprint-11-US-203541 @komal @Allocation
  Scenario Outline: Directed Ann_ Verify as SPA/SPI  user I see new 'Budget summary' and 'Budgeted Amount' section on App in budget tab only if Focus area set as 'No' on Ann
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #226900
    Then I softly see field "Budgeted Amount" inside page block
    #226896
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Examples:
      | User |
      | SPA  |
      | SPI3 |

  @226907 @226908 @226913 @226914 @DirectedAnnVerifyasINDuserIseenewBudgetsummarysectionontopofbudgettabonAppsetasfocusareaisYes @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann_ Verify as IND user I cannot see  sub-award floor and sub-award ceiling, under the overview tab in opportunity overview section on App when FA=YES
  | Directed Ann_ Verify as IND user I see 'Budget Summary by Focus Area' section on App in budget tab if Focus area set as 'Yes' on Ann |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "INVITED_APPLICANT_IND_ORG"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #226907
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #226914
    Then I softly see field "Budgeted Amount" inside page block
    #226908
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #226913
    Then I softly see "Budget Summary by Focus Area" page block displayed

  @226909 @226911 @DirectedAnnVerifyvalidationmessageshouldbedisplaytoINDonAppifuserenterbudgetedamountlessthansubawardflooramountWithFocusAreaYes
  @DirectedAnnVerifyvalidationmessageshouldbedisplaytoINDonAppifuserenterbudgetedamountmorethansubawardCeilingamountWithFocusAreaYes @sprint-11-US-203541 @komal @Allocation
  Scenario: Directed Ann_ Verify validation message should be display to IND on App if user enter budgeted amount less/greater than sub-award floor amount
  | Directed Ann_ Verify validation message should be display to IND on App if user enter budgeted amount more than sub-award Ceiling amount  |
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "INVITED_APPLICANT_IND_ORG_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation IND" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    #226909
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
    #226911
    And I refresh the page
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section. |

  @219631 @219632 @219654 @CompetitiveAnnVerifyasSPIuserIcannotseesubawardfloorandsubawardceilingundertheoverviewtabinopportunityoverviewsectiononApp @sprint-11-US-203541 @komal @Allocation
  Scenario Outline: Competitive Ann_ Verify as SPA/SPI  user I see new 'Budget summary' and 'Budget Summary by Focus Area' section on App in budget tab only if Focus area set as 'Yes' on Ann
  | Competitive Ann_ Verify as SPI user I cannot see  sub-award floor, sub-award ceiling and Budgeted Amount under the overview tab in opportunity overview section on App |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219631
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219661
    Then I softly see field "Budgeted Amount" inside page block
    #219632
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219654
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Examples:
      | User |
      | SPA  |
      | SPI3 |

  @219633 @219656 @219662 @CompetitiveAnnVerifyasINDuserIseenewBudgetsummarysectionontopofbudgettabonAppsetasfocusareaisNo @sprint-11-US-203541 @komal @Allocation
  Scenario: Competitive Ann_ Verify as IND user I see new 'Budget summary' and 'Budgeted Amount' section on top of budget tab on App set as focus area is 'No'
  | Competitive  Ann_ Verify as IND user I should not see 'Budget Summary by Focus Area' section on App in budget tab if Focus area set as 'No' on Ann |
    Given I published "Competitive " type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #219662
    Then I softly see field "Budgeted Amount" inside page block
    #219633
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    #219656
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @219642 @219648 @CompetitiveAnnVerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountlessthansubawardflooramount
  @CompetitiveAnnVerifyvalidationmessageshouldbedisplaytoSPIonAppifuserenterbudgetedamountmorethansubawardCeilingamount @sprint-11-US-203541 @komal @Allocation
  Scenario: Competitive  Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount less than sub-award floor amount
  | Competitive  Ann_ Verify validation message should be display to SPI on App if user enter budgeted amount more than sub-award Ceiling amount  |
    Given I published "Competitive " type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    #219642
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
    #219648
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount should be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section. |

  @219158 @219164 @219195 @PagelayoutmodificationduetoAllocationlevelonsubmittedApplicationslayoutsubmittedagainstallannouncementsInternalSide @sprint-10-US-203669 @komal @Allocation
  Scenario Outline: Verify Page layout modification due to Allocation level on submitted Applications layout submitted against all announcements (Internal Side)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation IND" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside table
    And I navigate to "Budget" sub tab
    #219158 #219164 #219195
    Then I softly see "Budget Summary" page block displayed
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see field "Allocation Amount" inside page block

    Examples:
      | User |
      | PM   |
      | EXE  |

  @219172 @219242 @219231 @FormulaAnnVerifyasAdminuserIseeBudgetSummarybyFocusAreasectionexactafterthebudgetsummarysectionunderbudgettabonApp @sprint-10-US-203669 @komal @Allocation
  Scenario: Formula Ann_ Verify as Admin user I see 'Budget Summary by Focus Area' section exact after the budget summary section under budget tab on App
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside table
    #219242
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219172
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    #219231
    Then I see the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Focus Area | Budgeted Amount |

  @219176 @FormulaAnnVerifyasEXEuserIcanseeBudgetSummarybyFocusAreasectiononAppifsettingallocationlevelByapplicantandFocusareaisYesonAnn @sprint-10-US-203669 @komal @Allocation
  Scenario: Formula Ann_ Verify as EXE user I can see 'Budget Summary by Focus Area' section on App if setting allocation-level = By applicant and Focus area is 'Yes' on Ann
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside table
    And I navigate to "Budget" sub tab
    #219176
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I see the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Focus Area | Allocation Amount | Budgeted Amount |

  @219230 @FormulaAnnVerifyFocusareasectionshouldbehiddenonappevenifFocusAreaisnoandAllocationlevel @sprint-10-US-203669 @komal @Allocation
  Scenario: Formula Ann_ Verify Focus area section should be hidden on app, even if Focus Area is "no" and Allocation level
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside table
    And I navigate to "Budget" sub tab
    #219230
    Then I softly do not see "Focus Area" page block displayed
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @219297 @219307 @DirectedAnnVerifyasPMuserIcannotseesubawardfloorandsubawardceilingundertheoverviewtabinApp @sprint-10-US-203669 @komal @Allocation
  Scenario: Directed Ann_ Verify as PM user I cannot see  sub-award floor and sub-award ceiling, under the overview tab in App
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    #219297
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219307
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I see the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Focus Area | Budgeted Amount |

  @219300 @DirectedAnnVerifyasPMuserIseenewBudgetsummarysectionontopofbudgettabonApp @sprint-10-US-203669 @komal @Allocation
  Scenario: Directed Ann_ Verify as PM user I see new 'Budget summary' section on top of budget tab on App
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    #219300
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Then I softly see field "Budgeted Amount" inside page block

  @219308 @DirectedAnnVerifyasEXEuserIcannotseeBudgetSummarybyFocusAreasectiononAppifsettingfocusareaisNoonAnn @sprint-10-US-203669 @komal @Allocation
  Scenario: Directed Ann_ Verify as EXE user I can not see 'Budget Summary by Focus Area' section on App  if setting focus area is No on Ann
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I navigate to "Budget" sub tab
    #219308
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @219303 @DirectedAnnVerifyasEXEuserIseenewBudgetsummarysectionontopofbudgettabonApp @sprint-10-US-203669 @komal @Allocation
  Scenario: Directed Ann_ Verify as EXE user I see new 'Budget summary' section on top of budget tab on App
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    #219303
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block

  @219334 @219340 @CompetitiveAnnVerifyasPMuserIcannotseesubawardfloorandsubawardceilingundertheoverviewtabinApp @sprint-10-US-203669 @komal @Allocation
  Scenario: Competitive Ann_ Verify as PM user I cannot see  sub-award floor and sub-award ceiling, under the overview tab in App
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    #219334
    And I navigate to "Overview" sub tab
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219340
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I see the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Focus Area | Budgeted Amount |

  @219338 @CompetitiveAnnVerifyasEXEuserIseenewBudgetsummarysectionontopofbudgettabonApp @sprint-10-US-203669 @komal @Allocation
  Scenario: Competitive Ann_ Verify as EXE user I see new 'Budget summary' section on top of budget tab on App
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    #219338
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block

  @219336 @CompetitiveAnnVerifyasPMuserIseenewBudgetsummarysectionontopofbudgettabonApp @sprint-10-US-203669 @komal @Allocation
  Scenario: Competitive Ann_ Verify as PM user I see new 'Budget summary' section on top of budget tab on App
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    #219336
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Then I softly see field "Budgeted Amount" inside page block

  @219342 @CompetitiveAnnVerifyasAdminuserIcannotseeBudgetSummarybyFocusAreasectiononAppifsettingfocusareaisNoonAnn @sprint-10-US-203669 @komal @Allocation
  Scenario: Competitive Ann_ Verify as Admin user I can not see 'Budget Summary by Focus Area' section on App  if setting focus area is No on Ann
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    #219342
    Then I softly do not see "Budget Summary by Focus Area" page block displayed

  @219363 @219366 @CompetativeAnnVerifyasPMuserIcanseeRecommendedforawardcolumnisvisiblewhenAppstatusisnegotiationCompleted @sprint-10-US-203669 @komal @Allocation
  Scenario: Competitive Ann_ Verify as PM user I can see Recommended budget field is visible when App status is negotiation completed
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANTNT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
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
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:homePendingTasks---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    Then I softly can see top right button "Complete Negotiation" in page detail
    When I click on "Complete Negotiation" in the page details
    #219363
    When I navigate to "Budget" sub tab
    #Then I softly see field "Recommended Budget" inside page block
    #219366
    And I click on "Create Subaward" in the page details
    And I click on back arrow
    Then I softly see that "{SavedValue:Automation Runtime FDM Announcement}" is in "Converted to Award" status
    When I navigate to "Budget" sub tab
    Then I softly see field "Recommended Budget" inside page block

  @219360 @DirectedAnnVerifyasAdminuserIcanseeRecommendedBudgetfieldisvisibleunderbudgetsummarywhenAppstatusisnegotiationsubmitted @sprint-10-US-203669 @komal @Allocation
  Scenario: Directed Ann_ Verify as Admin user I can see Recommended Budget field is visible under budget summary when App status is negotiation submitted
    Given I published "Directed" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
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
    And I wait for "7" seconds
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}"
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    #219360
    When I navigate to "Budget" sub tab
    #Then I softly see field "Recommended Budget" inside page block

  @219325 @CompetitiveAnnVerifyasPMusershouldnotseeFocusAreasectionunderBudgetsubtabofpreapplicationevenifsettingasAllocationlevelisNAFocusAreaisYES @sprint-09-US-208948 @komal @Allocation
  Scenario: Competitive Ann as PM user should not see 'Focus Area' section under Budget subtab of pre-application even if setting as Allocation level is 'NA' & Focus Area is 'YES'
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "preAppId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    When I navigate to "Budget" sub tab
    #219325
    Then I softly cannot see page block "Focus Area"
    Then I softly can see page block "Budget Summary by Focus Area"

  @219330 @CompetitiveAnn>>VerifyasPMusercannotsee'BudgetSummarybyFocusArea'sectionbelowBudgetsummarysectionunderBudgetsubtabofpre-applicationifsettingasfocusAreais'NO' @sprint-09-US-208948 @komal @Allocation
  Scenario: Competitive Ann>> Verify as PM user can not see 'Budget Summary by Focus Area' section below Budget summary section under Budget subtab of pre-application if setting as focus Area is 'NO'
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "PRE_APP_YES_FOCUS_AREA_NO"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "preAppId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    When I navigate to "Budget" sub tab
    #219330
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Budget Summary by Focus Area"

  @219326 @221290 @DirectedAnnVerifyasPOusershouldnotseeFocusAreasectionunderBudgetsubtabofpreapplicationevenifsettingasAllocationlevelisNAFocusAreaisYES @sprint-09-US-208948 @komal @Allocation
  Scenario Outline: Directed Ann>> Verify as PO user should not see 'Focus Area' section under Budget subtab of pre-application even if setting as Allocation level is 'NA' & Focus Area is 'YES'
  | Directed Ann>> Verify as EXE user can see 'Budget Summary by Focus Area' section below Budget summary section under Budget subtab of pre-application if setting as focus Area is 'YES''|
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "preAppId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    When I navigate to "Budget" sub tab
    #219326
    Then I softly cannot see page block "Focus Area"
    #221290
    Then I softly can see page block "Budget Summary by Focus Area"

    Examples:
      | User |
      | PO   |
      | EXE  |

  @219328 @DirectedAnnVerifyasPOusercannotseeBudgetSummarybyFocusAreasectionbelowBudgetsummarysectionunderBudgetsubtabofpreapplicationifsettingasfocusAreaisNO @sprint-09-US-208948 @komal @Allocation
  Scenario: Directed Ann>> Verify as PO user can not see 'Budget Summary by Focus Area' section below Budget summary section under Budget subtab of pre-application if setting as focus Area is 'NO'
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PRE_APP_YES_FOCUS_AREA_NO"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "preAppId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    When I navigate to "Budget" sub tab
    #219328
    Then I softly cannot see page block "Focus Area"
    Then I softly cannot see page block "Budget Summary by Focus Area"

  @219096 @219100 @219080 @219108 @PreapplicationVerifyasSPIusershouldseeBudgetedAmountsectioninsteadofRequestedAmountsectionunderOverviewsubtabofpreapplicationforCompetitiveAnnouncement @sprint-09-US-208978 @komal @Allocation
  Scenario: Competitive Ann>> Verify as PM user should not see 'Focus Area' section under Budget subtab of pre-application even if setting as Allocation level is 'NA' & Focus Area is 'YES'
  | Pre-application>>Verify as SPI user should see Budget Summary section on top level under Budget subtab of pre-application for Competitive Announcement|
  | Pre-application>>Verify as SPI user should not see both Sub award floor & sub award ceiling field under Opportunity overview section for Competitive Announcement |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    #219100
    Then I softly see "Budget Summary" page block displayed
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    #219096
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly do not see "Pre-application Overview" page block displayed
    #219080
    When  I navigate to "Overview" sub tab
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #219108
    When I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount must be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section on the Budget tab. |
    And I refresh the page
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    And I wait for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount must be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section on the Budget tab. |

  @219112 @PreapplicationVerifyasSPAusershouldseeBudgetSummarybyFocusAreasectionbelowBudgetSummarysectionunderbudgettabofpreapplicationiffocusareaisYESforCompetitiveAnnouncement @sprint-09-US-208978 @komal @Allocation
  Scenario: Pre-application>>Verify as SPA user should see Budget Summary by Focus Area section below Budget Summary section under budget tab of pre-application if focus area is 'YES' for Competitive Announcement
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    #219112
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I see the following headers in table with id "---applicationIntake:-:focusAreaTableAppId---" :
      | Focus Area | Budgeted Amount |
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly can see top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"

  @221116 @221129 @221152 @219085 @PreapplicationVerifyasSPAusershouldnotseebothSubawardfloor&subawardceilingfieldsunderOpportunityoverviewsectionforDirectedAnnouncement @sprint-09-US-208978 @komal @Allocation
  Scenario: Pre-application>>Verify as SPA user should not see both Sub award floor & sub award ceiling fields under Opportunity overview section for Directed Announcement
  | Pre-application>>Verify as SPI user should see Budget Summary by Focus Area section below Budget Summary section under budget tab of pre-application if focus area is 'YES'  for Directed Announcement |
  | Pre-application>>Verify as SPI user should see validation related to sub award floor and sub award ceiling fields & pointing to the Budget tab of pre-application for Directed Announcement|
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    #221116
    Then I softly see "Budget Summary" page block displayed
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly do not see "Pre-application Overview" page block displayed
    #221129
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I see the following headers in table with id "---applicationIntake:-:focusAreaTableAppId---" :
      | Focus Area | Budgeted Amount |
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly can see top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    #219085
    When  I navigate to "Overview" sub tab
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    #221152
    When I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 900    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount must be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section on the Budget tab. |
    And I refresh the page
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 11000  | 100        | 100            |
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount must be less than or equal to the Subaward Ceiling Amount. Adjust the Budgeted Amount in the Budget period section on the Budget tab. |

  @221170 @PreapplicationVerifyasSPIusershouldnotseeBudgetSummarybyFocusAreasectionbelowBudgetSummarysectionunderbudgettabofpreapplicationiffocusareaisNOforDirectedAnnouncement @sprint-09-US-208978 @komal @Allocation
  Scenario:Pre-application>>Verify as SPI user should not see Budget Summary by Focus Area section below Budget Summary section under budget tab of pre-application if focus area is 'NO' for Directed Announcement
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PRE_APP_YES_FOCUS_AREA_NO"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    #221170
    Then I softly cannot see page block "Budget Summary by Focus Area"

  @221113 @PreapplicationVerifyasSPAusershouldseeBudgetedAmountfieldunderPreapplicationOverviewsectionunderOverviewsubtabofpreapplicationforDirectedAnnouncement @sprint-09-US-208978 @komal @Allocation
  Scenario: Pre-application>>Verify as SPA user should see 'Budgeted Amount' field under 'Pre-application Overview' section under Overview subtab of pre-application for Directed Announcement
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    #221113
    Then I softly see "Pre-Application Overview" page block displayed
    Then I softly see field "Budgeted Amount" inside page block

  @222471 @DirectiveAnnVerifyINDusercaneditBudgetTabBudgetSummarybyFocusAreasectiononlyifpreapplicationissenttosrfornegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario: Directive Ann - Verify IND user can edit "Budget Tab: Budget Summary by Focus Area" section only if pre-application is sent to s/r for negotiation
    Given I published "Directed" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "INVITED_APPLICANT_IND_ORGPRE_PRE_APPLICATION_NEGOTIATION"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:IND Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    #222471
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly can see top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"

  @222478 @VerifyINDusercannoteditBudgetTabBudgetSummarybyFocusAreasectioninnegotiationacceptstateforpreapp @sprint-10-US-221062 @komal @Allocation
  Scenario: Verify IND user can not edit "Budget Tab: Budget Summary by Focus Area" section in negotiation accept state for pre-app
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:IND Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    #222478
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Accept" in the page details
    Then I see status in Progress-bar is "Accepted" and is "Green"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "RecipientPreApplications" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I see status in Progress-bar is "Accepted" and is "Green"
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly cannot see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly cannot see row level action button "Remove Focus Area" against "Automation Permanent Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"

  @222475 @DirectiveAnnVerifyINDusercanteditBudgetTabBudgetSummarybyFocusAreasectionifgrantornotselectedBudgetTabBudgetSummarybyFocusAreaforpreapplicationfornegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario: Directive Ann - Verify IND user can't edit "Budget Tab: Budget Summary by Focus Area" section if grantor not selected "Budget Tab: Budget Summary by Focus Area" for pre-application for negotiation
    Given I published "Directed" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "INVITED_APPLICANT_IND_ORGPRE_PRE_APPLICATION_NEGOTIATION-Automation EXE user"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:IND Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When  I enter "Edition_PreApp" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    #222475
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly cannot see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly cannot see top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"

  @222483 @VerifyINDusercanaddremovefocusareaintheBudgetTabBudgetSummarybyFocusAreasectiononlyifpreapplicationissenttosrfornegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario: Verify IND user can add/remove focus area in the "Budget Tab: Budget Summary by Focus Area" section only if pre-application is sent to s/r for negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "INVITED_APPLICANT_IND_ORGPRE_PRE_APPLICATION_NEGOTIATION-Automation EXE user-Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I click on "Unpublish" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I click on "Edit" in the page details
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter value "No" into field "fieldDetailedBudgetingRequired__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:IND Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    #222483
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I check "Automation Permanent Focus Area2" boxes in flex table with id "---applicationIntake:-:RemoveFocusAreaPreAppTableId---"
    When I click on top right button "Remove" in flex table with id "---applicationIntake:-:RemoveFocusAreaPreAppTableId---"
    And I close modal by clicking the top right x button
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Focus Area" inside table "---applicationIntake:-:focusAreaTableAppId---"
    When I click on top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I check "Automation Permanent Focus Area2" boxes in flex table with id "---applicationIntake:-:focusAreaAssociateTableId---"
    When I click on top right button "Add" in flex table with id "---applicationIntake:-:focusAreaAssociateTableId---"
    And I close modal by clicking the top right x button
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area" inside table "---applicationIntake:-:focusAreaTableAppId---"
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock

  @222463 @VerifyEXEusercanseeBudgetTabBudgetSummarybyFocusAreaoptioninsteadofBudgetTabFocusAreainPreApplicationsectionforNegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario: Verify EXE user can see "Budget Tab: Budget Summary by Focus Area" option instead of "Budget Tab: Focus Area" in Pre-Application section for Negotiation
    Given I published "Directed" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "INVITED_APPLICANT_IND_ORGPRE_PRE_APPLICATION_NEGOTIATION-Automation EXE user"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I save the field containing "Leverage Allowed?" as "Yes"
    And I save the field containing "Maximum # Applications Allowed" as "1"
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:IND Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    #222463
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldPreApplicationSectionsforRevision__c"
    Then I see multipicklist field "PreApplicationSectionsforRevision__c" contains value "Budget Tab: Budget Summary by Focus Area" under list "Pre-Application Sections for Revision - Available"

  @222462 @222477 @VerifyPMusercanseeBudgetTabBudgetSummarybyFocusAreaoptioninsteadofBudgetTab:FocusAreainPreApplicationsectionforNegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario: Verify PM user can see "Budget Tab: Budget Summary by Focus Area" option instead of "Budget Tab: Focus Area" in Pre-Application section for Negotiation
  | Verify SPI/SPA user can not edit/add/remove focus area from "Budget Tab: Budget Summary by Focus Area" section in negotiation submit to grantor state for pre-app |
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    #222462
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldPreApplicationSectionsforRevision__c"
    Then I see multipicklist field "PreApplicationSectionsforRevision__c" contains value "Budget Tab: Budget Summary by Focus Area" under list "Pre-Application Sections for Revision - Available"
    #222477
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    And I navigate to "Budget" sub tab
    Then I softly cannot see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly cannot see row level action button "Remove Focus Area" against "Automation Permanent Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"

  @222473 @DirectiveAnnVerifyINDusercaneditBudgetTabBudgetSummarybyFocusAreasectiononlyifpreapplicationissenttosrfornegotiationSPISPAusercanteditBudgetTabBudgetSummarybyFocusAreasectionifgrantornotselectedBudgetTabBudgetSummarybyFocusAreaforpreapplicationfornegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario Outline: Verify SPI SPA user can't edit Budget Tab Budget Summary by Focus Area" section if grantor not selected Budget Tab Budget Summary by Focus Area for pre application for negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name       | Project Role             | Is Key Contact |
      | <UserName> | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    #222473
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Edition_PreApp" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    And I navigate to "Budget" sub tab
    Then I softly cannot see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly cannot see row level action button "Remove Focus Area" against "Automation Permanent Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Examples:
      | User | UserName                   |
      | SPI3 | {SavedValue:SPI3 Username} |
      | SPA  | {SavedValue:SPA Username}  |

  @222481 @VerifySPISPAusercanaddremovefocusareaintheBudgetTabBudgetSummarybyFocusAreasectiononlyifpreapplicationissenttosrfornegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario Outline: Verify SPI/SPA user can add/remove focus area in the "Budget Tab: Budget Summary by Focus Area" section only if pre-application is sent to s/r for negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I click on "Unpublish" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I click on "Edit" in the page details
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter value "No" into field "fieldDetailedBudgetingRequired__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name       | Project Role             | Is Key Contact |
      | <UserName> | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    #222481
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I check "Automation Permanent Focus Area2" boxes in flex table with id "---applicationIntake:-:RemoveFocusAreaPreAppTableId---"
    When I click on top right button "Remove" in flex table with id "---applicationIntake:-:RemoveFocusAreaPreAppTableId---"
    And I close modal by clicking the top right x button
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Focus Area" inside table "---applicationIntake:-:focusAreaTableAppId---"
    When I click on top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I check "Automation Permanent Focus Area2" boxes in flex table with id "---applicationIntake:-:focusAreaAssociateTableId---"
    When I click on top right button "Add" in flex table with id "---applicationIntake:-:focusAreaAssociateTableId---"
    And I close modal by clicking the top right x button
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area" inside table "---applicationIntake:-:focusAreaTableAppId---"
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    Examples:
      | User | UserName                   |
      | SPI3 | {SavedValue:SPI3 Username} |
      | SPA  | {SavedValue:SPA Username}  |

  @222470 @VerifySPISPAusercaneditBudgetTabBudgetSummarybyFocusAreasectiononlyifpreapplicationissenttosrfornegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario Outline: Verify SPI/SPA user can edit "Budget Tab: Budget Summary by Focus Area" section only if pre-application is sent to s/r for negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name       | Project Role             | Is Key Contact |
      | <UserName> | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "<User>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    #222470
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Then I softly can see top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    Examples:
      | User | UserName                   |
      | SPI3 | {SavedValue:SPI3 Username} |
      | SPA  | {SavedValue:SPA Username}  |

  @222695 @VerifyBudgetsummarybyfocusareasectionshouldbehiddenonpreappiffocusareasetasNoonAnnbutstilltheoptionBudgetsummarybyfocusareaonpreappnegotiation @sprint-10-US-221062 @komal @Allocation
  Scenario: Verify 'Budget summary by focus area' section should be hidden on pre-app if focus area set as 'No' on Ann but still the option 'Budget summary by focus area' on pre-app negotiation
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APP_YES_NEGO_YES_FOCUS_AREA_NO"
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Pre-Application Sections for Negotiation" as "Budget Tab: Budget Summary by Focus Area Budget Tab: Budget Details"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    #222695
    And I navigate to "Budget" sub tab
    Then I softly cannot see page block "Budget Summary by Focus Area"
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Pre-Application Sections for Negotiation" as "Budget Tab: Budget Summary by Focus Area Budget Tab: Budget Details"

  @222501 @DirectiveAnnVerifySPIuserseevalidationmessageifbudgetamountnotmatcheswithsubawardceilingAmtduetouserremovefocusareaandtrytosubmitpreapptograntor @sprint-10-US-221062 @komal @Allocation
  Scenario: Directive Ann - Verify SPI user see validation message if budget amount not matches with sub award ceiling Amt due to user remove focus area and try to submit pre-app to grantor
    Given I published "Directed" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "ActiveFundingOpportunities" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "ActiveFundingOpportunities"
    And I click on "Unpublish" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I click on "Edit" in the page details
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter value "No" into field "fieldDetailedBudgetingRequired__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppEgmsId"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit_Budget" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    #222501
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEgmsId}" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEgmsId}" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I check "Automation Permanent Focus Area" boxes in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I click on top right button "Remove" in flex table with id "---applicationIntake:-:RemoveFocusAreaPreAppTableId---"
    And I close modal by clicking the top right x button
    When I click on "Submit to Grantor" in the page details
    And I softly see the following messages in the page details contains:
      | Budget Tab - Budgeted Amount must be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section on the Budget tab. |

  @227868 @227871 @VerifySPIUserresubmittheapplicationafternegotiationFromFDMcheckwhentheBudgetedamountmustbeequaltotheAllocationAmount @sprint-13-US-224692 @komal @Allocation
  Scenario Outline:  Verify SPI User  resubmit the application after negotiation (From FDM), check when the Budgeted amount must be equal to the Allocation Amount
  |  Verify SPI User  resubmit the application after negotiation (From FDM), check when the Budgeted amount must be equal to the Allocation Amount |
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "<AllocationLevel>"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |

    Examples:
      | Announcement Name                                    | AllocationLevel            |
      | {SavedValue:Automation Runtime Formula Announcement} | BY_APPLICANT               |
      | {SavedValue:Automation Runtime Formula Announcement} | BY_APPLICANT_FOCUS_AREA_NO |

  @227872 @VerifywhenSPIuserresubmittheapplicationafternegotiationfromFDMcheckFocusareasbudgetedtotalmustbeequaltoAllocationamountforthatfocusareainbudgetsummarysection @sprint-13-US-224692 @komal @Allocation
  Scenario Outline: Verify when SPI user  resubmit the application after negotiation(from FDM) check Focus area's budgeted total, must be equal to Allocation amount for that focus area in budget summary section
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab- The Budgeted Amount is not matching the Allocation Amount for following Focus Areas {Automation Permanent Focus Area} |
    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @227874 @VerifywhenINDuserresubmittheapplicationafternegotiationfromApplicationcheckFocusareasbudgetedtotalmustbeequaltoAllocationamountforthatfocusareainbudgetsummarysection&usershouldabletocreatethesubaward @sprint-13-US-224692 @komal @Allocation
  Scenario Outline:  Verify when IND user  resubmit the application after negotiation(from Application) check Focus area's budgeted total, must be equal to Allocation amount for that focus area in budget summary section  & user should able to create the subaward
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    And I created approved FDM on application "<Announcement Name>"
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab- The Budgeted Amount is not matching the Allocation Amount for following Focus Areas {Automation Permanent Focus Area} |
    And I refresh the page
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget |
      | Construction  | 1000   |
    And I wait for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock
    And I click on "Create Subaward" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Then I see the header is "Subaward" in the page details

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @274170 @ValidateFormulaPMusercanupdateallocationonparticularFAonApplicantunderApplicantsectiononAnnouncementbeforesubmittingapplication&seeupdatedAllocationAmountonsameApplication&seevalidationFAYES&AllocationTypeByApplicant @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Formula PM user can update allocation on particular FA on Applicant under Applicant section on Announcement before submitting application & see updated Allocation Amount on same Application & see validation FA YES Allocation Type By Applicant
    When I login to "As a Grantor" app as "PM" user
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
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "Automation IND" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "Automation IND"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppId"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$1,000.00"
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppId1"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 0      | 0          | 0              |
    When I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 0      | 0          | 0              |
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$0.00"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "Automation IND"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I refresh the page
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppId}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppId}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:IND Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    And I wait for "4" seconds
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab- The Budgeted Amount is not matching the Allocation Amount for following Focus Areas {Automation Permanent Focus Area} |
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppId1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppId1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
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
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$0.00"
    Then I softly see field "Allocation Amount" as "$0"
    Then I softly see value "$0" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$0" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$0" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$0" for title "Allocation Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I wait for "5" seconds
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application. |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                   |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.             |

  @274172 @ValidatePMusercanupdateallocationonparticularApplicantacrossFAunderApplicantsectiononAnnouncementaftersubmittingapplicationseeupdatedAllocationAmountonsameApplicationFAYES&AllocationTypeByApplicant @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate PM user can update allocation on particular Applicant across FA under Applicant section on Announcement after submitting application & see updated Allocation Amount on same Application FA YES & Allocation TypeBy Applicant
    When I login to "As a Grantor" app as "PM" user
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
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "Automation IND" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                            | Allocation Amount |
      | Automation Permanent Focus Area  | 500               |
      | Automation Permanent Focus Area2 | 500               |
    And I refresh the page
    And I expand nested table containing column value "Automation IND"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppId"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    And I refresh the page
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:IND Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
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
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppId1"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
    When I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
    And I refresh the page
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
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "Automation IND"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I refresh the page
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppId}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppId}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    Then I softly see value "$1,000" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$0" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$2,000" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$0" for title "Allocation Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppId1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppId1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see value "$500" for title "Budgeted Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Allocation Amount" against the value "Automation Permanent Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Allocation Amount" against the value "Automation Permanent Focus Area2" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @274245 @ValidateFormulaPMusercanupdateallocationonApplicantunderApplicantsectiononAnnouncementaftersubmittingapplicationusercanseeupdatedAllocationAmountonApplicationFANo&AllocationTypeByApplicant @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Formula PM user can update allocation on Applicant under Applicant section on Announcement after submitting application & user can see updated Allocation Amount on Application FANo Allocation Type By Applicant
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 5000             |
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$5,000"

  @274246 @ValidateFormulaPMusercanupdateallocationonApplicantunderApplicantsectiononAnnouncementbeforesubmittingapplicationseeupdatedAllocationAmountonApplicationFANoAllocationTypeByApplicant @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Formula PM user can update allocation on Applicant under Applicant section on Announcement before submitting application & see updated Allocation Amount on Application FA No & Allocation Type By Applicant
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "AppEGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 5000             |
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$5,000"

  @276440 @ValidateFormulaByapplicantFocusAreaFAYESsubrecipientusercandownloadpdfforNotyetQualifiedopportunity @Sprint-23-US-275864 @vaibhav @Allocation
  Scenario: Validate Formula By applicant & Focus Area FA YES subrecipient user can download pdf for Not yet Qualified opportunity
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I save the field labeled "EGMS ID" as "annEgmsId"
    And I click on "Menu" in the page details
    And I select "Download as PDF" from dropdown
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail                 | Page Number |
      | {SavedValue:annEgmsId} | 1           |
    Then I softly see "Published" on page "1" of "govgrants" pdf file
    Then I softly see "Opportunity Specific Settings" on page "1" of "govgrants" pdf file
    Then I softly see "Federal/NGO Programs" on page "2" of "govgrants" pdf file
    Then I softly see "Contacts" on page "2" of "govgrants" pdf file
    Then I softly see "Budget Summary" on page "3" of "govgrants" pdf file
    Then I softly see "Budget Period Details" on page "3" of "govgrants" pdf file
    Then I softly see "Budget Categories" on page "4" of "govgrants" pdf file
    Then I softly see "Focus Areas" on page "5" of "govgrants" pdf file
    Then I softly see "Goals and Objectives" on page "5" of "govgrants" pdf file
    Then I softly see "Key Performance Indicators (KPIs)" on page "5" of "govgrants" pdf file
    Then I softly see "Opportunity Files" on page "5" of "govgrants" pdf file
    Then I softly see "Notes" on page "5" of "govgrants" pdf file

  @276406 @ValidateFormulaByapplicantFANosubrecipientusercandownloadpdfforQualifiedopportunity @Sprint-23-US-275864 @vaibhav @Allocation
  Scenario: Validate Formula By applicant FA No subrecipient user can download pdf for Qualified opportunity
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I save the field labeled "EGMS ID" as "annEgmsId"
    When I click on "Qualify" in the page details
    Then I softly see field "Status" as "Qualified"
    And I click on "Menu" in the page details
    And I select "Download as PDF" from dropdown
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail                 | Page Number |
      | {SavedValue:annEgmsId} | 1           |
    Then I softly see "Published" on page "1" of "govgrants" pdf file
    Then I softly see "Opportunity Specific Settings" on page "1" of "govgrants" pdf file
    Then I softly see "Federal/NGO Programs" on page "2" of "govgrants" pdf file
    Then I softly see "Contacts" on page "2" of "govgrants" pdf file
    Then I softly see "Budget Summary" on page "3" of "govgrants" pdf file
    Then I softly see "Budget Period Details" on page "3" of "govgrants" pdf file
    Then I softly see "Budget Categories" on page "4" of "govgrants" pdf file
    Then I softly see "Goals and Objectives" on page "5" of "govgrants" pdf file
    Then I softly see "Key Performance Indicators (KPIs)" on page "5" of "govgrants" pdf file
    Then I softly see "Opportunity Files" on page "5" of "govgrants" pdf file
    Then I softly see "Notes" on page "5" of "govgrants" pdf file

  @276407 @ValidateCheckfieldsandDownloadasPDFforOppConvertedtoapplication @Sprint-23-US-275864 @vaibhav @Allocation
  Scenario: Validate Check fields and Download as PDF for Opp Converted to application
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I save the field labeled "EGMS ID" as "annEgmsId"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "appEgmsId"
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    And I click on "Menu" in the page details
    And I select "Download as PDF" from dropdown
    And I download the file
    Then I softly see following details in "govgrants" pdf file:
      | Detail                 | Page Number |
      | {SavedValue:annEgmsId} | 1           |
    Then I softly see following details in "govgrants" pdf file:
      | Detail                   | Page Number |
      | Converted to Application | 1           |
    Then I softly see "Opportunity Specific Settings" on page "1" of "govgrants" pdf file
    Then I softly see "Federal/NGO Programs" on page "2" of "govgrants" pdf file
    Then I softly see "Contacts" on page "2" of "govgrants" pdf file
    Then I softly see "Budget Summary" on page "3" of "govgrants" pdf file
    Then I softly see "Budget Period Details" on page "3" of "govgrants" pdf file
    Then I softly see "Budget Categories" on page "4" of "govgrants" pdf file
    Then I softly see "Focus Areas" on page "5" of "govgrants" pdf file
    Then I softly see "Goals and Objectives" on page "5" of "govgrants" pdf file
    Then I softly see "Key Performance Indicators (KPIs)" on page "5" of "govgrants" pdf file
    Then I softly see "Opportunity Files" on page "5" of "govgrants" pdf file
    Then I softly see "Notes" on page "5" of "govgrants" pdf file

  @274151 @VerifywhenSPIuserresubmittheapplicationafternegotiationfromFDMcheckFocusareasbudgetedtotalmustbeequaltoAllocationamountforthatfocusareainbudgetsummarysection @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario Outline: Verify when SPI user  resubmit the application after negotiation(from FDM) check Focus area's budgeted total, must be equal to Allocation amount for that focus area in budget summary section
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "SECOND_FOCUS_AREA_BY_APPLICANT_FOCUS_AREA_RISK_ASS_NO-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "<Announcement Name>"
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab- The Budgeted Amount is not matching the Allocation Amount for following Focus Areas {Automation Permanent Focus Area} |
    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @274119 @ValidatePOusercreatemultipleapplicationsondiffrecipientwhererelatedAnncreatedwithMultipleRecipient @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate PO user create multiple applications on diff recipient where related Ann created with Multiple Recipient
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
      | {SavedValue:fundingAccount} | 1000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "Automation IND" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PO | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
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
    And I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation IND" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"

  @113217 @Validatetheusercanenterprogramincome$onapplicationwhenprogramincomeinsettoyesonthefundingopportunity @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate the user can enter program income $ on application when program income is set to yes on the funding opportunity
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I enter values into fields
      | Value                       | Field                        |
      | 500                         | fieldGranteeProgramincome__c |
    When I click on "Save" in the page details
    Then I softly see field "Estimated Program Income For Project Period" as "$500.00"

  @274238 @FormulaFANoVerifyupdatedvaluesofAllocationAmountshouldgetupdatedinopportunityandQualifiedopportunityaswell @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario Outline: Formula FA No Verify updated values of Allocation Amount should get updated in opportunity and Qualified opportunity as well.
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO_NEGOTIATION_YES"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I navigate to "Financials" sub tab
    Then I softly see value "$2000" for title "Allocation Amount" inside table "---applicationIntake:-:formulaAllocatedAmountTableId---"
    When I click on "Qualify" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    And I navigate to "Financials" sub tab
    Then I softly see value "$2000" for title "Allocation Amount" inside table "---applicationIntake:-:formulaAllocatedAmountTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |