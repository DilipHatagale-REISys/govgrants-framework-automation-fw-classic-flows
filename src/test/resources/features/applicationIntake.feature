@applicationIntake
Feature: Validate all scenarios in the Application Intake

	Background: Qualify Announcement and Create Application
	Given I qualiy the announcement "Automation Announcement to be deleted" as user "SPI"
	And I create an Application from sheet "Creation" in excel "Application_Field_Values.xlsx"
	
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
    When I click on "Budget" subtab
    And I click on "Add Focus Area" button on "<Flextable Name>" flextable with Id "FocusAreaApp"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I switch to Parent frame
    Then I see that "<EGMS Id>" has been added in flextable "<Flextable Name>" with Id "FocusAreaApp"
	Examples:
	| Flextable Name | EGMS Id |
	| Focus Area     | 00005   |

  	@addBudgetDetailsToApplication @applicationIntake
  	Scenario Outline: Addition of budget in the budget grid to an application
  	Given I add focus area "00005" to the application
    When I click on "Budget" subtab
    And I expand the "BP01" on grid "<Flextable Name>"
    When I expand the "Proposed Budget" on grid "<Flextable Name>"
    When I edit the following rows inline in flex table with id "inlineEditGridApplicationBudgetCategoryGrantorFlexGrid" by clicking "Edit" :
	| Category Name | Budget | Cash Match | Non-Cash Match |
	| Construction	| 5000 	| 1000   	 | 3000 		  | 
	Examples:
	| Flextable Name |
	| Budget Details |	
	
  	@addTargetToKPIInApplication @applicationIntake
  	Scenario Outline: Addition of KPI target to an application 
    When I click on "Proposal" subtab
    When I edit the following rows inline in flex table with id "inlineEditGridRecipientApplicationRelatedKPIs" by clicking "Edit" :
	| EGMS ID  | Target |
	| KPI-0005 | 10		|
	| KPI-0006 | 10		|
	Then I see that "10" has been added in flextable "<Flextable Name>" with Id "inlineEditGridRecipientApplicationRelatedKPIs"
	Examples:
	| Flextable Name             |
	| Key Performance Indicators |
	
  	@uploadAttachmentForChecklistInApplication @applicationIntake
  	Scenario Outline: Attaching a document for attachment checklist in an application
    When I click on "Attachments" subtab
    And I click on the "Attach" icon for the "Not Applicable" on the flextable "<Flextable Name>"
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Application"
    And I close Modal "ApplicationChecklistsiframeContentIdButton"
    When I click on the "Attach" icon for the "Not Applicable" on the flextable "<Flextable Name>"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Application"
    When I close Modal "ApplicationChecklistsiframeContentIdButton"
    Examples:
	| Flextable Name  	 		     |
	| Supporting Documents Checklist |
	
  	@applicationAcknowledgement @applicationIntake
  	Scenario: Acknowledging an application
	When I click on "Overview" subtab
	And I click on Agree in "Acknowledgement" section
	When I click on "Save" button
	Then I see that "Created" status is in "green" on progress bar
	
  	@34156 @submitApplication @applicationIntakeHappyPath @applicationIntake
  	Scenario: Submitting an application to Grantor
	Given I complete the Application fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
	And I add focus area "00005" to the application
	Given I add budget details to the application
	| Category Name | Budget | Cash Match | Non-Cash Match |
	| Construction  | 5000 	| 1000   	 | 3000 		   |
	And I add target to the KPI in the application
	| EGMS ID  | Target |
	| KPI-0005 | 10		|
	| KPI-0006 | 10		|
	Given I upload checklist "Announcement_Field_Values.xlsx" to the application
    When I click on "Submit Application" button
    Then I see that "Submitted" status is in "green" on progress bar
	
  	@34346 @viewSubmitedApplication @applicationIntake
  	Scenario Outline: Viewing the application submitted by subrecipient as Internal user
  	Given I complete the Application fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
	And I add focus area "00005" to the application
	Given I add budget details to the application
	| Category Name | Budget | Cash Match | Non-Cash Match |
	| Construction 	| 5000 	 | 1000   	 | 3000 		  |
	And I add target to the KPI in the application
	| EGMS ID  | Target |
	| KPI-0005 | 10		|
	| KPI-0006 | 10		|
	Given I upload checklist "Annoluncement_Field_Values.xlsx" to the application
    When I click on "Submit Application" button
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Submitted Applications"
	And I perform quick search "<Application Name>" on table "ApplicantGrantorApplications"
	When I click on the "View" icon for the "<Application Name>"
	Examples:
	| User | Application Name                    |
	| EXE  | Automation Announcement Application |