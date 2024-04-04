@strategicPlan @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios in Strategic Plan

  Background: To setup data
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"

  @50954 @50955 @33798 @50956 @editionOfStrategicPlan
  Scenario: Edition of Strategic Plan by user - Admin/EXE/PM
    Then I softly see that "Status" is in "Draft" status
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    Then I softly see that "Status" is in "Draft" status
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Back To Strategic Plan" in the page details
    Then I softly see that "Execution Strategic Goal" has been added in flextable with Id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---strategicplan:-:strategicGoalObjectivesAttTableId---"
    And I upload attachment "Attachment.pdf" of type "Strategic Plan" from computer
    Then I softly see "Strategic Plan" has been added in "Strategic Plan Files" flex table

  @105447 @verifyDeletionOfStrategicPlan @monu
  Scenario: Validate user is able to delete strategic plan
    And I save the field labeled "EGMS ID" as "egmsid"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I perform quick search for "{SavedValue:egmsid}" in "---strategicplan:-:StrategicPlansTableId---" panel
    And I click on "Delete" icon for "{SavedValue:egmsid}" inside flex table with id "---strategicplan:-:StrategicPlansTableId---" without waiting for record
    Then I softly see "No records found" inside flex table with id "---strategicplan:-:StrategicPlansTableId---"

  @51045 @editionOfStrategicGoal
  Scenario: Edition of Strategic Goal inside a Strategic Plan by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
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
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---strategicplan:-:flexGridGrantorStrategicGoalFiles---"
    And I upload attachment "Attachment.pdf" of type "Strategic Goal" from computer
    And I click on "Save" in the page details
    Then I see "Strategic Goal" has been added in "Strategic Goal Files" flex table

  @51047 @105394 @creationOfObjective
  Scenario: Creation of Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Strategic ID"
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Strategic Goals ID"
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Execution Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see field "Strategic Plan Status" as "Draft"
    #105394 #monu
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    When I perform quick search for "{SavedValue:Strategic ID}" in "---strategicplan:-:StrategicPlansTableId---" panel
    When I click on "View" icon for "{SavedValue:Strategic ID}" inside flex table with id "---strategicplan:-:StrategicPlansTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I click on "View" icon for "{SavedValue:Strategic Goals ID}" inside flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"

  @51048 @editionOfObjective @monu
  Scenario: Edition of Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Execution Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I enter value "Execution Strategic Objective" into field "StrategyDescription__c"
    When I click on "Save" in the page details
    Then I softly see field "Description" as "Execution Strategic Objective"

  @51049 @additionOfAttachmentToObjective
  Scenario: Addition of Attachment to Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Execution Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---strategicplan:-:flexGridGrantorObjectiveFiles---"
    And I upload attachment "Attachment.pdf" of type "Strategic Plan" from computer
    Then I see "Strategic Plan" has been added in "Objective Files" flex table

  @34724 @associatingKPIToObjective @smoke
  Scenario: Associating KPI to Objective inside a Strategic Goal by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Execution Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---strategicplan:-:ObjectivesKPITableId---"
    When I click "Add" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---strategicplan:-:ListOfActiveKPITableId---"
    Then I see that "Automation Permanent KPI" has been added in flextable with Id "---strategicplan:-:ObjectivesKPITableId---"

    #marking as notFunctional as we can not activate multiple strategic plan for one organization
  @34721 @strategicPlanHappyPath @notFunctional @wip
  Scenario: strategic plan Happy Path
    When I enter "StrategicPlanEdition" values from "StrategicPlan_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I add an attachment "Attachment.pdf"
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
    And I associate "1" records "Automation Permanent KPI"
      | Actions     | Step 1       | Step 2    | Step 3                | Step 4    | Step 5     |
      | Associate 1 | Related Logs | Associate | KPIGoalsandObjectives | Associate | SelectKPIs |
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    And I click on "Activate" in the page details
    Then I softly see the following messages in the page details contains:
      | The Agency already has an active Strategic Plan associated with it. Cannot activate more than one Strategic Plan for an Agency |

  @34727 @Validate_StrategicPlanGoals @smoke
  Scenario: Validate the Strategic plan can not be activated without goals by User - Admin/EXE/PM
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see the following messages in the page details contains:
      | Overview Tab - At least one goal should be there for Strategic Plan. |