@applicationIntake
Feature: Validate all scenarios in the Application Intake

  Background: Qualify Announcement and Create Application
    Given I delete the record "Execution Announcement(Dr) for Automation" from the object "Application"
    And I delete the record "Execution Announcement(Dr) for Automation" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    And I qualify the announcement "Execution Announcement(Dr) for Automation" as user "SPI"
      | Actions    | Step 1         | Step 2        | Step 3  | Step 4        |
      | Navigation | Grants Portal  | Opportunities | Active  | Opportunities |
      | FlexTable  | popupflextable | View          | Qualify |               |
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I see that "Execution Announcement(Dr) for Automation" is in "Created" status


  @34044 @applicationCreation @applicationIntake @all
  Scenario: Creating an Application
    Then I see that "Application Title" is in "Created" status

  @34045 @applicationEdition @applicationIntake @all
  Scenario: Edition of an application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @34303 @addFocusAreaToApplication @applicationIntake @all @notFunctional
  Scenario Outline: Addition of Focus area to an application
    When I navigate to "Budget" sub tab
    Then I see that "<EGMS Id>" has been added in flextable with Id "applicationIntake::focusAreaTableId"
    Examples:
      | EGMS Id |
      | 03677   |

  @addBudgetDetailsToApplication @applicationIntake @all
  Scenario: Addition of budget in the budget grid to an application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "applicationIntake::budgetPeriodTableId" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 1000       | 3000           | 100            |

  @addTargetToKPIInApplication @applicationIntake @all
  Scenario Outline: Addition of KPI target to an application
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0638 | 10     |
    Then I see that "10" has been added in flextable with Id "applicationIntake::kpiTableId"
    Examples:
      | Application Name                          | Flextable Name |
      | Execution Announcement(Dr) for Automation | Budget Details |

  @formFillingApplication @applicationIntake @all
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

  @uploadAttachmentForChecklistInApplication @applicationIntake @all
  Scenario: Attaching a document for attachment checklist in an application
    When I navigate to "Attachments" sub tab
    And I click on "Attach" icon for "Not Applicable" inside flex table with id "applicationIntake::attachmentsTableId"
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Application"
    And I close Modal

  @34156 @submitApplication @applicationIntakeHappyPath @applicationIntake @all
  Scenario: Submitting an application to Grantor
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "applicationIntake::budgetPeriodTableId" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 1000       | 3000           | 1000           |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0638 | 10     |
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

  @34346 @viewSubmitedApplication @applicationIntake @all
  Scenario Outline: Viewing the application submitted by subrecipient as Internal user
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "applicationIntake::budgetPeriodTableId" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 1000       | 3000           | 1000           |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0638 | 10     |
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
    When I click toggle button to select "Submitted Applications"
    And I perform quick search for "<Application Name>" in "ApplicantGrantorApplications" panel
    When I click on "View" icon for "<Application Name>" inside table
    Examples:
      | User | Application Name                          |
      | EXE  | Execution Announcement(Dr) for Automation |