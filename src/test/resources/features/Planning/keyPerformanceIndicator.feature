@kpi @regression 
Feature: Validate all scenarios in Key Performance Indicator(KPI) 

Background: To setup data 
	Given I delete the record "Automation Execution KPI" from the object "KPI" 
	
@34735 @creationOfKPI @smoke 
Scenario: Creation of KPI 
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "KPI_Field_Values.xlsx" 
		| Actions    | Step 1                           | Step 2            | Step 3                                 |
		| Navigation | As a Grantor                     | Planning          | Planning                               |
		| FlexTable  | Key Performance Indicators (KPI) |GrantorMasterKPIs  | Draft Key Performance Indicators (KPI) |
		| Creation   | New                              | Save and Continue | Save                                   |
		| ID         | EGMS ID                          |                   |                                        |
	Then I see status in Progress-bar is "Created" and is "green" 
	
@51028 @editionOfKPI 
Scenario: Edition of KPI 
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "KPI_Field_Values.xlsx" 
		| Actions    | Step 1                           | Step 2            | Step 3                                 |
		| Navigation | As a Grantor                     | Planning          | Planning                               |
		| FlexTable  | Key Performance Indicators (KPI) |GrantorMasterKPIs  | Draft Key Performance Indicators (KPI) |
		| Creation   | New                              | Save and Continue | Save                                   |
		| ID         | EGMS ID                          |                   |                                        |
	And I click on "Edit" in the page details 
	When I enter "Edition" values from "KPI_Field_Values.xlsx" 
	And I click on "Save" in the page details 
	Then I see status in Progress-bar is "Created" and is "green" 
	
@51026 @addAttachmentToKPI
Scenario: Addition of Attachment to KPI 
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "KPI_Field_Values.xlsx" 
		| Actions    | Step 1                           | Step 2            | Step 3                                 |
		| Navigation | As a Grantor                     | Planning          | Planning                               |
		| FlexTable  | Key Performance Indicators (KPI) |GrantorMasterKPIs  | Draft Key Performance Indicators (KPI) |
		| Creation   | New                              | Save and Continue | Save                                   |
		| ID         | EGMS ID                          |                   |                                        |
	When I navigate to "Attachments" sub tab 
	And I click on top right button "Add" in flex table with id "---keyperformanceindicator:-:kpi_Attachment_Table_Id---" 
	When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Supporting Documents" 
	And I close Modal 
	Then I see that "Supporting Documents" has been added in flextable with Id "---keyperformanceindicator:-:kpi_Attachment_Table_Id---" 
	
@34736 @kpiHappyPath @smoke 
Scenario: Happy Path of KPI 
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "KPI_Field_Values.xlsx" 
		| Actions    | Step 1                           | Step 2            | Step 3                                 |
		| Navigation | As a Grantor                     | Planning          | Planning                               |
		| FlexTable  | Key Performance Indicators (KPI) |GrantorMasterKPIs  | Draft Key Performance Indicators (KPI) |
		| Creation   | New                              | Save and Continue | Save                                   |
		| ID         | EGMS ID                          |                   |                                        |
	Given I complete the fields from the sheet "Edition" in excel "KPI_Field_Values.xlsx" 
		| Actions         | Step 1 | Step 2 |
		| Edition Buttons | Edit   | Save   |
			And I add an attachment "InternalOrganization_Field_Values.xlsx" 
				| Actions               | Step 1      | Step 2               | Step 3             |
				| Attachment Navigation | Attachments | Add                  | a1511000002nJhwAAE |
				| Attachment Details    | Attachment  | Supporting Documents |                    |
	Given I click on "Activate" in the page details 
	Then I see status in Progress-bar is "Active" and is "green" 
	
	
@52627 @activateKPI @smoke 
Scenario: Activate KPI 
	Given I create a planning record as user "EXE" from sheet "Creation" in excel "KPI_Field_Values.xlsx" 
		| Actions    | Step 1                           | Step 2            | Step 3                                 |
		| Navigation | As a Grantor                     | Planning          | Planning                               |
		| FlexTable  | Key Performance Indicators (KPI) |GrantorMasterKPIs  | Draft Key Performance Indicators (KPI) |
		| Creation   | New                              | Save and Continue | Save                                   |
		| ID         | EGMS ID                          |                   |                                        |
	When I click on "Activate" in the page details 
	Then I see status in Progress-bar is "Active" and is "green" 
	
@52627 @kpiCreationPM @smoke 
Scenario: 
	Negative Case- Verify that other users (Other than Admin/EXE) are not able to create KPI 
	Given I am on "INTERNAL" portal 
	Given I login as "PM" user 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	Then  I cannot see top right button "New" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	
	
@52625 @userFOEditKPI @smoke 
Scenario: Negative Case-Verfiy that PM user cannot Edit the record 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Key Performance Indicators (KPI)" 
	When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	When I enter "Creation" values from "KPI_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Key Performance Indicators (KPI)" in "---keyperformanceindicator:-:kpi_Table_Id---" 
	When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpi_Table_Id---" panel 
	Then I cannot see row level action button "Edit" against "Automation Execution KPI" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	
@52622 @userFODeelteKPI @smoke 
Scenario: Negative Case-Verfiy that PM user cannot Delete the record 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Key Performance Indicators (KPI)" 
	When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	When I enter "Creation" values from "KPI_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Key Performance Indicators (KPI)" in "---keyperformanceindicator:-:kpi_Table_Id---" 
	When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpi_Table_Id---" panel 
	Then I cannot see row level action button "Delete" against "Automation Execution KPI" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	
@52623 @deactivateKPI 
Scenario Outline: Negative Case-Verfiy that EXE can deactivate the record 
	Given I am on "INTERNAL" portal 
	Given I login as "<User>" user 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Key Performance Indicators (KPI)" 
	When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	When I enter "Creation" values from "KPI_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	When I click on "Activate" in the page details 
	And I click on "Deactivate" in the page details 
	Then I see status in Progress-bar is "Inactive" and is "green" 
	Examples: 
		|User |
		|ADMIN|
		|EXE  |
		
@52536 @deactivateKPIFOUser 
Scenario Outline: 
	Negative Case- Verfiy that other users (other than Admin, EXE) can not deactivate KPI 
	Given I am on "INTERNAL" portal 
	Given I login as "<User>" user 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Key Performance Indicators (KPI)" 
	When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	When I enter "Creation" values from "KPI_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	When I click on "Activate" in the page details 
	When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Active Key Performance Indicators (KPI)" 
	When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpi_Table_Id---" panel 
	And I click on "View" icon for "Automation Execution KPI" inside table 
	Then I cannot see top right button "Deactivate" in page detail 
	Examples: 
		|User |
		|EXE  |
				
@52535 @closedKPIListView 
Scenario: Verfiy that user can see Closed KPI under Inactive KPI list view. 
	Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Key Performance Indicators (KPI)" 
	When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpi_Table_Id---" 
	When I enter "Creation" values from "KPI_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	When I click on "Activate" in the page details 
	And I click on "Deactivate" in the page details 
	When I navigate to "Planning" tab 
	And I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Inactive Key Performance Indicators (KPI)" 
	When I perform quick search for "Automation Execution KPI" in "---keyperformanceindicator:-:kpi_Table_Id---" panel 
	And I click on "View" icon for "Automation Execution KPI" inside table 
	Then I see status in Progress-bar is "Inactive" and is "green" 
					
					
    