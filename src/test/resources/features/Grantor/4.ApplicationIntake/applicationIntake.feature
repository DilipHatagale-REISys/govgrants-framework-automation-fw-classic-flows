@applicationIntake @grantor-regression @grantor-parallel-regression @app @regression @ApplicationExecution-reg @ApplicationClassic
Feature: Validate all scenarios in the Application Intake

  Background: Qualify Announcement and Create Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details

  @34044 @70332 @applicationCreation
  Scenario: Validate creation of an Application | Validate once application is in created status, the user can view the Submit Application Button in page details
    Then I softly see status in Progress-bar is "Created" and is "green"
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
    Then I see that "<Focus Area>" has been added in flextable with Id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Examples:
      | Focus Area                      |
      | Automation Permanent Focus Area |

  @50964 @addBudgetDetailsToApplication
  Scenario: Addition of budget in the budget grid to an application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 100    | 100        | 100            | 100            |
    And I expand nested table containing column value "BP01"
    Then I see value "$100.00" for title "Budget" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I see value "$100.00" for title "Cash Match" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I see value "$100.00" for title "Non-Cash Match" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"
    Then I see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---applicationIntake:-:budgetPeriodTableId---"

    #Then I see the following messages in the page details contains:
     # | Saved Successfully! |

  @50967 @addTargetToKPIInApplication
  Scenario: Addition of KPI target to an application
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |

  @70333 @69367 @50969 @formFillingApplication @smoke
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
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - All mandatory forms must be 100% completed. |
    When I navigate to "Forms and Files" sub tab
    Then I see only the following headers in table with id "---applicationReview:-:allFormsTableId---" :
      | Form Name |Report Type |Mandatory | Percentage | Last Modified By | Last Modified Date |  Actions |
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
   Then I softly see value "100.00%" for title "Percentage" against the value "Program Application Form" inside table "---applicationIntake:-:allFormsTableId---"
   Then I softly see value "100.00%" for title "Percentage" against the value "Standard Assurances Form" inside table "---applicationIntake:-:allFormsTableId---"

  @34346 @73602 @34334 @70459 @viewSubmitedApplication @smoke @deepika
  Scenario Outline: Validate Viewing the application submitted by sub-recipient as Internal user | Validate whether user can view the edit button once application has been submitted to Grantor
  Verify whether PM, FO,EXE internal user is able to view Submitted Application | Verify when SPI (Record owner of Application) submit the Application to Grantor then it is displayed in the list of Submitted Applications
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Submitted"
    When I perform quick search for "<Application Name>" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see "<Application Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I click on "View" icon for "<Application Name>" inside table
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | Application Name                                         | User |
#      | {SavedValue:Automation Runtime Announcement Application} | PM   |
#      | {SavedValue:Automation Runtime Announcement Application} | FO   |
      | {SavedValue:Automation Runtime Announcement Application} | EXE  |

  @70458 @73514 @73515 @70456 @acknowledgeReqiredToSave @deepika
  Scenario: Validate the system should throw an validation message if the application is submitted with Acknowledging it
  Validate whether user has ability to add and remove new focus area while creating an application |Validate whether system should throws a validation message on screen when user tries to remove the existing focus area while submitting an application
  Validate whether user is able to add more focus area to the table while submitting an application
    Given I click on "Edit" in the page details
    And I enter "EditionAcknowledge" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
   And I click on "Remove Focus Area" icon for "Automation Permanent Focus Area" inside flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
      #73514
    Then I softly see the following messages in the page details :
      | Can not remove focus area as funding opportunity associates only one focus area. |
    When I click on top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #When I perform quick search for "Automation Permanent Focus Area" in "---applicationIntake:-:AddFocusAreaTableAppId---" panel
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:AddFocusAreaTableAppId---"
    And I close modal by clicking the top right x button
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    When I click on "Submit Application" in the page details
    Then I see the following messages in the page details :
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application. |

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
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I see the following messages in the page details contains:
      | Proposal Tab - Provide Target Values for all Key Performance Indicators. |

  @70528 @70470 @validateVariousRolesAppearApplication @deepika
  Scenario: To Validate that various roles appear in the project roles dropdown in contact table on application of  SPI profile |Validate the Created Date of Application display on Overview Tab
  Validate whether Application Title field is editable after creating the Application
    When I navigate to "Overview" sub tab
    Then I softly see field "Created Date" is not editable
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly verify that All the following projects roles are available in picklist :
      | Principal Investigator   |
      | Fiscal Contact           |
      | Grants Administrator     |
      | Ebiz POC                 |
      | Other                    |
      | Project Director/Manager |
      | Authorized Signatory     |

  @70527 @applicationAttachmentAndNotes @deepika  @buglogged169487
  Scenario: Validate whether user can add attachment checklist and Notes on the Application
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment "Attachment.pdf" of type "General Assurances" from computer
    Then I softly see "General Assurances" has been added in "Supporting Documents Checklist" flex table
    When I enter the following values into flex table with id "---applicationIntake:-:ApplicationNotesTableId---" by clicking "Add" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---applicationIntake:-:ApplicationNotesTableId---"

  @73521 @70526 @snapshotAfterApplicationIsSubmitted @deepika @skipOnJenkins
  Scenario Outline: Validate SR user is able to view the Snapshot after Application is Submitted to Grantor status| Validate once the Application is submitted to Grantor then the field Submitted by on Overview Tab will get updated by the User Name.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Submitted By" as "{SavedValue:SPI3 Username}"
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>"
    When I click on "View" icon for "<Application Name>" inside table
    And I click on Menu icon present on top right corner of the page
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Snapshot_Application_Submission.pdf"
    When I download the file
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file
    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @70525 @userCanAssociateNewContact @deepika
  Scenario:Validate whether user is able to associate new contacts while creating an application
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I click "Add" after selection of "Automation SPA" by showing entries "All" in flex table with id "---applicationIntake:-:associateNewContactsTableId---"
    And I refresh the page
    #When I perform quick search for "Automation SPA" in "---applicationReview:-:flexGridAppContactTableId---" panel
    Then I softly see value "Automation SPA" for title "Name" inside table "---applicationReview:-:flexGridAppContactTableId---"

  @73944 @73945 @71409 @73947 @73950 @73948 @73949 @maxAppValidationError @deepika
  Scenario: Validate whether User  will be able to view the following error message "Reached the Maximum number of Applications" when the limit has been reached.
  To verify Converted Opportunities should reflect under Opportunities "Converted to Application - Open" list view to External user
  | To verify ,search functionality for Opportunities Converted to Application - All section in opportunities tab
  | To verify ,view functionality for Opportunities Converted to Application - All section in opportunities tab
  | To verify, filter functionality for Opportunities converted to application:All table for Opportunity
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
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
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
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application}" for title "Title" inside table "---applicationIntake:-:convertedToApplicationTableID---"
    And I click toggle button to select "Opportunities Converted to Application - Open"
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application}" for title "Title" inside table "---applicationIntake:-:convertedToApplicationTableID---"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    When I click on "Create Application" in the page details
    #needtocheck 71409
#    Then I softly see the following messages in the page details contains:
#      | Application cannot be created as you have reached the maximum limit for allowed applications for {SavedValue:APPId} |
    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application}" for title "Title" inside table "---applicationIntake:-:convertedToApplicationTableID---"
    And I save the value from row "1" for column name "Funding Opportunity Id" as "oppId" from flex table "---applicationIntake:-:convertedToApplicationTableID---"
    And I click on advance filter "#advfcae" of table id "---applicationIntake:-:convertedToApplicationTableID---"
    And I enter advance filter values inside id "advfcae"
      | Funding Opportunity Id | Contains | Auto Demo |
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I refresh the page
    And I click on advance filter "#advfcae" of table id "---applicationIntake:-:convertedToApplicationTableID---"
    And I enter advance filter values inside id "advfcae"
      | Funding Opportunity Id | Contains | {SavedValue:oppId} |
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application}" for title "Title" inside table "---applicationIntake:-:convertedToApplicationTableID---"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    Then I softly see field "Opportunity Name" as "{SavedValue:Automation Runtime Announcement Application}"