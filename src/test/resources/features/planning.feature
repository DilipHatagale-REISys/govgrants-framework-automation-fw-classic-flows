@planning
Feature: Validate all scenarios in the Planning tab

  @34730 @ProgramListView @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
    Given I login as "<User>" User
    When I toggle to "As a Grantor" app
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on flextable and toggle to "<Program flextable Header>"
    Then I see that the status is "<Program Status>"
    
    Examples:
    | User | Program flextable Header | Program Status |
    | EXE | Draft Internal Programs | Created |
   
  
  @34503 @ProgramCreation @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    Given I login as "<User>" User
    When I toggle to "As a Grantor" app
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on "New" button on the flextable
    And I fill the fields "<Title>","<Program Type>","<Primary Funding Organization>"
    When I click on "Save and Continue" button
    When I click on "Save" button
    Then I see that "Internal Program" is created in status "Created"
    
    Examples:
    | User | Title | Program Type | Primary Funding Organization |
    | EXE | Automation Program | Project Grants | Preparedness - OG&T |
    
    
  @34732 @ProgramContactsAssociation @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE, PM, PO can associate contact with Internal Program
    Given I login as "<User>" User
    When I toggle to "As a Grantor" app
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on flextable and toggle to "Draft Internal Programs"
    When I quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    And I choose the "<Contact>" as the contact
    Then I see that "<Contact>" has been added in "Contacts" flextable
    
    Examples:
    | User | Quick Search Text | Contact |
    | EXE | Automation Program | Automation EXE |
    
    
  @34740 @ApproverSelection @InternalProgram @Program @Planning
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login as "<User>" User
	When I toggle to "As a Grantor" app
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I click on flextable and toggle to "Draft Internal Programs"
    When I quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "<Approver>" on the flextable "Approvers"
    And I fill in the "<Name>","<Description>","<Due Date>" for the Approver details
    Then I see that "<Name>" has been added in "Approvers" flextable
	
	
	Examples:
	| User | Quick Search Text | Approver | Name | Description | Due Date |
	| EXE | Automation Program | Program Approver | Automation EXE | Test Automation | 11/10/2018 |
	| EXE | Automation Program | Executive Approver | Automation EXE | Test Automation | 11/10/2018 |