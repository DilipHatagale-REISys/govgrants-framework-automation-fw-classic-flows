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
	
  @applicationCreation @applicationIntake
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
  Scenario Outline: 
    Given I login as "<User>" User to subrecipient portal
    When I navigate to "Applications" tab
	And I click "Applications" inside side bar "Applications"
	When I toggle to "Active Applications"
	When I perform quick search "<Quick Search Text>" on table "RecipientApplications"
    And I click on the "Edit" icon for the "<Quick Search Text>"
	And I click on "Overview" subtab
	When I enter "Edition" values from "Application_Field_Values.xlsx"
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
	Then I see that "Application Title" is in "Created" status
	

	Examples:
	| User | Quick Search Text |
	| SPI | Automation Announcement |