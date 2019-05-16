@applicationIntake @regression
Feature: Validate all scenarios in the Application Intake

  Background: Qualify Announcement and Create Application
    Given I delete the record "Automation Announcement for Application Intake" from the object "Application"
    And I delete the record "Automation Announcement for Application Intake" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    And I qualify the announcement "Automation Announcement for Application Intake" as user "SPI"
      | Actions    | Step 1         | Step 2        | Step 3  | Step 4        |
      | Navigation | Grants Portal  | Opportunities | Active  | Opportunities |
      | FlexTable  | popupflextable | View          | Qualify |               |
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I see that "Automation Announcement for Application Intake" is in "Created" status

  @34044 @applicationCreation @smoke
  Scenario: Creating an Application
    Then I see status in Progress-bar is "Created" and is "green"

  @34045 @applicationEdition
  Scenario: Edition of an application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @34303 @addFocusAreaToApplication
  Scenario Outline: Addition of Focus area to an application
    When I navigate to "Budget" sub tab
    Then I see that "<EGMS Id>" has been added in flextable with Id "applicationIntake::focusAreaTableId"
    Examples:
      | EGMS Id                         |
      | Automation Permanent Focus Area |

  @addBudgetDetailsToApplication @smoke
  Scenario: Addition of budget in the budget grid to an application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "applicationIntake::budgetPeriodTableId" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |

  @addTargetToKPIInApplication @smoke
  Scenario: Addition of KPI target to an application
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    Then I see that "10.00" has been added in flextable with Id "applicationIntake::kpiTableId"

  @formFillingApplication @smoke
  Scenario: To fill and complete the form in Progress Report
    When I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "applicationIntake::allFormsTableId"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Application Form - Project H.E.A.T." inside flex table with id "applicationIntake::allFormsTableId"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100%" has been added in flextable with Id "applicationIntake::allFormsTableId"

  @34156 @submitApplication @applicationIntakeHappyPath @smoke
  Scenario: Submitting an application to Grantor
#    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
#      | Actions         | Step 1 | Step 2 |
#      | Edition Buttons | Edit   | Save   |
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "applicationIntake::budgetPeriodTableId" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "applicationIntake::allFormsTableId"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Application Form - Project H.E.A.T." inside flex table with id "applicationIntake::allFormsTableId"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I see status in Progress-bar is "Submitted" and is "green"

  @34346 @viewSubmitedApplication @smoke
  Scenario Outline: Viewing the application submitted by subrecipient as Internal user
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I pause execution for "10" seconds
    And I edit the following rows inline in flex table with id "applicationIntake::budgetPeriodTableId" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "applicationIntake::allFormsTableId"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Application Form - Project H.E.A.T." inside flex table with id "applicationIntake::allFormsTableId"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "All Applications"
    When I click on "View" icon for "<Application Name>" inside table
    Then I see status in Progress-bar is "Submitted" and is "green"
    Examples:
      | User | Application Name                               |
      | EXE  | Automation Announcement for Application Intake |