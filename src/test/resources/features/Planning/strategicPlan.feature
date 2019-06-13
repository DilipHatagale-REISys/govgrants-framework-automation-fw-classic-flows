@strategicPlan @regression
Feature: Validate all scenarios in Strategic Plan

  Background: To setup data
    Given I delete the record "Automation Execution Strategic Plan" from the object "Strategic Plan"
    Given I create a planning record as user "EXE" from sheet "StrategicPlanCreation" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2            | Step 3                |
      | Navigation | As a Grantor    | Planning          | Planning              |
      | FlexTable  | Strategic Plans | StrategicPlans    | Draft Strategic Plans |
      | Creation   | New             | Save and Continue | Save                  |
      | ID         | EGMS ID         |                   |                       |

  @50954 @creationOfStrategicPlan @smoke
  Scenario: Creation of Strategic Plan
    Then I see that "Status" is in "Draft" status

  @51042 @editionOfStrategicPlan
  Scenario: Edition of Strategic Plan
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "Status" is in "Draft" status

  @51044 @addAttachmentToStrategicPlan 
  Scenario: Addition of Attachment to Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "---strategicplan:-:attachments_Table_Id---"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "---strategicplan:-:attachments_Table_Id---"

  @33798 @creationOfStrategicGoal @smoke
  Scenario: Creation of Strategic Goal inside a Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    And I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Back To Strategic Plan" in the page details
    Then I see that "Automation Execution Strategic Goal" has been added in flextable with Id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"

  @51045 @editionOfStrategicGoal
  Scenario: Edition of Strategic Goal inside a Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "StrategicGoalEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details

  @51046 @addAttachmentToStrategicGoal 
  Scenario: Addition of Attachment to Strategic Goal inside a Strategic Plan
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "---strategicplan:-:strategic-Goal_Attachment_TableId---"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "---strategicplan:-:strategic-Goal_Attachment_TableId---"

  @51047 @creationOfObjective @smoke
  Scenario: Creation of Objective inside a Strategic Goal
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Related_Objectives_Table_Id---"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details

  @51048 @editionOfObjective
  Scenario: Edition of Objective inside a Strategic Goal
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Related_Objectives_Table_Id---"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "ObjectiveEdition" values from "StrategicPlan_Field_Values.xlsx"
    When I click on "Save" in the page details

  @51049 @additionOfAttachmentToObjective 
  Scenario: Addition of Attachment to Objective inside a Strategic Goal
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Related_Objectives_Table_Id---"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "---strategicplan:-:strategic_Objectives_Attachments_Table_Id---"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "---strategicplan:-:strategic_Objectives_Attachments_Table_Id---"

  @34720 @associatingKPIToObjective @smoke
  Scenario: Associating KPI to Objective inside a Strategic Goal
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Related_Objectives_Table_Id---"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I associate "1" records "Automation Permanent KPI for Regression"
      | Actions     | Step 1       | Step 2    | Step 3                | Step 4    | Step 5     |
      | Associate 1 | Related Logs | Associate | KPIGoalsandObjectives | Associate | SelectKPIs |
    Then I see that "Automation Permanent KPI for Regression" has been added in flextable with Id "---strategicplan:-:Objectives_KPI_Table_Id---"

    #marking as notFunctional as we can not activate multiple strategic plan for one organization
  @34721 @strategicPlanHappyPath @smoke @notFunctional
  Scenario: strategic plan Happy Path
    And I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a1511000002nIxtAAE |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    Given I enter "StrategicGoalCreation" values from "StrategicPlaflexGridGrantorStrategicGoalObjectivesn_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Given I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a1511000002nIxtAAE |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    When I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Related_Objectives_Table_Id---"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I complete the fields from the sheet "ObjectiveEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a1511000002nIxtAAE |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    Given I associate "1" records "Automation Permanent KPI for Regression"
      | Actions     | Step 1       | Step 2    | Step 3                | Step 4    | Step 5     |
      | Associate 1 | Related Logs | Associate | KPIGoalsandObjectives | Associate | SelectKPIs |
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"