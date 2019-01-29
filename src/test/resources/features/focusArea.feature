@focusArea
Feature: Validate all scenarios in Focus Area

@creationOfStrategicPlan @strategicPlan 
	Scenario: Creation of Strategic Plan
	Given I login to "As a Grantor" app as "EXE" user
	When I navigate to "Strategic Plans" content inside "Planning" subheader on left panel inside "Planning" tab
	And I click on top right button "New" in flex table with id "StrategicPlans"
	When I enter "StrategicPlanCreation" values from "Planning_Field_Values.xlsx"
	And I click modal button "Save And Close"
	Then I see status in Progress-bar is "Created" and is "green"