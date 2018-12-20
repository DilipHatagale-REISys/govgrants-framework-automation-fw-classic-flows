@home
Feature: Validate all scenarios in the home tab

  	@35024 @internalOrganizationCreate @InternalOrganization
  	Scenario: Verifying if the Admin has create access to Internal Organization
  	Given I login to "As Administrator" app as "Admin" User
    When I navigate to "Setup" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    When I click toggle button for "Draft Internal Organizations"
    And I click on top right button "New" in flex table with id "inlineEditGridInternalOrganizationHierarchy"
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status
    
  	@35637 @internalOrganizationEdit @InternalOrganization
  	Scenario Outline: Verifying if the Admin has edit access to Internal Organization
    Given I login to "As Administrator" app as "Admin" User
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    When I click on "View" icon for "<Organization name>" inside flex table with id "OrganizationId"
    When I click on "Edit" in the page details
    When I enter "Abbreviation__c" as "Automation"
    And I click on "Save" in the page details
    Then I see that "Agency Abbreviation" field is modified to "Automation"
	Examples:
	| Organization name 				    |
	| Internal Automation Organization Test |
	
	
	