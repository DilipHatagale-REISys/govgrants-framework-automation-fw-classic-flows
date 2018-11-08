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
	| User | Quick Search Text |
	| SPI | Automation Announcement |
	
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
	| User | Quick Search Text |
	| SPI | Automation Announcement |
	
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
	Then I see that "Application Title" is in "Created" status

	Examples:
	| User | Quick Search Text |
	| SPI | Automation Announcement |
	
  @applicationEdition @applicationIntake
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
	| User | Quick Search Text |
	| SPI | Automation Announcement Application |
	
  @addFocusAreaToApplication @applicationIntake
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
	| User | Quick Search Text | Flextable Name | EGMS Id |
	| SPI | Automation Announcement Application | Focus Area | 00005 |
	
  @addBudgetDetailsToApplication @applicationIntake
  Scenario Outline: Addition of Focus area to an application
	Given I login as "<User>" User to subrecipient portal
	When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
    When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Financials" subtab
    When I expand the grid "Budget Details"
    And I expand the grid "Budget Details"
	
	Examples:
	| User | Quick Search Text | Flextable Name | EGMS Id |
	| SPI | Automation Announcement Application | Focus Area | 00005 |	
	
	
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
	| User | Quick Search Text |
	| SPI | Automation Announcement Application |
	
	
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
	And I click on "Overview" subtab
	When I click on Agree in "Acknowledgement" section
	When I click on "Save" button
	Then I see that "Application Title" is in "Created" status
	

	Examples:
	| User | Quick Search Text |
	| SPI | Automation Announcement |