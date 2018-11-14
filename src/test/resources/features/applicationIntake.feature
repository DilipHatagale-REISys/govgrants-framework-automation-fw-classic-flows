@applicationIntake
Feature: Validate all scenarios in the Application Intake

	Background: Qualify Announcement and Create Application
		Given I qualiy the announcement "Automation Announcement" as user "SPI"
		And I create an Application from sheet "Creation" in excel "Application_Field_Values.xlsx"
		
  	@announcementQualification @applicationIntake
  	Scenario: Qualifying an Announcement
	    Then I see that "Opportunity" is in "Qualified" status
	
  	@preapplicationCreation @applicationIntake
  	Scenario: Creating a Pre-Application
	    When I click on "Create Pre-Application" button to switch to frame "iframeActionModalIdViewLayout"
		When I enter "Creation" values from "Application_Field_Values.xlsx"
		When I click on "Save and Close Modal" button in the modal
		Then I see that "Pre-Application" is in "Created" status

  	@34044 @applicationCreation @applicationIntake
  	Scenario: Creating an Application
		Then I see that "Application Title" is in "Created" status

  	@34045 @applicationEdition @applicationIntake
  	Scenario: Edition of an application
  		When I click on "Edit" button
		When I enter "Edition" values from "Application_Field_Values.xlsx"
		When I click on "Save" button
		Then I see that "Created" status is in "green" on progress bar
	
  	@34303 @addFocusAreaToApplication @applicationIntake
  	Scenario Outline: Addition of Focus area to an application
	    And I click on "Financials" subtab
	    When I click on "Add Focus Area" button on "<Flextable Name>" flextable to switch to frame "FocusAreaAppiframeContentId"
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
	    When I click on "Edit" on the child grid against "Construction" in the table "toggleFGridApplicationBudgetCategoryGrantorFlexGrid"
		And I fill the fields in the table "childTableId":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 3                 | text     | 5000                       |
	    | 4                 | text     | 1000                       |
	    | 5                 | text     | 3000                       |
		When I click on "Save" button on "<Flextable Name>" flextable
	
	Examples:
	| Flextable Name |
	| Budget Details |	
	
  	@addTargetToKPIInApplication @applicationIntake
  	Scenario Outline: Addition of KPI target to an application 
	    And I click on "Proposal" subtab
	    When I click on the "Edit" icon for the "KPI-0005" on the flextable "<Flextable Name>"
	    And I fill the fields in the table "toggleFGridRecipientApplicationRelatedKPIs":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 5                 | text     | 10                         |
		When I click on "Save" button on "<Flextable Name>" flextable
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
	    When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
	    And I click on the "View" icon for the "<Quick Search Text>" 
	    And I click on "Attachments" subtab
	    When I click on the "Attach" icon for the "Not Applicable" on the flextable "<Flextable Name>" to switch to frame "ApplicationChecklistsiframeContentId"
	    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Application"
	    And I close Modal "ApplicationChecklistsiframeContentIdButton"
	    When I click on the "Attach" icon for the "Not Applicable" on the flextable "<Flextable Name>" to switch to frame "ApplicationChecklistsiframeContentId"
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
		When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
	    And I click on the "Edit" icon for the "<Quick Search Text>"
		And I click on "Overview" subtab
		When I click on Agree in "Acknowledgement" section
		When I click on "Save" button
		Then I see that "Created" status is in "green" on progress bar

	Examples:
	| User | Quick Search Text                   |
	| SPI  | Automation Announcement Application |
	
  	@34156 @submitApplication @applicationIntake
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
		When I perform quick search "<Quick Search Text>" on table "ApplicantGrantorApplications"
		And I click on the "View" icon for the "<Quick Search Text>"

	Examples:
	| User | Quick Search Text                   |
	| EXE  | Automation Announcement Application |
	
  	@applicationIntakeHappyPath @applicationIntake
  	Scenario Outline: Happy path of Application intake
	 	Given I login to "Grants Portal" app as "<User>" User
	    When I navigate to "Opportunities" tab
		And I click "Active" inside side bar "Opportunities"
		When I perform quick search "<Quick Search Text>" on table "popupflextable"
	    And I click on the "View" icon for the "<Quick Search Text>"
	    When I click on "Qualify" button
		When I click on "Create Application" button to switch to frame "iframeActionModalIdViewLayout"
		When I enter "Creation" values from "Application_Field_Values.xlsx"
		When I click on "Save and Close Modal" button in the modal
		When I enter "Edition" values from "Application_Field_Values.xlsx"
		When I click on "Save" button
		And I click on "Financials" subtab
	    When I click on "Add Focus Area" button on "Focus Area" flextable to switch to frame "FocusAreaAppiframeContentId"
	    When I click "Add" after selection of "00005" in the table "popupflextable"
	    And I close Modal "FocusAreaAppmodalDivCloseIcon"
		And I click on "Financials" subtab
	    When I expand the "BP01" on grid "Budget Details"
	    When I expand the "Proposed Budget" on grid "Budget Details"
	    When I click on "Edit" on the child grid against "Construction" in the table "toggleFGridApplicationBudgetCategoryGrantorFlexGrid"
		And I fill the fields in the table "childTableId":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 3                 | text     | 5000                       |
	    | 4                 | text     | 1000                       |
	    | 5                 | text     | 3000                       |
		When I click on "Save" button on "Budget Details" flextable
		And I click on "Proposal" subtab
	    When I click on the "Edit" icon for the "KPI-0005" on the flextable "Key Performance Indicators"
	    And I fill the fields in the table "toggleFGridRecipientApplicationRelatedKPIs":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 5                 | text     | 10                         |
		When I click on "Save" button on "Key Performance Indicators" flextable
		When I click on the "Edit" icon for the "KPI-0006" on the flextable "Key Performance Indicators"
	    And I fill the fields in the table "toggleFGridRecipientApplicationRelatedKPIs":
	    | tableColumnNumber | inputype | inputValue                 |
	    | 5                 | text     | 10                         |
		When I click on "Save" button on "Key Performance Indicators" flextable
		And I click on "Attachments" subtab
	    When I click on the "Attach" icon for the "Not Applicable" on the flextable "Attachment Checklist" to switch to frame "ApplicationChecklistsiframeContentId"
	    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Application"
	    And I close Modal "ApplicationChecklistsiframeContentIdButton"
	    When I click on the "Attach" icon for the "Not Applicable" on the flextable "Attachment Checklist" to switch to frame "ApplicationChecklistsiframeContentId"
	    When I choose the file "Annoluncement_Field_Values.xlsx" to upload for "Checklist" of type "Application"
	    And I close Modal "ApplicationChecklistsiframeContentIdButton"
		When I click on "Edit" button
		And I click on "Overview" subtab
		When I click on Agree in "Acknowledgement" section
		When I click on "Save" button
		When I click on "Submit Application" button
		Then I see that "Submitted" status is in "green" on progress bar

	Examples:
	| User | Quick Search Text       |
	| SPI  | Automation Announcement |