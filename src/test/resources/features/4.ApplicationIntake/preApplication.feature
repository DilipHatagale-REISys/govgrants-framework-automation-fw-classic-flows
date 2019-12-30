@preApplication @regression @app
Feature: Validate all scenarios in the Pre-Application

  Background: Qualify Announcement and Create PreApplication
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"

  @53151 @preApplicationCreation @smoke
  Scenario: Creating a Pre Application
    Then I see status in Progress-bar is "Created" and is "Green"

  @67063 @validateVariousRolesAppearsPreApplication @jitendra
  Scenario: To Validate that various roles appear in the project roles dropdown in contact tableon preapplication of  SPI profile
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    Then I verify that All the following projects roles are available in picklist :
      | Principal Investigator   |
      | Fiscal Contact           |
      | Grants Administrator     |
      | Ebiz POC                 |
      | Other                    |
      | Project Director/Manager |
      | Authorized Signatory     |

  @67077 @67065 @contactsAtPreApplicationFromSameOrganisation @jitendra
  Scenario: To verify that the contacts appearing in the Associate button in Contact table of preapplication is of the Same organisation
    When I navigate to "Overview" sub tab
    And I click table top right button "Associate" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I perform quick search for "Automation SPA" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation SPA" in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I close modal by clicking the top right x button
    Then I softly see value "Automation SPA" for title "Name" inside table "---preApplication:-:flexGridPreAppContactTableId---"
    When I click on "View" icon for "Automation SPI" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I save the field labeled "Organization" as "orgName1"
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "Record Id" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "Automation SPA" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I save the field labeled "Organization" as "orgName2"
    Then I softly see that the saved value "SavedValue:orgName1" and "SavedValue:orgName2" are equal
    And I collect all the soft asserts

  @53153 @preApplicationEdition
  Scenario: Validate edition of pre-application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @53154 @addBudgetDetailsToPreApplication @smoke
  Scenario: Addition of budget in the budget grid to an pre-application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 1000       | 5000           | 100            |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |

  @53155 @PreApplicationAttachmentChecklistCA
  Scenario: Validate the attachment checklist of the PreApplication
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    Then I see "Active" has been added in "Attachments" flex table

  @53159 @PreApplicationAttachmentCA
  Scenario: Validate the attachment of the PreApplication
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    Then I see "Other" has been added in "Attachments" flex table

  @53160 @submitPreApplication @smoke
  Scenario: Submitting an pre application to Grantor
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted" and is "green"

  @53162 @preApplicationToApplication
  Scenario Outline: Validate Grantor accept the submitted pre-application and converted it to application
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I get the "EGMS ID"
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name           | Project Role             | Is Key Contact |
      | Automation SPI | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I see status in Progress-bar is "Submitted" and is "Green"
    Examples:
      | Announcement Name                       |
      | Automation Announcement for Application |