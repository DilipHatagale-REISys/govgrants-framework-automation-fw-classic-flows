@siteVisit
Feature: Validate all scenarios in the Site Visit

	Background: Create Program
	Given I login and view the award "AD-AuGr--01" with name "Automation Announcement to be deleted Application" as User "Exe"
	And I create a post award record from sheet "Creation" in excel "SiteVisit_Field_Values.xlsx"
	| Actions 	 | Step 1 	   		   | Step 2    	 | Step 3 				   |
	| Navigation | Management		   | 			 |						   |
	| FlexTable  | Initiate Site Visit | Site Visits | GrantorSiteVisitsAward  |
	| Creation   | Save And Close	   |	Save	 | 						   |

	@siteVisitCreation @siteVisit
	Scenario: Creation of Site Visit
    Then I see that "Created" status is in "green" on progress bar
	
	@siteVisitEdition @siteVisit
	Scenario: Edition of Site Visit
	When I click on "Edit" button
	And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
	When I click on "Save" button
	Then I see that "Created" status is in "green" on progress bar
	
	@participantAssociationSiteVisit @siteVisit
	Scenario Outline: Participant Association of Site Visit
	When I click on "Overview" subtab
	And I click on "Associate" button on "Participants" flextable with Id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "<Subrecipient>" in the table "popupflextable"
    And I close Modal
    Then I see that "<Subrecipient>" has been added in flextable "Participants" with Id "GrantorSiteVisitContacts"
	Examples:
	| Subrecipient   |
	| Automation SPI |
	
	@approverSelectionSiteVisit @siteVisit
	Scenario Outline: Approver selection of Site Visit
	When I click on "Responsibilities" subtab
    And I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    When I fill in the "<Program Approver Name>" for the Approver details
    And I close Modal
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "Approvers"
    And I fill in the "<Fiscal Approver Name>" for the Approver details
   	When I close Modal
    Then I see that "<Program Approver Name>" has been added in flextable "Approvers" with Id "GrantorSiteVisitRolesandResponsibilities"
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
	And I click on "Notify" button
	Then I see that "Notified" status is in "green" on progress bar
	
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
	And I click on "Notify" button
	When I re-login to Grants Portal as "SPI"
	And I navigate to "Monitoring" tab
	When I click "Pending Tasks" inside side bar "My Tasks"
	And I perform quick search "<Site Visit Name>" on table "PhasePendingTasks"
	When I click on the "Start" icon for the "<Site Visit Name>"
	Then I see that "Notified" status is in "green" on progress bar
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
	And I click on "Notify" button
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	When I re-login to "As a Grantor" app as "EXE" User
	And I navigate to "Monitoring" tab
	When I click "Manage Site Visits" inside side bar "Monitoring Activities"
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I click on the "View" icon for the "<Site Visit Name>"
	When I click on "Conduct" button
	Then I see that "In Progress" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@formFillingSiteVisit @siteVisit
	Scenario Outline: Filling up of form in Site Visit
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
	And I click on "Notify" button
	Given Subrecipient "SPI" receives the task for "<Site Visit Name>"
	| Actions 	 | Step 1   		 | Step 2	|
	| Navigation | Monitoring 		 | 			|
	| Left Panel | Pending Tasks 	 | My Tasks |
	| FlexTable  | PhasePendingTasks | Start 	|
	And I re-login as "EXE" to view the monitoring record "<Site Visit Name>" for the award "Award Name"
	| Actions 	 | Step 1   		 			     | Step 2		  		  |
	| Navigation | As a Grantor 	  				 | Monitoring 			  |
	| Left Panel | Manage Site Visits 				 | Monitoring Activities  |
	| FlexTable  | Site Visits for Active Grants	 | View				   	  |
	When I click on "Conduct" button
	And I click on "Reports and Outcomes" subtab
	When I click on the "Edit" icon for the "General Review Form" on the flextable "<FlexTable Name>"
	When I fill in the form
	And I click on "Save" button
	When I click on "Back" button
	And I click on "Validate" button on "<FlexTable Name>" flextable with Id "FormComponent"
	Then I see that "100.00%" has been added in flextable "<FlexTable Name>" with Id "FormComponent"
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    | FlexTable Name |
	| Automation Announcement to be deleted Application | Automation Site Visit | Review Forms	 |