@focusArea
Feature: Validate all scenarios in Focus Area

	Background: To setup data
	Given I delete the record "Automation Focus Area Regression" from the object "Focus Area"
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "FocusArea_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	   | Step 3 				    |
	| Navigation | As a Grantor		 | Planning  	 	   | Planning	    			|
	| FlexTable  | Focus Areas	     | GrantorServiceAreas | Draft Focus Area	        |
	| Creation   | New				 | Save And Close      | Save						|
	| ID		 | EGMS ID			 |					   |							|

	@creationOfFocusArea @focusArea @all
	Scenario: Creation of Focus Area
	Then I see status in Progress-bar is "Created" and is "green"
	
	@editionOfFocusArea @focusArea @all
	Scenario: Edition of Focus Area
	And I click on "Edit" in the page details
	When I enter "Edition" values from "FocusArea_Field_Values.xlsx"
	And I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
	@addAttachmentToFocusArea @focusArea @all
	Scenario: Addition of Attachment to Focus Area
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "a150b000003epDEAAY"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Supporting Documents"
    And I close Modal
    Then I see that "Supporting Documents" has been added in flextable with Id "a150b000003epDEAAY"
    
    @activateFocusArea @focusArea @all
	Scenario: Activate Focus Area
    When I click on "Activate" in the page details
	Then I see status in Progress-bar is "Active" and is "green"
	
	@focusAreaHappyPath @focusArea @all
	Scenario: Happy Path of Focus Area
	Given I complete the fields from the sheet "Edition" in excel "FocusArea_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  				 | Step 3			  |
    | Attachment Navigation | Attachments | Add								 | a150b000003epDEAAY |
    | Attachment Details    | Attachment  | Supporting Documents			 |					  |
    Given I click on "Activate" in the page details
	Then I see status in Progress-bar is "Active" and is "green"