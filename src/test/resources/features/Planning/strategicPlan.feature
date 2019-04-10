@strategicPlan @regression
Feature: Validate all scenarios in Strategic Plan

  Background: To setup data
   # Given I delete the record "Permanent Strategic Plan for Automation" from the object "Strategic Plan"
  # # Given I delete the record "Permanent Strategic Goal Automation" from the object "Strategic Plan"
  # Given I delete the record "Permanent Objective Automation" from the object "Strategic Plan"
    Given I create a planning record as user "EXE" from sheet "StrategicPlanCreation" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2            | Step 3                |
      | Navigation | As a Grantor    | Planning          | Planning              |
      | FlexTable  | Strategic Plans | StrategicPlans    | Draft Strategic Plans |
      | Creation   | New             | Save and Continue | Save                  |
      | ID         | EGMS ID         |                   |                       |

  @creationOfStrategicPlan @strategicPlan @all @smoke
  Scenario: Creation of Strategic Plan
    Then I see that "Status" is in "Draft" status

  @editionOfStrategicPlan @strategicPlan @all
  Scenario: Edition of Strategic Plan
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "Status" is in "Draft" status

  @addAttachmentToStrategicPlan @strategicPlan @all
  Scenario: Addition of Attachment to Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "strategicPlan::attachmentsTableId"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "strategicPlan::attachmentsTableId"

  @creationOfStrategicGoal @strategicPlan @all @smoke
  Scenario: Creation of Strategic Goal inside a Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    And I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    
  @editionOfStrategicGoal @strategicPlan @all
  Scenario: Edition of Strategic Goal inside a Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "StrategicGoalEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details

  @addAttachmentToStrategicGoal @strategicPlan @all
  Scenario: Addition of Attachment to Strategic Goal inside a Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "strategicPlan::strategicGoalAttachmentTableId"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "strategicPlan::strategicGoalAttachmentTableId"

  @creationOfObjective @strategicPlan @all @smoke
  Scenario: Creation of Objective inside a Strategic Goal
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalTableId"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on top right button "New" in flex table with id "strategicPlan::strategicGoalRelatedObjectivesTableId"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details

  @editionOfObjective @strategicPlan @all
  Scenario: Edition of Objective inside a Strategic Goal
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on top right button "New" in flex table with id "strategicPlan::strategicGoalRelatedObjectivesTableId"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ObjectiveEdition" values from "StrategicPlan_Field_Values.xlsx"
    When I click on "Save" in the page details

  @additionOfAttachmentToObjective @strategicPlan @all
  Scenario: Addition of Attachment to Objective inside a Strategic Goal
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save and Continue" in the page details
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "strategicPlan::strategicGoalRelatedObjectivesTableId"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "strategicPlan::strategicObjectivesAttachmentsTableId"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "strategicPlan::strategicObjectivesAttachmentsTableId"

  @associatingKPIToObjective @strategicPlan @all @smoke
  Scenario: Associating KPI to Objective inside a Strategic Goal
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "strategicPlan::strategicGoalRelatedObjectivesTableId"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I navigate to "Related Logs" sub tab
    And I click on top right button "Associate" in flex table with id "strategicPlan::ObjectivesKPITableId"
    And I switch to Parent frame
    Then I see that "Automation KPI" has been added in flextable with Id "strategicPlan::ObjectivesKPITableId"

  @strategicPlanHappyPath @strategicPlan @all @smoke
  Scenario: strategic plan Happy Path
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a150b000003ep3EAAQ |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    Given I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Given I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a150b000003epW2AAI |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    When I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "strategicPlan::strategicGoalRelatedObjectivesTableId"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I complete the fields from the sheet "ObjectiveEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a150b000003epU7AAI |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    Given I associate "1" records "KPI for Automation Testing"
      | Actions     | Step 1       | Step 2    | Step 3                | Step 4    | Step 5     |
      | Associate 1 | Related Logs | Associate | KPIGoalsandObjectives | Associate | SelectKPIs |
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"