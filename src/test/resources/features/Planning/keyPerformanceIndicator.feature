@kpi
Feature: Validate all scenarios in Key Performance Indicator(KPI)

  Background: To setup data
    Given I delete the record "Execution KPI for Automation" from the object "KPI"
    And I create a planning record as user "EXE" from sheet "Creation" in excel "KPI_Field_Values.xlsx"
      | Actions    | Step 1                           | Step 2            | Step 3                                 |
      | Navigation | As a Grantor                     | Planning          | Planning                               |
      | FlexTable  | Key Performance Indicators (KPI) | GrantorMasterKPIs | Draft Key Performance Indicators (KPI) |
      | Creation   | New                              | Save and Continue | Save                                   |
      | ID         | EGMS ID                          |                   |                                        |

  @creationOfKPI @kpi @all
  Scenario: Creation of KPI
    Then I see status in Progress-bar is "Created" and is "green"

  @editionOfKPI @kpi @all
  Scenario: Edition of KPI
    And I click on "Edit" in the page details
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @addAttachmentToKPI @kpi @all
  Scenario: Addition of Attachment to KPI
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "keyPerformanceIndicator::kpiAttachmentTableId"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Supporting Documents"
    And I close Modal
    Then I see that "Supporting Documents" has been added in flextable with Id "keyPerformanceIndicator::kpiAttachmentTableId"

  @activateKPI @kpi @all
  Scenario: Activate KPI
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @kpiHappyPath @kpi @all
  Scenario: Happy Path of KPI
    Given I complete the fields from the sheet "Edition" in excel "KPI_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000001rv7YAAQ |
      | Attachment Details    | Attachment  | Supporting Documents |                    |
    Given I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"