@organizationalSiteVisit @regression
Feature: Validate all scenarios in the Site Visit

  Background: Creation of Organizational Site Visit
    Given I delete the record "Automation Site Visit Org level" from the object "Site Visit"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table

@51078 @organizationalSiteVisitCreation @smoke 
Scenario: Validate the Site Visit is in created status. 
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
    When I click modal button "Save and Continue"
	Then I see status in Progress-bar is "Created" and is "green" 

@51079 @organizationalsiteVisitEdition 
Scenario: Edition of Site Visit 
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
   When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	Then I see status in Progress-bar is "Created" and is "green" 

@51080 @participantAssociationOrganizationalSiteVisit @smoke 
Scenario Outline: Participant Association of Organizational Site Visit 
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details 
	When I navigate to "Overview" sub tab 
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts" 
	When I click "Associate" after selection of "<Subrecipient>" in the table "SelectSiteDeskReviewContacts" 
	And I close Modal 
	Then I see that "<Subrecipient>" has been added in flextable with Id "GrantorSiteVisitOrganizationContacts" 
	Examples: 
		| Subrecipient   |
		| Automation SPI |
	
@54210 @monitoringTypeSiteVisitFiscal @deepika
Scenario: Validate the Monitoring type 'Fiscal' for Organizational Site Visit 
	Given I navigate to "Related Log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Fiscal" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	Then I see field "Monitoring Type" as "Fiscal"

	
 @54290 @monitoringTypeSiteVisitProgram @deepika
Scenario: Validate the Monitoring type 'Program' for Organizational Site Visit 
	Given I navigate to "Related Log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Program" values from "Organizational_SiteVisit_Field_Values.xlsx"
	When I click modal button "Save and Continue" 
	Then I see field "Monitoring Type" as "Program"

@54426 @orgSiteVisitTypeApplication @deepika
Scenario: Validate the Site Visit type Application
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Application" values from "Organizational_SiteVisit_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	Then I see field "Desk Review Type" as "Application"

@54427	@orgSiteVisitTypeAward @deepika
Scenario: Validate the Site Visit type Award
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_SiteVisit_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	Then I see field "Desk Review Type" as "Award"

@54428  @addParticipantsT0OrgSiteVisit @deepika
Scenario: Validate the participants for the Site Visit
	Given I navigate to "Related log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts" 
	When I click "Associate" after selection of "Automation EXE" in the table "SelectSiteDeskReviewContacts" 
	And I close Modal 
	Then I see that "Automation EXE" has been added in flextable with Id "GrantorSiteVisitOrganizationContacts" 
	
@54452 @approverSelectionSiteVisitOrglevel
 Scenario Outline: Approver selection of Site Visit
    Given I navigate to "Related log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	 When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorSiteVisitRolesandResponsibilities" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I see that "<Program Approver Name>" has been added in flextable with Id "flexGridGrantorSiteVisitRolesandResponsibilities"
    Examples:
      | Program Approver Name |
      | Automation PM         |
      
 @54454 @notifySubrecipientSiteVisitOrgLevel @smoke
 Scenario: Notify Subrecipient about the Site Visit Org Level
    Given I navigate to "Related log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	 When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorSiteVisitRolesandResponsibilities" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts" 
	When I click "Associate" after selection of "Automation SPI" in the table "SelectSiteDeskReviewContacts" 
	And I close Modal 
	And I click on top right button "Associate" in flex table with id "SiteVisitOrganizationApplications"
	When I click "Add" after selection of "Automation Announcement for FDM" in the table "SelectApplicationSiteDeskReviews" 	
	And I close Modal
    And I click on "Notify" in the page details
    Then I see that "Automation Site Visit Org level" is in "Notified" status
    
 @54455 @notifyPendingTaskForSubrecipientSiteVisitOrgLevel
  Scenario: Subrecipient pending task check for Site Visit Org Level
    Given I navigate to "Related log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	 When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorSiteVisitRolesandResponsibilities" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts" 
	When I click "Associate" after selection of "Automation SPI" in the table "SelectSiteDeskReviewContacts" 
	And I close Modal 
    And I click on top right button "Associate" in flex table with id "SiteVisitOrganizationApplications"
	When I click "Add" after selection of "Automation Announcement for FDM" in the table "SelectApplicationSiteDeskReviews" 	
	And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I see that "Automation Site Visit Org level" is in "Notified" status
    
 @54456 @conductSiteVisitOrgLevel @smoke
  Scenario: Conduct Site Visit Org level
    Given I navigate to "Related log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	 When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorSiteVisitRolesandResponsibilities" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts" 
	When I click "Associate" after selection of "Automation SPI" in the table "SelectSiteDeskReviewContacts" 
	And I close Modal
    And I click on top right button "Associate" in flex table with id "SiteVisitOrganizationApplications"
	When I click "Add" after selection of "Automation Announcement for FDM" in the table "SelectApplicationSiteDeskReviews" 	
	And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"
    
@54457 @addingOutcomeSiteVisitOrgLevel
  Scenario: Adding outcomes to Site Visit OrgLevel
        Given I navigate to "Related log" sub tab 
	And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit" 
	And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	 When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorSiteVisitRolesandResponsibilities" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts" 
	When I click "Associate" after selection of "Automation SPI" in the table "SelectSiteDeskReviewContacts" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "SiteVisitOrganizationApplications"
	When I click "Add" after selection of "Automation Announcement for FDM" in the table "SelectApplicationSiteDeskReviews" 	
	And I close Modal 
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Manage Site Visits" content inside "Manage Site Visit" subheader on left panel
    When I perform quick search for "Record Id" in "ApplicationsSiteVisitReportsGrid" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "FormComponent"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "FormComponent"
    When I enter the following values into flex table with id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I see that "Automation Finding" has been added in flextable with Id "flexGridGrantorSiteVisitFindingsGridRecipientEnhance"
	
