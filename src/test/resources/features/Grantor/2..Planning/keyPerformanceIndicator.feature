@kpi @regression @planning
Feature: Validate all scenarios in Key Performance Indicator(KPI)

  Background: To setup data
    Given I delete the record "Automation Execution KPI" from the object "KPI"

  @34735 @creationOfKPI
  Scenario Outline: Creation of KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @51028 @editionOfKPI
  Scenario Outline: Edition of KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @51026 @addAttachmentToKPI
  Scenario Outline: Addition of Attachment to KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents"
    Then I see "Supporting Documents" has been added in "Attachments" flex table
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @34736 @kpiHappyPath @smoke
  Scenario Outline: Happy Path of KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @kpiCreationPM
  Scenario: Negative Case - Verify that other users (Other than Admin/EXE) are not able to create KPI
    Given I am on "INTERNAL" portal
    Given I login as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"

  @52625 @userFOEditKPI
  Scenario: Negative Case-Verfiy that PM user cannot Edit the record
    Given I am on "INTERNAL" portal
    Given I login as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft" in "---keyperformanceindicator:-:kpiTableId---"
    When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpiTableId---" panel
    Then I cannot see row level action button "Edit" against "Automation Execution KPI" in flex table with id "---keyperformanceindicator:-:kpiTableId---"

  @52622 @userFODeelteKPI
  Scenario: Negative Case-Verfiy that PM user cannot Delete the record
    Given I am on "INTERNAL" portal
    Given I login as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft" in "---keyperformanceindicator:-:kpiTableId---"
    When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpiTableId---" panel
    Then I cannot see row level action button "Delete" against "Automation Execution KPI" in flex table with id "---keyperformanceindicator:-:kpiTableId---"

  @52623 @deactivateKPI
  Scenario Outline: Negative Case-Verfiy that EXE can deactivate the record
    Given I am on "INTERNAL" portal
    Given I login as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Inactive" and is "Green"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @52536 @deactivateKPIFOUser
  Scenario Outline:  Negative Case- Verfiy that other users (other than Admin, EXE) can not deactivate KPI
    Given I am on "INTERNAL" portal
    Given I login as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) -Active"
    When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "Automation Execution KPI" inside table
    Then I cannot see top right button "Deactivate" in page detail
    Examples:
      | User |
      | EXE  |

  @52535 @closedKPIListView
  Scenario: Verfiy that user can see Closed KPI under Inactive KPI list view.
    Given I am on "INTERNAL" portal
    Given I login as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Inactive"
    When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "Automation Execution KPI" inside table
    Then I see status in Progress-bar is "Inactive" and is "Green"

  @72340 @activateKPI @productBusinessFlowSanity
  Scenario: Validate the activation of KPI and the status changes to Active
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"