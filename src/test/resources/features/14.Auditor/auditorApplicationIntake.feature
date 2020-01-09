@auditorApplication  @auditorNegotiations @auditor
Feature: Validate all scenarios for Auditor Profile in Application Module

  @Auditorapplication @wip
  Scenario: Auditor should have view / read  only access to record.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Auditor" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Auditor" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly cannot see top right button "Qualify" in page detail
    Then I softly cannot see top right button "Create Application" in page detail
    Then I collect all the soft asserts

  @auditorCannotCreateNegotiation
  Scenario: Validate Auditor should not be  able to  Create Negotiation
    Given I login to "As a Grantor" app as "Auditor" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Initiate Negotiation" against Value "Automation Announcement for FDM" inside "---subAwardFromFDM:-:recommendedAppTableId---" flex table

  @auditorCannotSend/CompleteNegotiations
  Scenario: Validate Auditor should not be  able to Complete Negotiation
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    Then I see "No Records Found" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"

  @auditorCannotCreateSubawardFromApprovedFDM
  Scenario: Validate Auditor should not be  able to  Create Subaward From Approved FDM
    Given I login to "As a Grantor" app as "Auditor" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Create Subaward" against Value "Automation Announcement for FDM" inside "---subAwardFromFDM:-:recommendedAppTableId---" flex table

  @auditorApplication
  Scenario: Validate Auditor should be  able to View submitted application details
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
    When I click on "Edit" in the page details
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
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I click on "View" icon for "<Application Name>" inside table
    Then I see status in Progress-bar is "Submitted" and is "Green"



