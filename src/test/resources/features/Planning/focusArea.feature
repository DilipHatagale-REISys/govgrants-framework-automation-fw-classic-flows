@focusArea @regression 
Feature: Validate all scenarios in Focus Area 

Background: To setup data 
	Given I delete the record "Automation Execution Focus Area" from the object "Focus Area" 
	
@34512 @creationOfFocusArea @smoke 
Scenario: Creation of Focus Area 
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "FocusArea_Field_Values.xlsx" 
		| Actions    | Step 1       | Step 2              | Step 3           |
		| Navigation | As a Grantor | Planning            | Planning         |
		| FlexTable  | Focus Areas  | GrantorServiceAreas | Draft Focus Area |
		| Creation   | New          | Save and Continue   | Save             |
		| ID         | EGMS ID      |                     |                  |
	Then I see status in Progress-bar is "Created" and is "green" 
	
@50963 @editionOfFocusArea @smoke 
Scenario: Edition of Focus Area 
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "FocusArea_Field_Values.xlsx" 
		| Actions    | Step 1       | Step 2              | Step 3           |
		| Navigation | As a Grantor | Planning            | Planning         |
		| FlexTable  | Focus Areas  | GrantorServiceAreas | Draft Focus Area |
		| Creation   | New          | Save and Continue   | Save             |
		| ID         | EGMS ID      |                     |                  |
	And I click on "Edit" in the page details 
	When I enter "Edition" values from "FocusArea_Field_Values.xlsx" 
	And I click on "Save" in the page details 
	Then I see status in Progress-bar is "Created" and is "green" 
	
@50961 @addAttachmentToFocusArea 
Scenario: Addition of Attachment to Focus Area 
	And I create a planning record as user "EXE" from sheet "Creation" in excel "FocusArea_Field_Values.xlsx" 
		| Actions    | Step 1       | Step 2              | Step 3           |
		| Navigation | As a Grantor | Planning            | Planning         |
		| FlexTable  | Focus Areas  | GrantorServiceAreas | Draft Focus Area |
		| Creation   | New          | Save and Continue   | Save             |
		| ID         | EGMS ID      |                     |                  |
	When I navigate to "Attachments" sub tab 
	And I click on top right button "Add" in flex table with id "focusArea::focusAreaAttachmentTableId" 
	When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Supporting Documents" 
	And I close Modal 
	Then I see that "Supporting Documents" has been added in flextable with Id "focusArea::focusAreaAttachmentTableId" 
	
@34729 @activateFocusArea @smoke 
Scenario: Activate Focus Area 
	And I create a planning record as user "EXE" from sheet "Creation" in excel "FocusArea_Field_Values.xlsx" 
		| Actions    | Step 1       | Step 2              | Step 3           |
		| Navigation | As a Grantor | Planning            | Planning         |
		| FlexTable  | Focus Areas  | GrantorServiceAreas | Draft Focus Area |
		| Creation   | New          | Save and Continue   | Save             |
		| ID         | EGMS ID      |                     |                  |
	When I click on "Activate" in the page details 
	Then I see status in Progress-bar is "Active" and is "green" 
	
@50962 @focusAreaHappyPath @smoke 
Scenario: Happy Path of Focus Area 
	And I create a planning record as user "EXE" from sheet "Creation" in excel "FocusArea_Field_Values.xlsx" 
		| Actions    | Step 1       | Step 2              | Step 3           |
		| Navigation | As a Grantor | Planning            | Planning         |
		| FlexTable  | Focus Areas  | GrantorServiceAreas | Draft Focus Area |
		| Creation   | New          | Save and Continue   | Save             |
		| ID         | EGMS ID      |                     |                  |
	Given I complete the fields from the sheet "Edition" in excel "FocusArea_Field_Values.xlsx" 
		| Actions         | Step 1 | Step 2 |
		| Edition Buttons | Edit   | Save   |
	And I add an attachment "InternalOrganization_Field_Values.xlsx" 
		| Actions               | Step 1      | Step 2               | Step 3             |
		| Attachment Navigation | Attachments | Add                  | a150b000003epDEAAY |
		| Attachment Details    | Attachment  | Supporting Documents |                    |
	Given I click on "Activate" in the page details 
	Then I see status in Progress-bar is "Active" and is "green" 
	
