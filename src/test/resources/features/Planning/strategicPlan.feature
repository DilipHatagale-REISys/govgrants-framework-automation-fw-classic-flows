@strategicPlan @regression
Feature: Validate all scenarios in Strategic Plan

  Background: To setup data
    Given I delete the record "Automation Execution Strategic Plan" from the object "Strategic Plan"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Planning" subheader on left panel
    And I click toggle button to select "Draft Strategic Plans"
    And I click on top right button "New" in flex table with id "StrategicPlans"
    And I enter "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details

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
    When I click on "Edit" in the page details
    And I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Strategic Plan"
    Then I see "Strategic Plan" has been added in "Attachments" flex table

  @33798 @creationOfStrategicGoal @smoke
  Scenario: Creation of Strategic Goal inside a Strategic Plan
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    And I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Back To Strategic Plan" in the page details
    Then I see that "Automation Execution Strategic Goal" has been added in flextable with Id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"

  @51045 @editionOfStrategicGoal
  Scenario: Edition of Strategic Goal inside a Strategic Plan
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "StrategicGoalEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details

  @51046 @addAttachmentToStrategicGoal
  Scenario: Addition of Attachment to Strategic Goal inside a Strategic Plan
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "StrategicGoalEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Strategic Plan"
    Then I see "Strategic Plan" has been added in "Attachments" flex table

  @51047 @creationOfObjective @smoke
  Scenario: Creation of Objective inside a Strategic Goal
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "StrategicGoalEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Related_Objectives_Table_Id---"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details

  @51048 @editionOfObjective
  Scenario: Edition of Objective inside a Strategic Goal
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    When I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "StrategicGoalEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
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
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Strategic Plan"
    Then I see "Strategic Plan" has been added in "Attachments" flex table

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
    When I navigate to "Related Logs" sub tab
    And I click on top right button "Associate" in flex table with id "---strategicplan:-:Objectives_KPI_Table_Id---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---strategicplan:-:List_Of_Active_KPI_Table_Id---" panel
    When I click "Associate" after selection of "Automation Permanent KPI for Regression" in the table "---strategicplan:-:List_Of_Active_KPI_Table_Id---"
    Then I see that "Automation Permanent KPI for Regression" has been added in flextable with Id "---strategicplan:-:Objectives_KPI_Table_Id---"

    #marking as notFunctional as we can not activate multiple strategic plan for one organization
  @34721 @strategicPlanHappyPath @smoke @notFunctional
  Scenario: strategic plan Happy Path
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a1511000002nIxtAAE |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Objectives_Table_Id---"
    And I enter "StrategicGoalCreation" values from "StrategicPlaflexGridGrantorStrategicGoalObjectivesn_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a1511000002nIxtAAE |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategic_Goal_Related_Objectives_Table_Id---"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I complete the fields from the sheet "ObjectiveEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a1511000002nIxtAAE |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    And I associate "1" records "Automation Permanent KPI for Regression"
      | Actions     | Step 1       | Step 2    | Step 3                | Step 4    | Step 5     |
      | Associate 1 | Related Logs | Associate | KPIGoalsandObjectives | Associate | SelectKPIs |
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"