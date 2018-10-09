@home
Feature: Validate all scenarios in the home tab

  @35024 @InternalOrganizationCreate @InternalOrganization
  Scenario: Verifying if the Admin has create access to Internal Organization
    Given I login as "Admin" User
    When I toggle to "As Administrator" app
    When I navigate to "Setup" tab
    And I click "Internal Organizations" inside side bar "Manage Organizations"
    When I click on "New" button on the Draft Internal Organizations
    When I fill in all the required fields for Internal Organization
    When I click on "Save" button
    Then I see that "Internal Organization" is created in status "Created"
    
  @35637 @InternalOrganizationEdit @InternalOrganization
  Scenario: Verifying if the Admin has edit access to Internal Organization
    Given I login as "Admin" User
    When I toggle to "As Administrator" app
    When I navigate to "Setup" tab
    And I click "Internal Organizations" inside side bar "Manage Organizations"
    When I click on "View" icon on the Draft Internal Organizations
    When I click on "Edit" button
    When I change the "Abbreviation__c" field to "Automation"
    And I click on "Save" button
    Then I see that "Agency Abbreviation" field is modified to "Automation"
    
  @35026 @AddingNewIndirectRates @InternalOrganization
  Scenario: Verify system allows certain access related to Internal Organization to the Admin, Program Manager and Fiscal Manager
    Given I login as "Admin" User
	When I toggle to "As a Grantor" app
	When I navigate to "Home" tab
	And I click "Internal" inside side bar "Organization"
	When I click on "View" icon on the Internal Organization Hierarchy
	When I click the button "New" on "Indirect Rates" flex table
	When I fill all the required fields for the Indirect Rates
	Then I see that "Indirect Rates" is created
	
	
	
	