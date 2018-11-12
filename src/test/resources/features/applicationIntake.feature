@applicationIntake
Feature: Validate all scenarios in the Application Intake

  @announcementQualification @applicationIntake
  Scenario Outline: Qualifying an Application
    Given I login as "<User>" User to subrecipient portal
    When I navigate to "Opportunities" tab
	And I click "Active" inside side bar "Opportunities"
	When I perform quick search "<Quick Search Text>" on table "popupflextable"
    And I click on the "View" icon for the "<Quick Search Text>"
    When I click on "Qualify" button
    Then I see that "Opportunity" is in "Qualified" status
	
	Examples:
	| User | Quick Search Text       |
	| SPI  | Automation Announcement |
	
  @preapplicationCreation @applicationIntake
  Scenario Outline: Creating an Application
    Given I login as "<User>" User to subrecipient portal
    When I navigate to "Opportunities" tab
	And I click "Qualified" inside side bar "Opportunities"
	When I perform quick search "<Quick Search Text>" on table "qleads"
    And I click on the "View" icon for the "<Quick Search Text>"
    When I click on "Create Pre-Application" button to switch to frame "iframeActionModalIdViewLayout"
	When I enter "Creation" values from "Application_Field_Values.xlsx"
	When I click on "Save and Close Modal" button in the modal
	Then I see that "Pre-Application" is in "Created" status

	Examples:
	| User | Quick Search Text       |
	| SPI  | Automation Announcement |
	
  @34044 @applicationCreation @applicationIntake
  Scenario Outline: Creating an Application
    Given I login as "<User>" User to subrecipient portal
    When I navigate to "Opportunities" tab
	And I click "Qualified" inside side bar "Opportunities"
	When I perform quick search "<Quick Search Text>" on table "qleads"
    And I click on the "View" icon for the "<Quick Search Text>"
    When I click on "Create Application" button to switch to frame "iframeActionModalIdViewLayout"
	When I enter "Creation" values from "Application_Field_Values.xlsx"
	When I click on "Save and Close Modal" button in the modal
	When I click on "Save" button
	Then I see that "Application Title" is in "Created" status

	Examples:
	| User | Quick Search Text       |
	| SPI  | Automation Announcement |
	
  @34045 @applicationEdition @applicationIntake
  Scenario Outline: Edition of an application
    Given I login as "<User>" User to subrecipient portal
    When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
	When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
    And I click on the "Edit" icon for the "<Quick Search Text>"
	When I enter "Edition" values from "Application_Field_Values.xlsx"
	When I click on "Save" button
	Then I see that the record is in "Created" status on progress bar

	Examples:
	| User | Quick Search Text                   |
	| SPI  | Automation Announcement Application |
	
  @34303 @addFocusAreaToApplication @applicationIntake
  Scenario Outline: Addition of Focus area to an application
	Given I login as "<User>" User to subrecipient portal
	When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
    When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Financials" subtab
    When I click on "Add Focus Area" button on "<Flextable Name>" flextable to switch to frame "FocusAreaAppiframeContentId"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal "FocusAreaAppmodalDivCloseIcon"
    Then I see that "<EGMS Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text                   | Flextable Name | EGMS Id |
	| SPI  | Automation Announcement Application | Focus Area     | 00005   |
	
  @addBudgetDetailsToApplication @applicationIntake
  Scenario Outline: Addition of budget in the budget grid to an application
	Given I login as "<User>" User to subrecipient portal
	When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
    When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Financials" subtab
    When I expand the "BP01" on grid "<Flextable Name>"
    When I expand the "Proposed Budget" on grid "<Flextable Name>"
    When I click on "Edit" on the child grid against "Construction" in the table "toggleFGridApplicationBudgetCategoryGrantorFlexGrid"
	And I fill the fields in the table "childTableId":
    | tableColumnNumber | inputype | inputValue                 |
    | 3                 | text     | 5000                       |
    | 4                 | text     | 1000                       |
    | 5                 | text     | 3000                       |
	When I click on "Save" button on "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text                   | Flextable Name |
	| SPI  | Automation Announcement Application | Budget Details |	
	
	
  @addTargetToKPIInApplication @applicationIntake
  Scenario Outline: Addition of KPI target to an application
	Given I login as "<User>" User to subrecipient portal
	When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
    When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
    And I click on the "View" icon for the "<Quick Search Text>" 
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
	| User | Quick Search Text                   | Flextable Name             |
	| SPI  | Automation Announcement Application | Key Performance Indicators |
	
  @uploadAttachmentForChecklistInApplication @applicationIntake
  Scenario Outline: Attachind a document for attachment checklist in an application
	Given I login as "<User>" User to subrecipient portal
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
    Given I login as "<User>" User to subrecipient portal
    When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
	When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
    And I click on the "Edit" icon for the "<Quick Search Text>"
	And I click on "Overview" subtab
	When I click on Agree in "Acknowledgement" section
	When I click on "Save" button
	Then I see that the record is in "Created" status on progress bar

	Examples:
	| User | Quick Search Text                   |
	| SPI  | Automation Announcement Application |
	
  @34156 @submitApplication @applicationIntake
  Scenario Outline: Acknowledging an application
    Given I login as "<User>" User to subrecipient portal
    When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
	When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
	And I click on the "View" icon for the "<Quick Search Text>"
    When I click on "Submit Application" button
    Then I see that the record is in "Submitted" status on progress bar

	Examples:
	| User | Quick Search Text                   |
	| SPI  | Automation Announcement Application |
	
	
  @34346 @viewSubmitedApplication @applicationIntake
  Scenario Outline: Viewing the application submitted by subrecipient as Internal user
    Given I login as "<User>" User to subrecipient portal
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
 	Given I login as "<User>" User to subrecipient portal
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
	Then I see that the record is in "Submitted" status on progress bar

	Examples:
	| User | Quick Search Text       |
	| SPI  | Automation Announcement |