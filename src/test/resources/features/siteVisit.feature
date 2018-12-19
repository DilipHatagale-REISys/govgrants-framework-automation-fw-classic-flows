@siteVisit
Feature: Validate all scenarios in the Site Visit

	#Background: Create Program
	#Given I login and view the award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "EXE"
	#And I create a post award record from sheet "Creation" in excel "SiteVisit_Field_Values.xlsx"
	#| Actions 	 | Step 1 	   		   | Step 2    	 |
	#| Navigation | Management		   | 			 |	
	#| FlexTable  | Initiate Site Visit| GrantorSiteVisitsAward  |
	#| Creation   | Save And Close	   | Cancel		 | 	

	@siteVisitCreation @siteVisit
	Scenario: Creation of Site Visit
    Then I see status in Progress-bar is "Created" and is "green"
	
	@siteVisitEdition @siteVisit
	Scenario: Edition of Site Visit
	When I click on "Edit" in the page details
	And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
	@participantAssociationSiteVisit @siteVisit
	Scenario Outline: Participant Association of Site Visit
	When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "<Subrecipient>" in the table "popupflextable"
    And I close Modal
    Then I see that "<Subrecipient>" has been added in flextable with Id "GrantorSiteVisitContacts"
	Examples:
	| Subrecipient   |
	| Automation SPI |
	
	@approverSelectionSiteVisit @siteVisit
	Scenario Outline: Approver selection of Site Visit
	When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "GrantorSiteVisitRolesandResponsibilities"
    When I fill in the "<Program Approver Name>" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "GrantorSiteVisitRolesandResponsibilities"
    And I fill in the "<Fiscal Approver Name>" for the Approver details
   	When I close Modal
    Then I see that "<Program Approver Name>" has been added in flextable with Id "GrantorSiteVisitRolesandResponsibilities"
	Examples:
	| Program Approver Name | Fiscal Approver Name |
	| Automation PM         | Automation FO        |
	
	@notifySubrecipientSiteVisit @siteVisit
	Scenario: Notify Subrecipient about the Site Visit
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    | Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	Then I see status in Progress-bar is "Notified" and is "green"
	
	@notifyPendingTaskForSubrecipientSiteVisit @siteVisit
	Scenario Outline: Subrecipient pending task check for Site Visit
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    | Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	When I re-login to Grants Portal as "SPI"
	And I navigate to "Monitoring" tab
	When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
	And I perform quick search "<Site Visit Name>" on table "PhasePendingTasks"
	When I click on the "Start" icon for the "<Site Visit Name>"
	Then I see status in Progress-bar is "Notified" and is "green"
	Examples:
	| Site Visit Name	    |
	| Automation Site Visit |
	
	@conductSiteVisit @siteVisit
	Scenario Outline: Conduct Site Visit
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    | Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	When I re-login to "As a Grantor" app as "EXE" User
	And I navigate to "Monitoring" tab
	When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I click on the "View" icon for the "<Site Visit Name>"
	When I click on "Conduct" in the page details
	Then I see status in Progress-bar is "In Progress" and is "green"
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@addingOutcomeSiteVisit @siteVisit
	Scenario Outline: Adding outcomes to Site Visit
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    | Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	When I re-login to "As a Grantor" app as "EXE" User
	And I navigate to "Monitoring" tab
	When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I click on the "View" icon for the "<Site Visit Name>"
	When I click on "Conduct" in the page details
	And I navigate to "Reports and Outcomes" sub tab
	When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
    | Title       		 	 | Description  	 	  | Type    	   |
    | Automation Finding 	 | Automation Description | Finding		   |
    | Automation Concern 	 | Automation Description | Concern 	   |
    | Automation Observation | Automation Description | Observation    |
	Then I see that "Automation Observation" has been added in flextable with Id "FormComponent"
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@formFillingSiteVisit @siteVisit
	Scenario: Filling up of form in Site Visit
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  				    | Step 4 	| Step 5         |
    | Participant | Overview | Associate | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	And I re-login as "EXE" to view the monitoring record "<Site Visit Name>" for the award "<Award Name>" with Id "<Award EGMS ID>"
	| Actions 	 | Step 1   		 			     | Step 2		  		  			|
	| Navigation | As a Grantor 	  				 | Monitoring 			 			|
	| Left Panel | Manage Site Visits 				 | Monitoring Activities  			|
	| FlexTable  | Site Visits for Active Grants	 | inlineEditGridSiteVisitsGridView	|
	| Button 	 | View								 | 						            |
	When I click on "Conduct" in the page details
	And I navigate to "Reports and Outcomes" sub tab
	When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
    | Title       		 	 | Description  	 	  | Type    	   |
    | Automation Finding 	 | Automation Description | Finding		   |
    | Automation Concern 	 | Automation Description | Concern 	   |
    | Automation Observation | Automation Description | Observation    |
	And I navigate to "Reports and Outcomes" sub tab
	When I click on "Edit" icon for "General Review Form" inside flex table with id "FormComponent"
	When I complete filling up the standard form
	And I click on "Save" in the page details
	When I click on "Back" in the page details
	And I click on top right button "Validate" in flex table with id "FormComponent"
	Then I see that "100.00%" has been added in flextable with Id "FormComponent"
	
	@submittingForApprovalSiteVisit @siteVisit
	Scenario: Submitting Site Visit for approval
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    | Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	And I re-login as "EXE" to view the monitoring record "<Site Visit Name>" for the award "<Award Name>" with Id "<Award EGMS ID>"
	| Actions 	 | Step 1   		 			     | Step 2		  		  			|
	| Navigation | As a Grantor 	  				 | Monitoring 			 			|
	| Left Panel | Manage Site Visits 				 | Monitoring Activities  			|
	| FlexTable  | Site Visits for Active Grants	 | inlineEditGridSiteVisitsGridView	|
	| Button 	 | View								 | 						            |
	Given I click on "Conduct" in the page details
	And I navigate to "Reports and Outcomes" sub tab
	When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
    | Title       		 	 | Description  	 	  | Type    	   |
    | Automation Finding 	 | Automation Description | Finding		   |
    | Automation Concern 	 | Automation Description | Concern 	   |
    | Automation Observation | Automation Description | Observation    |
	And I fill in the form "General Review Form"
	| Actions 	  | Step 1   		 	 | Step 2		 |
	| Navigation  | Reports and Outcomes | 			 	 |
	| FlexTable   | Edit				 | Review Forms  |
	| Form Button | Save				 | Back 		 |
	| Validation  | Validate			 | FormComponent |
	When I click on "Submit for Approval" in the page details
	Then I see status in Progress-bar is "Submitted for Approval" and is "green"
	
	@approvalOfSiteVisit @siteVisit
	Scenario Outline: Approval of Site Visit
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    | Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	And I re-login as "EXE" to view the monitoring record "<Site Visit Name>" for the award "<Award Name>" with Id "<Award EGMS ID>"
	| Actions 	 | Step 1   		 			     | Step 2		  		  			|
	| Navigation | As a Grantor 	  				 | Monitoring 			 			|
	| Left Panel | Manage Site Visits 				 | Monitoring Activities  			|
	| FlexTable  | Site Visits for Active Grants	 | inlineEditGridSiteVisitsGridView	|
	| Button 	 | View								 | 						            |
	Given I click on "Conduct" in the page details
	And I navigate to "Reports and Outcomes" sub tab
	When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
    | Title       		 	 | Description  	 	  | Type    	   |
    | Automation Finding 	 | Automation Description | Finding		   |
    | Automation Concern 	 | Automation Description | Concern 	   |
    | Automation Observation | Automation Description | Observation    |
	And I fill in the form "General Review Form"
	| Actions 	  | Step 1   		 	 | Step 2		 |
	| Navigation  | Reports and Outcomes | 			 	 |
	| FlexTable   | Edit				 | Review Forms  |
	| Form Button | Save				 | Back 		 |
	| Validation  | Validate			 | FormComponent |
	When I click on "Submit for Approval" in the page details
	Given I login to "As a Grantor" app as "PM" User
	When I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search "<Site Visit Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Site Visit Name>" 
    When I click on "Approve" on the approval decision box
    And I login to "As a Grantor" app as "FO" User
	When I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search "<Site Visit Name>" on table "PhasePendingTasks"
    And I click on the "Start" icon for the "<Site Visit Name>" 
    When I click on "Approve" on the approval decision box
	Then I see status in Progress-bar is "Approved" and is "green"
	Examples:
	| Site Visit Name	    |
	| Automation Site Visit |
	
	@siteVisitSendToSubrecipient @siteVisit
	Scenario Outline: Send Site Visit to Subrecipient
	Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    | Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate Participant "Automation EXE"
    | Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    | Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    Given I select two approvers "Automation PM", "Automation FO"
    | Actions 	 | Step 1   		| Step 2		   | Step 3    |
    | Subtab	 | Responsibilities | 				   |		   |
    | Approver 1 | Edit				| Program Approver | Approvers |
    | Approver 2 | Edit				| Fiscal Approver  | Approvers |
	And I click on "Notify" in the page details
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	And I re-login as "EXE" to view the monitoring record "<Site Visit Name>" for the award "<Award Name>" with Id "<Award EGMS ID>"
	| Actions 	 | Step 1   		 			     | Step 2		  		  			|
	| Navigation | As a Grantor 	  				 | Monitoring 			 			|
	| Left Panel | Manage Site Visits 				 | Monitoring Activities  			|
	| FlexTable  | Site Visits for Active Grants	 | inlineEditGridSiteVisitsGridView	|
	| Button 	 | View								 | 						            |
	Given I click on "Conduct" in the page details
	And I navigate to "Reports and Outcomes" sub tab
	When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGrid" by clicking "New" :
    | Title       		 	 | Description  	 	  | Type    	   |
    | Automation Finding 	 | Automation Description | Finding		   |
    | Automation Concern 	 | Automation Description | Concern 	   |
    | Automation Observation | Automation Description | Observation    |
	And I fill in the form "General Review Form"
	| Actions 	  | Step 1   		 	 | Step 2		 |
	| Navigation  | Reports and Outcomes | 			 	 |
	| FlexTable   | Edit				 | Review Forms  |
	| Form Button | Save				 | Back 		 |
	| Validation  | Validate			 | FormComponent |
	Given Two Approvers "PM", "FO" approve "<Site Visit Name>"
    | Actions 		   | Step 1 	   | Step 2	    | Step 3 			  |
    | Navigation       | As a Grantor  | Monitoring |					  |
    | Pending Task 	   | Pending Tasks | My Tasks   | PhasePendingTasks   |
    | Approval Buttons | Start		   | Approve    |					  |
    When I re-login to "As a Grantor" app as "EXE" User
	And I navigate to "Monitoring" tab
	When I navigate to "Manage Site Visits" content inside "Monitoring Activities" subheader on left panel
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I perform quick search for "<Site Visit Name>" for the parent value "AD-AuGr--01" on grid "inlineEditGridSiteVisitsGridView"
	When I click on the "View" icon for the "<Site Visit Name>"
	And I click on "Send to Subrecipient" in the page details
	Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@siteVisitCorrectiveActionsBySubrecipient @siteVisit
	Scenario Outline: Send Site Visit to Subrecipient
	#Given I complete the fields from the sheet "Edition" in excel "SiteVisit_Field_Values.xlsx"
    #| Actions 		  | Step 1 | Step 2	|
    #| Edition Buttons | Edit   | Save   |
    #And I associate Participant "Automation EXE"
    #| Actions 	  | Step 1   | Step 2	 | Step 3  		| Step 4 		 		   | Step 5    | Step 6 		|
    #| Participant | Overview | Associate | Participants | GrantorSiteVisitContacts | Associate | popupflextable |
    #Given I select two approvers "Automation PM", "Automation FO"
    #| Actions 	 | Step 1   		| Step 2		   | Step 3    |
    #| Subtab	 | Responsibilities | 				   |		   |
    #| Approver 1 | Edit				| Program Approver | Approvers |
    #| Approver 2 | Edit				| Fiscal Approver  | Approvers |
	#And I click on "Notify" button
	#Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	#| Actions 	 | Step 1   		 | Step 2	|
	#| Navigation | Monitoring 		 | 			|
	#| Left Panel | Pending Tasks 	 | My Tasks |
	#| FlexTable  | PhasePendingTasks | Start 	|
	#And I re-login as "EXE" to view the monitoring record "<Site Visit Name>" for the award "<Award Name>" with Id "<Award EGMS ID>"
	#| Actions 	 | Step 1   		 			     | Step 2		  		  			|
	#| Navigation | As a Grantor 	  				 | Monitoring 			 			|
	#| Left Panel | Manage Site Visits 				 | Monitoring Activities  			|
	#| FlexTable  | Site Visits for Active Grants	 | inlineEditGridSiteVisitsGridView	|
	#| Button 	 | View								 | 						            |
	#Given I click on "Conduct" button
	#And I fill in the form "General Review Form"
	#| Actions 	  | Step 1   		 	 | Step 2		 |
	#| Navigation  | Reports and Outcomes | 			 	 |
	#| FlexTable   | Edit				 | Review Forms  |
	#| Form Button | Save				 | Back 		 |
	#| Validation  | Validate			 | FormComponent |
	#Given Two Approvers "PM", "FO" approve "<Site Visit Name>"
    #| Actions 		   | Step 1 	   | Step 2	    | Step 3 			  |
    #| Navigation       | As a Grantor  | Monitoring |					  |
    #| Pending Task 	   | Pending Tasks | My Tasks   | PhasePendingTasks   |
    #| Approval Buttons | Start		   | Approve    |					  |
    #And I re-login as "EXE" to view the monitoring record "<Site Visit Name>" for the award "<Award Name>" with Id "<Award EGMS ID>"
	#| Actions 	 | Step 1   		 			     | Step 2		  		  			|
	#| Navigation | As a Grantor 	  				 | Monitoring 			 			|
	#| Left Panel | Manage Site Visits 				 | Monitoring Activities  			|
	#| FlexTable  | Site Visits for Active Grants	 | inlineEditGridSiteVisitsGridView	|
	#| Button 	 | View								 | 						            |
	#Given I click on "Send to Subrecipient" button
	#When Subrecipient "SPI" receives the task for "<Site Visit Name>"
	#| Actions 	 | Step 1   		 | Step 2	|
	#| Navigation | Monitoring 		 | 			|
	#| Left Panel | Pending Tasks 	 | My Tasks |
	#| FlexTable  | PhasePendingTasks | Start 	|
	#When I re-login to Grants Portal as "SPI"
	Given I login to "Grants Portal" app as "SPI" User
	When I navigate to "Monitoring" tab
	And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
	When I perform quick search "<Site Visit Name>" on table "PhasePendingTasks"
	And I click on the "Start" icon for the "<Site Visit Name>"
    When I navigate to "Reports and Outcomes" sub tab
    When I expand the "Automation Observation" on grid "Outcomes"
    When I enter the following values into flex table with id "inlineEditGridGrantorSiteVisitFindingsGridRecipient" by clicking "New" :
    | Description            | Required  | Applies To  |
    | Automation test description | Mandatory | Application |
    
	Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
	Examples:
	| Award Name 				     	    	    	| Award EGMS ID | Site Visit Name	    |
	| Automation Announcement to be deleted Application | AD-AuGr--01   | Automation Site Visit |
	
	