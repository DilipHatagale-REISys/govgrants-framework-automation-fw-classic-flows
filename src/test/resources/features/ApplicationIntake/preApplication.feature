@preApplication @regression
Feature: Validate all scenarios in the Pre-Application

  Background: Qualify Announcement and Create PreApplication
    Given I delete the record "Automation Announcement for Application" from the object "PreApplication"
    Given I delete the record "Automation Announcement for Pre-Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Active" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "popupflextable" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application " into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"

  @53151 @preApplicationCreation @smoke
  Scenario: Creating a Pre Application
    Then I see status in Progress-bar is "Created" and is "green"

  @53153 @preApplicationEdition
  Scenario: Validate edition of pre-application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @53154 @addBudgetDetailsToPreApplication @smoke
  Scenario: Addition of budget in the budget grid to an pre-application
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "---pre-application:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 1000       | 5000           | 100            |
    Then I see the following messages in the page details contains:
      | Saved Successfully! |

  @53155 @PreApplicationAttachmentChecklistCA 
  Scenario: Validate the attachment checklist of the PreApplication
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Announcement"
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
    And I edit the following rows inline in flex table with id "---pre-application:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000        | 50            | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Attach" icon for "Not Applicable" inside flex table with id "---pre-application:-:recipientCheckListGridId---"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted" and is "green"

  @53161 @preApplicationSubmittedToGrantorPendingTask @preapplicationHappyPath @smoke
  Scenario: Validate Grantor accept the submitted pre-application
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---pre-application:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000        | 50            | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Attach" icon for "Not Applicable" inside flex table with id "---pre-application:-:recipientCheckListGridId---"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I click on "Accept" in the page details
    When I enter "Automation" for comments and click "OK"
    Then I see status in Progress-bar is "Accepted" and is "green"

  @53162 @preApplicationtoApplication 
  Scenario Outline: Validate Grantor accept the submitted pre-application and converted it to application
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---pre-application:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget  | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000    | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Attach" icon for "Not Applicable" inside flex table with id "---pre-application:-:recipientCheckListGridId---"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Announcement"
    When I close Modal
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I click on "Accept" in the page details
    When I enter "Automation" for comments and click "OK"
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Submitted Pre-Applications"
    And I perform quick search for "Automation Announcement for Application" in "RecipientPreApplications" panel
    When I click on "View" icon for "Automation Announcement for Application" inside table
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriod_Table_Id---" by clicking "Edit" :
      | Category Name | Budget  | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000    | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpi_Table_Id---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:all_Forms_Table_Id---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:all_Forms_Table_Id---"
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
      | User | Application Name                            |
      | EXE  | Automation Announcement for Application     |