@52455 @creationOFFocusAreaFOUser @smoke 
Scenario Outline:
Negative Scenario-Verify that FO is not able to create focus area 
	Given I am on "INTERNAL" portal 
	Given I login as "<User>" user 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	Then  I cannot see top right button "New" in flex table with id "GrantorServiceAreas" 
	Examples: 
		|User|
		|FO  |
		
@52461 @userFOEditfocusArea @smoke 
Scenario: Negative Case-Verfiy that FO user cannot Edit  the record 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Focus Area" 
	When I click on top right button "New" in flex table with id "GrantorServiceAreas" 
	When I enter "Creation" values from "FocusArea_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Focus Area" in "GrantorServiceAreas" 
	When I perform quick search for "Automation Execution Focus Area" in "GrantorServiceAreas" panel 
	Then I cannot see row level action button "Edit" against "Automation Execution Focus Area" in flex table with id "focusArea::focusAreaTableId" 
	
	@52620 @userFODeletefocusArea @smoke 
    Scenario: Negative Case-Verfiy that FO user cannot Delete the record 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Focus Area" 
	When I click on top right button "New" in flex table with id "GrantorServiceAreas" 
	When I enter "Creation" values from "FocusArea_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Focus Area" in "GrantorServiceAreas" 
	When I perform quick search for "Automation Execution Focus Area" in "GrantorServiceAreas" panel 
	Then I cannot see row level action button "Delete" against "Automation Execution Focus Area" in flex table with id "focusArea::focusAreaTableId" 
	 
@52474 @deactivatingfocusArea @smoke 
Scenario: Verfiy deactivating focus area 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Focus Area" 
	When I click on top right button "New" in flex table with id "GrantorServiceAreas" 
	When I enter "Creation" values from "FocusArea_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	And I get the "EGMS ID" 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "FocusArea_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I click on "Activate" in the page details 
	And I click on "Deactivate" in the page details 
	Then I see status in Progress-bar is "Closed" and is "green" 
	
@52475 @foUserdeactivatingfocusArea @smoke 
Scenario: Negative Case- Verfiy that other users (other than Admin, EXE, PM) can not deactivate focus area 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Focus Area" 
	When I click on top right button "New" in flex table with id "GrantorServiceAreas" 
	When I enter "Creation" values from "FocusArea_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	And I get the "EGMS ID" 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "FocusArea_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I click on "Activate" in the page details 
	When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Active Focus Area" in "focusArea::focusAreaTableId" 
	When I perform quick search for "Automation Execution Focus Area" in "focusArea::focusAreaTableId" panel 
	And I click on "View" icon for "Automation Execution Focus Area" inside table 
	Then I cannot see top right button "Deactivate" in page detail 
	
@52476 @closedfocusAreaListView @smoke 
Scenario: Verfiy that user can see Closed Focus Area under Inactive Focus Area list view. 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Focus Area" 
	When I click on top right button "New" in flex table with id "GrantorServiceAreas" 
	When I enter "Creation" values from "FocusArea_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	And I get the "EGMS ID" 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "FocusArea_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I click on "Activate" in the page details 
	And I click on "Deactivate" in the page details 
	When I navigate to "Planning" tab 
	And I navigate to "Focus Areas" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Inactive Focus Area" in "focusArea::focusAreaTableId" 
	When I perform quick search for "Automation Execution Focus Area" in "focusArea::focusAreaTableId" panel 
	And I click on "View" icon for "Automation Execution Focus Area" inside table 
	Then I see status in Progress-bar is "Closed" and is "green" 
	
    