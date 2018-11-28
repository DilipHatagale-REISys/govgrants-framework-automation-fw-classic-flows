@applicationIntake
Feature: Validate all scenarios in the Application Intake
	
  	@preapplicationCreation @applicationIntake
  	Scenario: Creating a Pre-Application
	    When I click on "Create Pre-Application" button to switch to frame "iframeActionModalIdViewLayout"
		And I enter "Creation" values from "Application_Field_Values.xlsx"
		When I click on "Save and Close Modal" button in the modal
		Then I see that "Pre-Application" is in "Created" status

  	@34044 @applicationCreation @applicationIntake
  	Scenario: Creating an Application
		Then I see that "Application Title" is in "Created" status

  	@34045 @applicationEdition @applicationIntake
  	Scenario: Edition of an application
  		When I click on "Edit" button
		And I enter "Edition" values from "Application_Field_Values.xlsx"
		When I click on "Save" button
		Then I see that "Created" status is in "green" on progress bar
	
  	@34303 @addFocusAreaToApplication @applicationIntake
  	Scenario Outline: Addition of Focus area to an application
	    When I click on "Financials" subtab
	    And I click on "Add Focus Area" button on "<Flextable Name>" flextable
	    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
	    And I close Modal "FocusAreaAppmodalDivCloseIcon"
	    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| Flextable Name | EGMS Id |
	| Focus Area     | 00005   |
	
  	@addBudgetDetailsToApplication @applicationIntake
  	Scenario Outline: Addition of budget in the budget grid to an application
	    When I click on "Financials" subtab
	    And I expand the "BP01" on grid "<Flextable Name>"
	    When I expand the "Proposed Budget" on grid "<Flextable Name>"
	    And I click on "Edit" on the grid against "Construction" in the table "toggleFGridApplicationBudgetCategoryGrantorFlexGrid"
		When I fill the fields in the table "childTableId":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 3                 | text     | 5000                       |
	    | 4                 | text     | 1000                       |
	    | 5                 | text     | 3000                       |
		And I click on "Save" button on "<Flextable Name>" flextable
	
	Examples:
	| Flextable Name |
	| Budget Details |	
	
  	@addTargetToKPIInApplication @applicationIntake
  	Scenario Outline: Addition of KPI target to an application 
	    When I click on "Proposal" subtab
	    And I click on the "Edit" icon for the "KPI-0005" on the flextable "<Flextable Name>"
	    When I fill the fields in the table "toggleFGridRecipientApplicationRelatedKPIs":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 5                 | text     | 10                         |
		And I click on "Save" button on "<Flextable Name>" flextable
		When I click on the "Edit" icon for the "KPI-0006" on the flextable "<Flextable Name>"
	    And I fill the fields in the table "toggleFGridRecipientApplicationRelatedKPIs":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 5                 | text     | 10                         |
		When I click on "Save" button on "<Flextable Name>" flextable
		Then I see that "10" has been added in "<Flextable Name>" flextable
	
	Examples:
	| Flextable Name             |
	| Key Performance Indicators |
	
  	@uploadAttachmentForChecklistInApplication @applicationIntake
  	Scenario Outline: Attachind a document for attachment checklist in an application
		Given I login to "Grants Portal" app as "<User>" User
		When I navigate to "Applications" tab
		And I click "Applications" inside side bar "Applications"
		When I toggle to "Active Applications"
	    And I perform quick search "<Quick Search Text>" on table "RecipientApplications"
	    When I click on the "View" icon for the "<Quick Search Text>" 
	    And I click on "Attachments" subtab
	    When I click on the "Attach" icon for the "Not Applicable" on the flextable "<Flextable Name>" to switch to frame "ApplicationChecklistsiframeContentId"
	    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Application"
	    When I close Modal "ApplicationChecklistsiframeContentIdButton"
	    And I click on the "Attach" icon for the "Not Applicable" on the flextable "<Flextable Name>" to switch to frame "ApplicationChecklistsiframeContentId"
	    When I choose the file "Annoluncement_Field_Values.xlsx" to upload for "Checklist" of type "Application"
	    And I close Modal "ApplicationChecklistsiframeContentIdButton"
	    
    Examples:
	| User | Quick Search Text                   | Flextable Name  	    |
	| SPI  | Automation Announcement Application | Attachment Checklist |
	
  	@applicationAcknowledgement @applicationIntake
  	Scenario Outline: Acknowledging an application
	    Given I login to "Grants Portal" app as "<User>" User
	    When I navigate to "Applications" tab
		And I click "Applications" inside side bar "Applications"
		When I toggle to "Active Applications"
		And I perform quick search "<Quick Search Text>" on table "RecipientApplications"
	    When I click on the "Edit" icon for the "<Quick Search Text>"
		And I click on "Overview" subtab
		When I click on Agree in "Acknowledgement" section
		And I click on "Save" button
		Then I see that "Created" status is in "green" on progress bar

	Examples:
	| User | Quick Search Text                   |
	| SPI  | Automation Announcement Application |
	
  	@34156 @submitApplication @applicationIntakeHappyPath @applicationIntake
  	Scenario Outline: Acknowledging an application
  		Given I complete the Application fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
  		And I add focus area "00005" to the application
  		Given I add budget details Award budget "5000", Cash match "1000", Non-cash match "3000" to the application
  		And I add target "10" to the KPI in the application
  		Given I upload checklist "Annoluncement_Field_Values.xlsx" to the application
	    When I click on "Submit Application" button
	    Then I see that "Submitted" status is in "green" on progress bar

	Examples:
	| User | Quick Search Text                   |
	| SPI  | Automation Announcement Application |
	
  	@34346 @viewSubmitedApplication @applicationIntake
  	Scenario Outline: Viewing the application submitted by subrecipient as Internal user
	    Given I login to "Grants Portal" app as "<User>" User
	    When I navigate to "Applications" tab
		And I click "Applications" inside side bar "Applications"
		When I toggle to "Submitted Applications"
		And I perform quick search "<Quick Search Text>" on table "ApplicantGrantorApplications"
		When I click on the "View" icon for the "<Quick Search Text>"

	Examples:
	| User | Quick Search Text                   |
	| EXE  | Automation Announcement Application |