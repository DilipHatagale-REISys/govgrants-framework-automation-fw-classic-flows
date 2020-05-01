@strategicPlan @regression @planning
Feature: Validate all scenarios in Strategic Plan

  Background: To setup data
    Given I delete the record "Automation Execution Strategic Plan" from the object "Strategic Plan"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Close"

  @50954 @creationOfStrategicPlan
  Scenario: Creation of Strategic Plan by user - Admin/EXE/PM
    Then I see that "Status" is in "Draft" status

  @50955 @editionOfStrategicPlan
  Scenario: Edition of Strategic Plan by user - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    Then I see that "Status" is in "Draft" status

  @50956 @addAttachmentToStrategicPlan
  Scenario: Addition of Attachment to Strategic Plan by user - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Strategic Plan"
    Then I see "Strategic Plan" has been added in "Attachments" flex table

  @33798 @creationOfStrategicGoal
  Scenario: Creation of Strategic Goal inside a Strategic Plan by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    And I click on "Save" in the page details
    When I click on "Back To Strategic Plan" in the page details
    Then I see that "Automation Execution Strategic Goal" has been added in flextable with Id "---strategicplan:-:strategicGoalObjectivesTableId---"

  @51045 @editionOfStrategicGoal
  Scenario: Edition of Strategic Goal inside a Strategic Plan by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    Then I see field "Strategic Plan Status" as "Draft"

  @51046 @addAttachmentToStrategicGoal
  Scenario: Addition of Attachment to Strategic Goal inside a Strategic Plan by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Strategic Goal"
    And I click on "Save" in the page details
    Then I see "Strategic Goal" has been added in "Attachments" flex table

  @51047 @creationOfObjective
  Scenario: Creation of Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter value "Automation Execution Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Close"
    And I click on "Save" in the page details

  @51048 @editionOfObjective
  Scenario: Edition of Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter value "Automation Execution Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Close"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I enter in modal value "Automation Execution Objective" into field "StrategyDescription__c"
    When I click on "Save" in the page details

  @51049 @additionOfAttachmentToObjective
  Scenario: Addition of Attachment to Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter value "Automation Execution Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Close"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Strategic Objective"
    Then I see "Strategic Objective" has been added in "Attachments" flex table

  @34724 @associatingKPIToObjective @smoke
  Scenario: Associating KPI to Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Automation Execution Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Close"
    And I click on "Save" in the page details
    When I navigate to "Related Logs" sub tab
    And I click on top right button "Associate" in flex table with id "---strategicplan:-:ObjectivesKPITableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---strategicplan:-:ListOfActiveKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI for Regression" in the table "---strategicplan:-:ListOfActiveKPITableId---"
    Then I see that "Automation Permanent KPI for Regression" has been added in flextable with Id "---strategicplan:-:ObjectivesKPITableId---"

    #marking as notFunctional as we can not activate multiple strategic plan for one organization
  @34721 @strategicPlanHappyPath @notFunctional @wip
  Scenario: strategic plan Happy Path
    And I click on "Edit" in the page details
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2         | Step 3             |
      | Attachment Navigation | Attachments | Add            | a1511000002nIxtAAE |
      | Attachment Details    | Attachment  | Strategic Plan |                    |
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
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
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
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
    Then I see status in Progress-bar is "Active" and is "Green"

  @34727 @Validate_StrategicPlanGoals @smoke
  Scenario: Validate the Strategic plan can not be activated without goals by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - Strategic Plan must at least have a goal. |