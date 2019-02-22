@happyPath
Feature: Validate all scenarios Happy Path across all modules

    @programHappyPathStandAlone
  	Scenario Outline: Validate the Happy Path of Internal Program
  	Given I create a planning record as user "<Owner_user>" from sheet "Creation" in excel "Surya_Program_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 | Step 3 				    |
	| Navigation | As a Grantor		 | Planning  	 	 |	Programs				|
	| FlexTable  | Internal Programs | Programs 	 	 | Draft Internal Programs  |
	| Creation   | New				 | Save and Continue | Save						|
	| ID		 | EGMS ID			 |					 |							|
    And I complete the fields from the sheet "Edition" in excel "Surya_Program_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate "2" records "<Contact>,<Focusarea>"
    | Actions 	  | Step 1   | Step 2	 | Step 3  			  				  | Step 4 	  | Step 5  				 |
    | Associate 1 | Overview | Associate | ProgramContacts 				      | Add	  	  | AssociateProgramContacts |
    | Associate 2 | Setup	 | Associate | flexGridGrantorServiceAreasProgram | Add		  | SelectProgramServiceArea |
#    | Associate 3 | Setup 	 | Associate | RelatedProgramGoalsandObjectives   | Add	  	  | SelectGoals 		     |
#    | Associate 3 | Setup 	 | Associate | ProgramKeyOutcomes                 | Add	      | SelectProgramKPIs 	     |
    Given I select "2" approvers "<Program_approver>,<Executive_approver>"
    | Actions 	 | Step 1   				       | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			   | 		|		    		  |
    | Approver 1 | ProgramRolesAndResponsibilities | Edit   | Program Approver    |
    | Approver 2 | ProgramRolesAndResponsibilities | Edit	| Executive Approver  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "flexGridProgramChecklists" by clicking "Add" :
    | Description        		  | Required  | Applies To  | Status |
    | Automation test description | Mandatory | Application | Active |        
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "flexGridProgramChecklists"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal 
    Given I add an attachment "InternalOrganization_Field_Values.xlsx"
    | Actions 			    | Step 1 	  | Step 2	 		  | Step 3 			   |	
    | Attachment Navigation | Attachments | Add				  | a150b000003epY5AAI |
    | Attachment Details    | Attachment  | Program Artifacts | 				   |
    And I click on "Submit For Approval" in the page details
    Given "2" Approvers "<Program_user>,<Executive_user>" approve the record "Record Id"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Planning		 | 				  	 |
	| FlexTable  | Pending Tasks | MyTasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
    And I re-login to "As a Grantor" app as "<Owner_user>" user on "QA" portal
	When I navigate to "Planning" tab
	And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
	And I click toggle button to select "Draft Internal Programs"
    And I perform quick search for "Record Id" in "Programs" panel
    When I click on "View" icon for "Approved" inside table
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
	Examples:
	| Owner_user | Program_name  | Focusarea | Goals    | Kpi      | Contact   | Program_approver | Executive_approver | Program_user |  Executive_user |
	| OSCAR PM   | Youth Program | 02106     | SPO-0087 | KPI-0538 | George PM | Cathy PM         | Tommy EXE          | CATHY PM     | TOMMY EXE       |




