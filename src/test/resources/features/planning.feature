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
    | EXE | Internal Program Automation EXE | Project Grants | Preparedness - OG&T |
    
    
  @34732 @ProgramContactsAssociation @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    Given I login as "<User>" User
    When I toggle to "As a Grantor" app
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on flextable and toggle to "Draft Internal Programs"
    When I quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Associate" button on "Contacts" flextable
    
    Examples:
    | User | Quick Search Text | 
    | EXE | Automation Program | 