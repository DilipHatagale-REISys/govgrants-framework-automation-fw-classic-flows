@home
Feature: Validate all scenarios in the home tab

  @35024 @internalOrganizationCreate @InternalOrganization
  Scenario: Verifying if the Admin has create access to Internal Organization
  	Given I login to "As Administrator" app as "Admin" User
    When I navigate to "Setup" tab
    And I click "Internal Organizations" inside side bar "Manage Organizations"
    When I click on "New" button on "Draft Internal Organizations" phase flextable
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    When I click on "Save" button
    Then I see that "State Organization" is in "Created" status
    
  @35637 @internalOrganizationEdit @InternalOrganization
  Scenario Outline: Verifying if the Admin has edit access to Internal Organization
    Given I login to "As Administrator" app as "Admin" User
    When I navigate to "Setup" tab
    And I click "Internal Organizations" inside side bar "Manage Organizations"
    When I click on "View" icon on "Organizations" table against "<Organization name>"
    When I click on "Edit" button
    When I change the "Abbreviation__c" field to "Automation"
    And I click on "Save" button
    Then I see that "Agency Abbreviation" field is modified to "Automation"
    
	Examples:
	| Organization name 				    |
	| Internal Automation Organization Test |
	
	
	