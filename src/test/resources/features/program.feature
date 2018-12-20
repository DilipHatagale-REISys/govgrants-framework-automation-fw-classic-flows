@program
Feature: Validate all scenarios for program

	Background: Create Program
	Given I create a program as user "EXE" from sheet "RequiredForSave" in excel "Program_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	  | Step 3 				    |
	| Navigation | As a Grantor		 | Planning  	  |	Programs				|
	| FlexTable  | Internal Programs | Programs 	  | Draft Internal Programs |
	| Creation   | New				 | Save And Close | Save					|
	
  	@34730 @programListView @program
  	Scenario Outline: Verifying if the EXE,PM,PO has access to Internal Programs list view
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button for "<Program flextable Header>"
    Then I see that the status is "<Program Status>"
    Examples:
    | Program flextable Header | Program Status |
    | Draft Internal Programs  | Created  	    |
  
  	@34503 @programCreation @program
  	Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
  	Then I see status in Progress-bar is "Created" and is "green"
    
  	@34731 @programEdition @program
  	Scenario: Verifying if the EXE, PM, PO has create access to Internal Program
    When I click on "Edit" in the page details
    And I enter "RequiredForSubmit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    
  	@34732 @programContactsAssociation @program
  	Scenario Outline: Verifying if the EXE, PM, PO can associate contact with Internal Program
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "ProgramContacts"
    When I click "Add" after selection of "<Contact>" in the table "AssociateProgramContacts"
    And I close Modal
    Then I see that "<Contact>" has been added in flextable with Id "ProgramContacts"
    Examples:
    | Contact		  |
    | Automation EXE  |
    
  	@34740 @programApproverSelection @program
  	Scenario Outline: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "ProgramRolesAndResponsibilities"
    When I fill in the "<Program Approver Name>" for the Approver details
    And I switch to Parent frame
    When I click on "Edit" icon for "Executive Approver" inside flex table with id "ProgramRolesAndResponsibilities"
    And I fill in the "<Executive Approver Name>" for the Approver details
   	When I switch to Parent frame
    Then I see that "<Program Approver Name>" has been added in flextable with Id "ProgramRolesAndResponsibilities"
	Examples:
	| Program Approver Name | Executive Approver Name |
	| Automation PM         | Automation EXE          |
	
  	@34616 @programFocusAreaAssociation @program
  	Scenario Outline: Validate the association of Focus Area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridGrantorServiceAreasProgram"
    When I click "Associate" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "flexGridGrantorServiceAreasProgram"
	Examples:
	| EGMS Id |
	| 00005   |
	
  	@34737 @programObjectiveAssociation @program
  	Scenario Outline: Validate the Association of Objective to the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "RelatedProgramGoalsandObjectives"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "RelatedProgramGoalsandObjectives"
	Examples:
	| EGMS Id  |
	| SPO-0006 |
	
  	@34738 @programKPIAssociation @program
  	Scenario Outline: Validate the assignment of Approvers for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "ProgramKeyOutcomes"
    When I click "Add" after selection of "<EGMS Id>" in the table "popupflextable"
    And I close Modal
    Then I see that "<EGMS Id>" has been added in flextable with Id "ProgramKeyOutcomes"
	Examples:
	| EGMS Id  |
	| KPI-0005 |
	
  	@34745 @programAttachmentChecklist @program
  	Scenario: Validate the attachment checklist for the Internal Program
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "flexGridProgramChecklists" by clicking "Add" :
    | Description        		  | Required  | Applies To  |
    | Automation test description | Mandatory | Application |     
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "flexGridProgramChecklists"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close Modal 
    Then I see that "Active" has been added in flextable with Id "flexGridProgramChecklists"
    
  	@34746 @programAddAttachment @program
  	Scenario: Validate the attachment for the Internal Program
    When I navigate to "Attachments" sub tab
    And I click on "Add" button on " Attachments" flextable to switch to frame
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Program Artifacts"
    And I close Modal 
    Then I see that "Program Artifacts" has been added in flextable with Id "a150b000003epC4AAI"

  	@34750 @submittingProgramForApproval @program
  	Scenario: Validate the submission of Program for Approval
    Given I complete the fields from the sheet "RequiredForSubmit" in excel "Program_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Contact "Automation EXE", Focus Area "00005", Objective "SPO-0006"
    | Actions 	 | Step 1   | Step 2	| Step 3  			  				 | Step 4 	 | Step 5  				    |
    | Contact    | Overview | Associate | ProgramContacts 				     | Add	  	 | AssociateProgramContacts |
    | Focus Area | Setup	| Associate | flexGridGrantorServiceAreasProgram | Associate | popupflextable 		    |
    | Objective  | Setup 	| Associate | RelatedProgramGoalsandObjectives   | Add	  	 | popupflextable 		    |
    Given I select two approvers "Automation PM", "Automation EXE"
    | Actions 	 | Step 1   		| Step 2		     | Step 3    |
    | Subtab	 | Responsibilities | 				     |		     |
    | Approver 1 | Edit				| Program Approver   | Approvers |
    | Approver 2 | Edit				| Executive Approver | Approvers |
    And I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       | Step 2	    	  | Step 3 					   	  	|
	| Checklist Navigation | Setup		      		   |   		   		  |						  		    |
	| Checklist FlexTable  | flexGridProgramChecklists | Add	   		  |   							   	|
	| Upload Modal  	   | Upload Template		   | Not Applicable   | Supporting Documents Checklist 	|
	| Upload file     	   | Checklist 				   | Program 		  |									|
	| Inline Column Title  | Description       	  	   | Required  	  	  | Applies To  			       	|
    | Inline values 	   | Automation Description    | Mandatory	      | Application     		       	|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  |
    | Attachment Navigation | Attachments | Add				  |
    | Attachment Details    | Attachment  | Program Artifacts |
    When I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	
  	@34752 @34754 @programApproval @program
  	Scenario Outline: Validate the approval of Internal Program
    Given I complete the fields from the sheet "RequiredForSubmit" in excel "Program_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Contact "Automation EXE", Focus Area "00005", Objective "SPO-0006"
    | Actions 	 | Step 1   | Step 2	| Step 3  			  				 | Step 4 	 | Step 5  				    |
    | Contact    | Overview | Associate | ProgramContacts 				     | Add	  	 | AssociateProgramContacts |
    | Focus Area | Setup	| Associate | flexGridGrantorServiceAreasProgram | Associate | popupflextable 		    |
    | Objective  | Setup 	| Associate | RelatedProgramGoalsandObjectives   | Add	  	 | popupflextable 		    |
    Given I select two approvers "Automation PM", "Automation EXE"
    | Actions 	 | Step 1   		| Step 2		     | Step 3    |
    | Subtab	 | Responsibilities | 				     |		     |
    | Approver 1 | Edit				| Program Approver   | Approvers |
    | Approver 2 | Edit				| Executive Approver | Approvers |
    And I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       | Step 2	    	  | Step 3 					   	  	|
	| Checklist Navigation | Setup		      		   |   		   		  |						  		    |
	| Checklist FlexTable  | flexGridProgramChecklists | Add	   		  |   							   	|
	| Upload Modal  	   | Upload Template		   | Not Applicable   | Supporting Documents Checklist 	|
	| Upload file     	   | Checklist 				   | Program 		  |									|
	| Inline Column Title  | Description       	  	   | Required  	  	  | Applies To  			       	|
    | Inline values 	   | Automation Description    | Mandatory	      | Application     		       	|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  |
    | Attachment Navigation | Attachments | Add				  |
    | Attachment Details    | Attachment  | Program Artifacts |
    And I click on "Submit For Approval" in the page details
	Given I re-login to "As a Grantor" app as "<Program Approver>" User
	When I navigate to "Planning" tab
	And I navigate to "Pending Tasks" content inside "MyTasks" subheader on left panel
    When I perform quick search for "<Program Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Program Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "<Executive Approver>" User
	When I navigate to "Planning" tab
	And I navigate to "Pending Tasks" content inside "MyTasks" subheader on left panel
    When I perform quick search for "<Program Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Program Name>" inside table 
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
	Examples:
	| Program Approver | Program Name		  			  | Executive Approver |
	| PM               | Automation Program to be deleted | EXE			  	   |
	
  	@34756 @programActivation @programHappyPath @program
  	Scenario Outline: Validate the activation of Internal Program
    Given I complete the fields from the sheet "RequiredForSubmit" in excel "Program_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Contact "Automation EXE", Focus Area "00005", Objective "SPO-0006"
    | Actions 	 | Step 1   | Step 2	| Step 3  			  				 | Step 4 	 | Step 5  				    |
    | Contact    | Overview | Associate | ProgramContacts 				     | Add	  	 | AssociateProgramContacts |
    | Focus Area | Setup	| Associate | flexGridGrantorServiceAreasProgram | Associate | popupflextable 		    |
    | Objective  | Setup 	| Associate | RelatedProgramGoalsandObjectives   | Add	  	 | popupflextable 		    |
    Given I select two approvers "Automation PM", "Automation EXE"
    | Actions 	 | Step 1   		| Step 2		     | Step 3    |
    | Subtab	 | Responsibilities | 				     |		     |
    | Approver 1 | Edit				| Program Approver   | Approvers |
    | Approver 2 | Edit				| Executive Approver | Approvers |
    And I add an attachment checklist to upload the file "Program_Field_Values.xlsx"
    | Actions 			   | Step 1 	   		       | Step 2	    	  | Step 3 					   	  	|
    | Inline Column Title  | Description       	  	   | Required  	  	  | Applies To  			       	|
    | Inline values 	   | Automation Description    | Mandatory	      | Application     		       	|
	| Checklist Navigation | Setup		      		   |   		   		  |						  		    |
	| Checklist FlexTable  | flexGridProgramChecklists | Add	   		  |   							   	|
	| Upload Modal  	   | Upload Template		   | Not Applicable   | Supporting Documents Checklist 	|
	| Upload file     	   | Checklist 				   | Program 		  |									|
    Given I add an attachment "InternalOrganization_Field_Values.xlsx" in the flextable " Attachments"
    | Actions 			    | Step 1 	  | Step 2	 		  |
    | Attachment Navigation | Attachments | Add				  |
    | Attachment Details    | Attachment  | Program Artifacts |
    And I click on "Submit For Approval" in the page details
    Given Two Approvers "PM", "EXE" approve "<Program Name>"
    | Actions 		   | Step 1 	   | Step 2	  | Step 3 			  |
    | Navigation       | As a Grantor  | Planning |					  |
    | Pending Task 	   | Pending Tasks | MyTasks  | PhasePendingTasks |
    | Approval Buttons | Start		   | Approve  |					  |
    And I re-login to "As a Grantor" app as "<User>" User
	When I navigate to "Planning" tab
	And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
	When I click toggle button for "Draft Internal Programs"
    And I perform quick search for "<Program Name>" in "Programs" panel
    When I click on "View" icon for "<Program Name>" inside table 
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
	Examples:
	| User | Program Name  			  |
	| EXE  | Automation Program Dec10 |