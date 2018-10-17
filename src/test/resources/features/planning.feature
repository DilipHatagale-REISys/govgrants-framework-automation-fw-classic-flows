@planning
Feature: Validate all scenarios in the Planning tab


  @34730 @ProgramListView @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on flextable toggle to "<Program flextable Header>"
    Then I see that the status is "<Program Status>"
    
    Examples:
    | User | Program flextable Header | Program Status |
    | EXE | Draft Internal Programs | Created |
   
  
  @34503 @ProgramCreation @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on "New" button on the flextable
    When I enter "RequiredForSave" values from "Program_Field_Values.xlsx"
    When I click on "Save and Continue" button
    When I click on "Save" button
    Then I see that "Internal Program" is in "Created" status
    
    Examples:
    | User |
    | EXE |
    
  @34731 @ProgramEdition @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "Edit" icon for the "<Quick Search Text>" 
    When I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    And I click on "Save" button
    Then I see that "Abbreviation" field is modified to "AuPr"
    
    Examples:
    | User | Quick Search Text |
    | EXE | Automation Program |
    
    
  @34732 @ProgramContactsAssociation @InternalProgram @Program @Planning
  Scenario Outline: Verifying if the EXE, PM, PO can associate contact with Internal Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on flextable toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    And I choose the "Contact" with "<Contact>" and click "Add" button
    Then I see that "<Contact>" has been added in "Contacts" flextable
    
    Examples:
    | User | Quick Search Text | Contact |
    | EXE | Automation Program | Automation EXE |
    
    
  @34740 @ApproverSelection @InternalProgram @Program @Planning
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I click on flextable toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    And I fill in the "<Approver Name>" for the Approver details
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "<Approver Name>" for the Approver details
    Then I see that "<Approver Name>" has been added in "Approvers" flextable
	
	Examples:
	| User | Quick Search Text | Approver Name |
	| EXE | Automation Program | Automation PM |
	
	
  @34616 @FocusAreaAssociation @InternalProgram @Program @Planning
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I click on flextable toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    And I choose the "Focus Area" with "<Focus Area Id>" and click "Associate" button
    Then I see that "<Focus Area Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text | Flextable Name | Focus Area Id |
	| EXE | Automation Program | Focus Areas | 00000 |
	
	
  @34737 @GoalAssociation @InternalProgram @Program @Planning
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I click on flextable toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    And I choose the "Goals And Objectives" with "<Goal Id>" and click "Associate" button
    Then I see that "<Goal Id>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text | Flextable Name | Goal Id |
	| EXE | Automation Program | Objectives | SPN-0019 |
	
	
  @34738 @KPIAssociation @InternalProgram @Program @Planning
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I click on flextable toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    And I click on "Setup" subtab
    When I click on "Associate" button on "<Flextable Name>" flextable
    And I choose the "Key Performance Indicators" with "<KPI>" and click "Associate" button
    Then I see that "<KPI>" has been added in "<Flextable Name>" flextable
	
	Examples:
	| User | Quick Search Text |  Flextable Name | KPI |
	| EXE | Automation Program | Key Performance Indicators (KPIs) | KPI-0000 |
	
  @34750 @SubmittingProgramForApproval @InternalProgram @Program @Planning
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Internal Programs" inside side bar "Programs"
	When I click on flextable toggle to "Draft Internal Programs"
    When I perform quick search "<Quick Search Text>" on table "Programs"
    And I click on the "View" icon for the "<Quick Search Text>" 
    When I click on "Submit For Approval" button
    Then I see that "Internal Program" is in "Submitted for Approval" status
	
	Examples:
	| User | Quick Search Text |
	| EXE | Automation Program |
	
  @34752 @34754 @ProgramApproval @InternalProgram @Program @Planning
  Scenario Outline: Validate the assignment of Approvers for the Internal Program
	Given I login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login as "<Executive Approver>" User
    When I toggle to "As a Grantor" app
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    Then I see that "Internal Program" is in "Approved" status
	
	Examples:
	| Program Approver | Quick Search Text | Executive Approver |
	| PM | Automation Program | PM |
	
  @programHappyPath
  Scenario Outline: Verifying if the EXE, PM, PO has create access to Internal Program
    Given I login to "As a Grantor" app as "<User>" User
    When I navigate to "Planning" tab
    And I click "Internal Programs" inside side bar "Programs"
    When I click on "New" button on the flextable
    When I enter "RequiredForSave" values from "Program_Field_Values.xlsx"
    When I click on "Save and Continue" button
    When I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    When I click on "Save" button
    And I click on "Overview" subtab
    When I click on "Associate" button on "Contacts" flextable
    And I choose the "Contact" with "Automation EXE" and click "Add" button
    And I click on "Responsibilities" subtab
    When I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    And I fill in the "<Name>" for the Approver details
    When I click on the "Edit" icon for the "Executive Approver" on the flextable "Approvers"
    And I fill in the "<Name>" for the Approver details
	And I click on "Setup" subtab
	When I click on "Associate" button on "Objectives" flextable
    And I choose the "Objectives" with "SPN-0019" and click "Associate" button
    When I click on "Submit For Approval" button
    When I re-login as "<Program Approver>" User
	When I toggle to "As a Grantor" app
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    When I re-login as "<Executive Approver>" User
    When I toggle to "As a Grantor" app
	When I navigate to "Planning" tab
	And I click "Pending Tasks" inside side bar "MyTasks"
    When I perform quick search "<Quick Search Text>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Quick Search Text>" 
    When I click on "Approve" on the approval decision box
    Then I see that "Internal Program" is in "Approved" status
  
	Examples:
	| User | Name | Program Approver | Executive Approver | Quick Search Text |
	| EXE | Automation PM | PM | PM |  Automation Program |

	
	