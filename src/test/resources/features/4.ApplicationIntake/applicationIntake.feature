@applicationIntake @regression @app
Feature: Validate all scenarios in the Application Intake

  Background: Qualify Announcement and Create Application
    Given I delete the record "Automation Announcement for Application Intake" from the object "Application"
    And I delete the record "Automation Announcement for Application Intake" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Intake" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Intake" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details

  @34044 @70332 @applicationCreation
  Scenario: Validate creation of an Application |Validate once application is in created status, the user can view the Submit Application Button in page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Then I softly can see top right button "Submit Application" in page detail

  @34045 @applicationEdition
  Scenario: Edition of an application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @34303 @addFocusAreaToApplication
  Scenario Outline: Addition of Focus area to an application
    When I navigate to "Budget" sub tab
    Then I see that "<EGMS Id>" has been added in flextable with Id "---applicationIntake:-:focusAreaTableId---"
    Examples:
      | EGMS Id                         |
      | Automation Permanent Focus Area |

  @50964 @addBudgetDetailsToApplication
  Scenario: Addition of budget in the budget grid to an application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |

  @50967 @addTargetToKPIInApplication
  Scenario: Addition of KPI target to an application
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |

  @69367 @50969 @70333 @formFillingApplication @smoke
  Scenario: To fill and complete the form in Application | Validate whether user is allowed to proceed without filling Mandatory forms
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Attachments Tab - All mandatory forms must be 100% completed. |
    When I navigate to "Attachments" sub tab
    Then I see only the following headers in table with id "FormEnhancedTable" :
      | Form Name | Mandatory | Percentage | Last Modified By | Last Modified Date | Actions |
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I softly see that "100%" has been added in flextable with Id "---applicationIntake:-:allFormsTableId---"

  @34346 @70459 @viewSubmitedApplication @smoke @deepika
  Scenario Outline: Viewing the application submitted by sub-recipient as Internal user | Validate whether user can view the edit button once application has been submitted to Grantor
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I click on "View" icon for "<Application Name>" inside table
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | Application Name                               |
      | Automation Announcement for Application Intake |

  @70458 @70456 @acknowledgeReqiredToSave @deepika
  Scenario: Validate the system should throw an validation message if the application is submitted with Acknowledging it
  Validate whether user has ability to add and remove new focus area while creating an application
    Given I click on "Edit" in the page details
    And I enter "EditionAcknowledge" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableId---"
    Then I softly can see top right button "Remove Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableId---"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I click on "Submit Application" in the page details
    Then I see the following messages in the page details :
      | Overview Tab - Enter an Acknowledgement before submitting this Application. |

  @70455 @kpiValuesAreMandatoryToSubmitApplication @deepika
  Scenario:  To verify that if KPI value is unfilled while creating and application and upon clicking on the Submit Application on the top right corner of the page validation error must be thrown.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I see the following messages in the page details contains:
      | Proposal Tab - Provide target values for all Key Performance Indicators. |

  @70470 @70528 @validateVariousRolesAppearApplication @deepika
  Scenario: To Validate that various roles appear in the project roles dropdown in contact table on application of  SPI profile |Validate the Created Date of Application display on Overview Tab
  Validate whether Application Title field is editable after creating the Application
    When I navigate to "Overview" sub tab
    Then I softly see field "Created Date" is not editable
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly verify that All the following projects roles are available in picklist :
      | Principal Investigator   |
      | Fiscal Contact           |
      | Grants Administrator     |
      | Ebiz POC                 |
      | Other                    |
      | Project Director/Manager |
      | Authorized Signatory     |

  @70527 @applicationAttachmentAndNotes @wip @deepika
  Scenario: Validate whether user can add attachment checklist and Notes on the Application
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "General Assurances"
    Then I softly see "Active" has been added in "Attachments" flex table
    And I add notes records
    When I enter notes with title "Automation Title" and description "Automation Description"
    Then I softly see value "Notes Record" for title "Title" inside table "toggleNotes"

  @70526 @snapshotAfterApplicationIsSubmitted @deepika
  Scenario Outline: Validate SR user is able to view the Snapshot after Application is Submitted to Grantor status
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I click on "View" icon for "<Application Name>" inside table
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Snapshot_Application_Submission.pdf"
    When I download the file
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file
    Examples:
      | Application Name                               |
      | Automation Announcement for Application Intake |

  @70525 @userCanAssociateNewContact @deepika
  Scenario:Validate whether user is able to associate new contacts while creating an application
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---applicationRe  view:-:flexGridAppContactTableId---"
    When I perform quick search for "Automation SPA" in "---applicationIntake:-:associateNewContactsTableId---" panel
    When I click "Add" after selection of "Automation SPA" in the table "---applicationIntake:-:associateNewContactsTableId---"
    Then I see "Automation SPA" has been added in "---applicationReview:-:flexGridAppContactTableId---" flex table

  @71409 @maxAppValidationError @deepika
  Scenario: Validate whether User  will be able to view the following error message "Reached the Maximum number of Applications" when the limit has been reached.
    Given I save the field containing "EGMS ID" as "APPId"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I click on "Submit Application" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I perform quick search for "Automation Announcement for Application Intake" in "cae" panel
    And I click on "View" icon for "Automation Announcement for Application Intake" inside flex table with id "cae"
    When I click on "Create Application" in the page details
    Then I see the following messages in the page details :
      | Application is already created for this Announcement |
