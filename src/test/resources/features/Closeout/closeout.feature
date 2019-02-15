@closeout
Feature: Validate all scenarios in Closeout

	Background: Navigate to award
	Given I delete the record "Automation Announcement to be deleted Application" from the object "Closeout"
	And I login and view the record "Automation Announcement to be deleted Application" as "EXE"
	| Actions 			  | Step 1 	  	  | Step 2	 	 | Step 3  	 		    | Step 4 		  			   |
	| Owner Navigation 	  | As a Grantor  | Grants		 | Grants and Subawards | Grants, Awards & Amendments  |
	| Complete Review 	  | Active Grants | ActiveGrants | View 		  		| 			   				   |
	
    @creationOfAdhocCloseout @adhocCloseout @closeout @all
	Scenario: To create an Adhoc Closeout Request
	When I navigate to "Requests" sub tab
	And I click on top right button "New" in flex table with id "flexGridGrantorCloseOutRequest"
	When I enter "Creation" values from "Closeout_Field_Values.xlsx"
	And I click modal button "Save and Continue"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
	@editionOfCloseout @closeout @all
	Scenario: To edit a Closout Request
	Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	When I click on "Edit" in the page details
	And I enter "Edition" values from "Closeout_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
	@assigningApproversInCloseout @closeout @all
	Scenario: To assign approvers Closout Request
	Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "flexGridGrantorCloseoutRequestRolesAndResponsibilities"
    When I fill in the "Automation PM" for the Approver details
    And I switch to Parent frame
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "flexGridGrantorCloseoutRequestRolesAndResponsibilities"
    And I fill in the "Automation FO" for the Approver details
   	When I switch to Parent frame
    Then I see that "Automation PM" has been added in flextable with Id "flexGridGrantorCloseoutRequestRolesAndResponsibilities"
    
    @sendClosoutToSubrecipient @closeout @all
    Scenario: Send Closout Request to Subrecipient
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				     						  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  						  | 		|		    		  |
    | Approver 1 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit    | Program Approver    |
    | Approver 2 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit	| Fiscal Approver  	  |
    When I click on "Send To Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    
    @subrecipientEntersFielsInCloseout @closeout @all
    Scenario: Subrecipient enters closeout fields
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				     						  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  						  | 		|		    		  |
    | Approver 1 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit    | Program Approver    |
    | Approver 2 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit	| Fiscal Approver  	  |
    Given I click on "Send To Subrecipient" in the page details
	When User "SPI" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	When I click on "Edit" in the page details
	And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
	
	@subrecipientAcknowledgesCloseout @closeout @all
    Scenario: Subrecipient acknowledges the closeout
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				     						  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  						  | 		|		    		  |
    | Approver 1 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit    | Program Approver    |
    | Approver 2 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit	| Fiscal Approver  	  |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    When I click on "Acknowledge" in the page details
    Then I see that "Closeout View" is in "Acknowledged by Subrecipient" status 
    
    @overrideCloseout @closeout @all
    Scenario: Grant owner overrides the closeout
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				     						  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  						  | 		|		    		  |
    | Approver 1 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit    | Program Approver    |
    | Approver 2 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit	| Fiscal Approver  	  |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I click on "Acknowledge" in the page details
	When User "EXE" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Closeout 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	When I click on "Override" in the page details
	Then I see status in Progress-bar is "Overridden" and is "green"
	
	@submitCloseoutForApproval @closeout @all
    Scenario: Closeout is submitted for approval
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				     						  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  						  | 		|		    		  |
    | Approver 1 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit    | Program Approver    |
    | Approver 2 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit	| Fiscal Approver  	  |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I click on "Acknowledge" in the page details
	Given User "EXE" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Closeout 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I click on "Override" in the page details
	When I click on "Submit for Approval" in the page details
	Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    
    @approvalOfCloseout @adhocCloseoutHappyPath @closeout @all
    Scenario: Approval of Closeout
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		 | Step 2    	 	 			  |
	| Sub tab    | Requests 		 | 			  	 				  |
	| FlexTable  | New				 | flexGridGrantorCloseOutRequest |
	| Creation   | Save and Continue | Save							  | 
	| ID		 | EGMS ID			 |								  |
	And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				     						  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  						  | 		|		    		  |
    | Approver 1 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit    | Program Approver    |
    | Approver 2 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit	| Fiscal Approver  	  |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I click on "Acknowledge" in the page details
	Given User "EXE" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Closeout 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I click on "Override" in the page details
	And I click on "Submit for Approval" in the page details
	When "2" Approvers "PM,FO" approve the record "Record Id"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Closeout		 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	Then I see status in Progress-bar is "Completed" and is "green"
	
	@scheduledCloseoutHappyPath @closeout @all
    Scenario Outline: Happy path of Scheduled closeout
    Given User "EXE" receives the task for "<Grant Name>"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Closeout 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    Given I select "2" approvers "Automation PM,Automation FO"
    | Actions 	 | Step 1   				     						  | Step 2	| Step 3 			  |
    | Subtab	 | Responsibilities 			  						  | 		|		    		  |
    | Approver 1 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit    | Program Approver    |
    | Approver 2 | flexGridGrantorCloseoutRequestRolesAndResponsibilities | Edit	| Fiscal Approver  	  |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Monitoring 		 | Grants Portal | SUBPORTAL |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I click on "Acknowledge" in the page details
	Given User "EXE" receives the task for "Record Id"
	| Actions 	 | Step 1   		 | Step 2		 | Step 3    |
	| Navigation | Closeout 		 | As a Grantor  | QA		 |
	| Left Panel | Pending Tasks 	 | My Tasks 	 |			 |
	| FlexTable  | PhasePendingTasks | Start 		 |			 |
	And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
	Given I click on "Override" in the page details
	And I click on "Submit for Approval" in the page details
	When "2" Approvers "PM,FO" approve the record "Record Id"
	| Actions 	 | Step 1 	  	 | Step 2	 	 | Step 3  	 		 |
	| Navigation | As a Grantor  | Closeout		 | 				  	 |
	| FlexTable  | Pending Tasks | My Tasks  	 | PhasePendingTasks |
	| Approval 	 | Start 		 | Approve 		 | 					 |
	Then I see status in Progress-bar is "Completed" and is "green"
	
	Examples:
	| Grant Name 										|
	| Automation Announcement to be deleted Application |