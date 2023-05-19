@applicationIntakeWB @grantor-regression @grantor-parallel-regression @app @regression @ApplicationExecution-reg
Feature: Application Intake scenarios without background

  @hitesh121
Scenario: Validate the SPI cannot view the Goals and Objectives page block when it is set as No while Announcement creation| Validate the SPI cannot view the Work Plan required page block when it is set as No while Announcement creation
Validate whether SPI user can submit the application without adding supporting documents when the required documents are optional |
Validate when the Funding Opportunity Detailed budget Grid Setup as Yes then User will be able to view the Bulid up Line in the Budget Grid
Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit104651" and properties "default"
When I am on "SUBPORTAL" portal
And I login as "SPI3" user
When I navigate to "Opportunities" tab
And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit104651}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
When I click toggle button to select "Not Yet Qualified Opportunities - All"
And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit104651}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit104651}" inside table
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