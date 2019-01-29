@strategicPlan
Feature: Validate all scenarios in Strategic Plan

	Background: To delete data
	Given I delete the record "Automation Strategic Plan Regression" from the object "Strategic Plan"
	Given I delete the record "Automation Strategic Goal Regression" from the object "Strategic Plan"
	Given I delete the record "Automation Objective Regression" from the object "Strategic Plan"
	Given I create a planning record as user "EXE" from sheet "StrategicPlanCreation" in excel "Planning_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 | Step 3 				    |
	| Navigation | As a Grantor		 | Planning  	 	 | Planning	    			|
	| FlexTable  | Strategic Plans   | StrategicPlans	 | Draft Strategic Plans    |
	| Creation   | New				 | Save And Close    | Save						|
	| ID		 | EGMS ID			 |					 |							|

	@creationOfStrategicPlan @strategicPlan 
	Scenario: Creation of Strategic Plan
	Then I see status in Progress-bar is "Created" and is "green"
	
	@editionOfStrategicPlan @strategicPlan 
	Scenario: Edition of Strategic Plan
	And I click on "Edit" in the page details
	When I enter "StrategicPlanEdition" values from "Planning_Field_Values.xlsx"
	And I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
	@addAttachmentToStrategicPlan @strategicPlan 
	Scenario: Addition of Attachment to Strategic Plan
	And I complete the fields from the sheet "StrategicPlanEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003ep3EAAQ"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "a150b000003ep3EAAQ"
	
	@creationOfStrategicGoal @strategicPlan 
	Scenario: Creation of Strategic Goal inside a Strategic Plan
	And I complete the fields from the sheet "StrategicPlanEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	When I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	And I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	When I click on "Save and Continue" in the page details
	And I click on "Save" in the page details
	Then I see that "Strategic Goal" is in "Draft" status
	
	@editionOfStrategicGoal @strategicPlan 
	Scenario: Edition of Strategic Goal inside a Strategic Plan
	And I complete the fields from the sheet "StrategicPlanEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	When I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	And I click on "Save and Continue" in the page details
	When I click on "Save" in the page details
	And I click on "Edit" in the page details
	When I enter "StrategicGoalEdition" values from "Planning_Field_Values.xlsx"
	And I click on "Save" in the page details
	Then I see that "Strategic Goal" is in "Draft" status
	
	@addAttachmentToStrategicGoal @strategicPlan 
	Scenario: Addition of Attachment to Strategic Goal inside a Strategic Plan
	And I complete the fields from the sheet "StrategicPlanEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	When I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	And I click on "Save and Continue" in the page details
	When I click on "Save" in the page details
	And I complete the fields from the sheet "StrategicGoalEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epW2AAI"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "a150b000003epW2AAI"
	
	@creationOfObjective @strategicPlan 
	Scenario: Creation of Objective inside a Strategic Goal
	And I complete the fields from the sheet "StrategicPlanEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	When I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	And I click on "Save and Continue" in the page details
	When I click on "Save" in the page details
	And I complete the fields from the sheet "StrategicGoalEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	When I click on top right button "New" in flex table with id "RelatedObjectives"
	And I enter "ObjectiveCreation" values from "Planning_Field_Values.xlsx"
	When I click on "Save and Continue" in the page details
	And I click on "Save" in the page details
	
	@editionOfObjective @strategicPlan 
	Scenario: Edition of Objective inside a Strategic Goal
	And I complete the fields from the sheet "StrategicPlanEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	And I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	When I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	And I click on "Save and Continue" in the page details
	When I click on "Save" in the page details
	And I complete the fields from the sheet "StrategicGoalEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	When I click on top right button "New" in flex table with id "RelatedObjectives"
	And I enter "ObjectiveCreation" values from "Planning_Field_Values.xlsx"
	When I click on "Save and Continue" in the page details
	And I click on "Save" in the page details
	When I click on "Edit" in the page details
	And I enter "ObjectiveEdition" values from "Planning_Field_Values.xlsx"
	When I click on "Save" in the page details
	
	@additionOfAttachmentToObjective @strategicPlan 
	Scenario: Addition of Attachment to Objective inside a Strategic Goal
	And I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	When I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	And I click on "Save and Continue" in the page details
	When I click on "Save" in the page details
	When I click on top right button "New" in flex table with id "RelatedObjectives"
	And I enter "ObjectiveCreation" values from "Planning_Field_Values.xlsx"
	When I click on "Save and Continue" in the page details
	And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epU7AAI"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Strategic Plan"
    And I close Modal
    Then I see that "Strategic Plan" has been added in flextable with Id "a150b000003epU7AAI"
    
    @associatingKPIToObjective @strategicPlan 
	Scenario: Associating KPI to Objective inside a Strategic Goal
	And I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	When I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	And I click on "Save and Continue" in the page details
	When I click on "Save" in the page details
	When I click on top right button "New" in flex table with id "RelatedObjectives"
	And I enter "ObjectiveCreation" values from "Planning_Field_Values.xlsx"
	When I click on "Save and Continue" in the page details
	And I click on "Save" in the page details
	When I navigate to "Related Logs" sub tab
	And I click on top right button "Associate" in flex table with id "KPIGoalsandObjectives"
	When I click "Associate" after selection of "Automation Program KPI" in the table "SelectKPIs"
	And I switch to Parent frame
	Then I see that "Automation Program KPI" has been added in flextable with Id "KPIGoalsandObjectives"
	
	@strategicPlanHappyPath @strategicPlan 
	Scenario: Associating KPI to Objective inside a Strategic Goal
	And I complete the fields from the sheet "StrategicPlanEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003ep3EAAQ |
    | Attachment Details    | Attachment  | Strategic Plan					 |					  |
	And I click on top right button "New" in flex table with id "flexGridGrantorStrategicGoalObjectives"
	Given I enter "StrategicGoalCreation" values from "Planning_Field_Values.xlsx"
	And I click on "Save and Continue" in the page details
	Given I click on "Save" in the page details
	And I complete the fields from the sheet "StrategicGoalEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epW2AAI |
    | Attachment Details    | Attachment  | Strategic Plan					 |					  |
	Given I click on top right button "New" in flex table with id "RelatedObjectives"
	And I enter "ObjectiveCreation" values from "Planning_Field_Values.xlsx"
	Given I click on "Save and Continue" in the page details
	And I click on "Save" in the page details
	Given I complete the fields from the sheet "ObjectiveEdition" in excel "Planning_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epU7AAI |
    | Attachment Details    | Attachment  | Strategic Plan					 |					  |
	Given I associate "1" records "Automation Program KPI"
	| Actions 	  | Step 1       | Step 2	 | Step 3  			     | Step 4    | Step 5  	  |
    | Associate 1 | Related Logs | Associate | KPIGoalsandObjectives | Associate | SelectKPIs |
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"