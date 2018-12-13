@siteVisit
Feature: Validate all scenarios in the Site Visit

	@siteVisitCreation @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Grants" tab
	And I click "Grants and Subawards" inside side bar "Grants, Awards & Amendments"
	When I toggle to "Draft Grants"
	And I perform quick search "<Award Name>" on table "ActiveGrants"
	When I click on the "View" icon for the "<Award Name>"
	And I click on "Subawards" subtab
	When I click on the "View" icon for the "<Award EGMS Id>" on the flextable "Subawards"
	And I click on "Management" subtab
	When I click on "Initiate Site Visit" button on "<Flextable Name>" flextable with Id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save And Close" button in the modal
    And I click on "Save" button
    Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Award EGMS Id | Flextable Name |
	| Automation Announcement to be deleted Application | AD-AuGr--01   | Site Visits    |
	
	@siteVisitEdition @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Monitoring" tab
	And I click "Manage Site Visits" inside side bar "Monitoring Activities"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I click on the "View" icon for the "<Site Visit Name>"
	And I click on "Edit" button
	And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
	And I click on "Save" button
	Then I see that "Created" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@participantAssociationSiteVisit @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Monitoring" tab
	And I click "Manage Site Visits" inside side bar "Monitoring Activities"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I click on the "View" icon for the "<Site Visit Name>"
	And I click on "Overview" subtab
	And I click on "Associate" button on "Participants" flextable with Id "GrantorSiteVisitContacts"
    When I click "Associate" after selection of "<Subrecipient>" in the table "popupflextable"
    And I close Modal
    Then I see that "<Subrecipient>" has been added in flextable "Participants" with Id "GrantorSiteVisitContacts"
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    | Subrecipient   |
	| Automation Announcement to be deleted Application | Automation Site Visit | Automation SPI |
	
	@approverSelectionSiteVisit @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Monitoring" tab
	And I click "Manage Site Visits" inside side bar "Monitoring Activities"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I click on the "View" icon for the "<Site Visit Name>"
	When I click on "Responsibilities" subtab
    And I click on the "Edit" icon for the "Program Approver" on the flextable "Approvers"
    When I fill in the "<Program Approver Name>" for the Approver details
    And I close Modal
    When I click on the "Edit" icon for the "Fiscal Approver" on the flextable "Approvers"
    And I fill in the "<Fiscal Approver Name>" for the Approver details
   	And I close Modal
    Then I see that "<Program Approver Name>" has been added in flextable "Approvers" with Id "GrantorSiteVisitRolesandResponsibilities"
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    | Program Approver Name | Fiscal Approver Name |
	| Automation Announcement to be deleted Application | Automation Site Visit | Automation PM         | Automation FO        |
	
	@notifySubrecipientSiteVisit @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Monitoring" tab
	And I click "Manage Site Visits" inside side bar "Monitoring Activities"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I click on the "View" icon for the "<Site Visit Name>"
	And I click on "Notify" button
	Then I see that "Notified" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@notifyPendingTaskForSubrecipientSiteVisit @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "Grants Portal" app as "SPI" User
	When I navigate to "Monitoring" tab
	And I click "Pending Tasks" inside side bar "My Tasks"
	And I perform quick search "<Site Visit Name>" on table "PhasePendingTasks"
	When I click on the "Start" icon for the "<Site Visit Name>"
	Then I see that "Notified" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@conductSiteVisit @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Monitoring" tab
	And I click "Manage Site Visits" inside side bar "Monitoring Activities"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I click on the "View" icon for the "<Site Visit Name>"
	And I click on "Conduct" button
	Then I see that "In Progress" status is in "green" on progress bar
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    |
	| Automation Announcement to be deleted Application | Automation Site Visit |
	
	@formFillingSiteVisit @siteVisit
	Scenario Outline: Creation of Site Visit
	Given I login to "As a Grantor" app as "EXE" User
	When I navigate to "Monitoring" tab
	And I click "Manage Site Visits" inside side bar "Monitoring Activities"
	When I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	And I expand the "<Award Name>" on grid "Site Visits for Active Grants"
	When I click on the "View" icon for the "<Site Visit Name>"
	And I click on "Reports and Outcomes" subtab
	When I click on the "Edit" icon for the "General Review Form" on the flextable "<FlexTable Name>"
	
	Examples:
	| Award Name 				     	    	    	| Site Visit Name	    | FlexTable Name |
	| Automation Announcement to be deleted Application | Automation Site Visit | Review Forms	 |