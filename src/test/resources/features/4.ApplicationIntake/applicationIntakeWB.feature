@applicationIntakeWB @regression @app
Feature: Application Intake scenarios without background

  @65078 @69366 @VerifyCreateApplicationButton @keerti
  Scenario: Verify whether SPI user is able to qualify opportunity | Verify Create Application button is displayed to SR User when User click on Qualify Button.
    Given I delete the record "Automation Announcement for Application Review" from the object "APPLICATION REVIEWS"
    And I delete the record "Automation Announcement for Application Review" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Review" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Review" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "Automation Announcement for Application Review" is in "Qualified" status
    Then I softly can see top right button "Create Application" in page detail
    Then I collect all the soft asserts

  @70255 @70256 @70257 @spaUserCannotQualifyTheApplication
  Scenario: Validate as another SPI / SPA user should not be able to Qualify for the second time| Validate SPA user view the Create Application button in page details
  Validate SPA user can View the Qualified Application under 'Qualified' and not under 'Not Yet Qualified'
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Review" in "---applicationReview:-:reviewsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Review" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Review" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    Then I softly cannot see top right button "Qualify" in page detail
    Then I softly can see top right button "Create Application" in page detail
    Then I collect all the soft asserts

  @70258 @spaUsersCannotSubmitAnApplication
  Scenario: Validate the SPA users should not be able to Submit the Application
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Review" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Review" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPA" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name           | Project Role             | Is Key Contact |
      | Automation SPI | Project Director/Manager | Checked        |
    Then I cannot see top right button "Submit Application" in page detail
