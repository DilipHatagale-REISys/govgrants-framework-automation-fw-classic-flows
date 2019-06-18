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

	@orgSiteVisitTypeApplication @deepika
Scenario: Validate the Site Visit type Application
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Application" values from "Organizational_SiteVisit_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	Then I see field "Desk Review Type" as "Application"

	@orgSiteVisitTypeAward @deepika
Scenario: Validate the Site Visit type Award
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_SiteVisit_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	Then I see field "Desk Review Type" as "Award"

   @addParticipantsT0OrgSiteVisit @deepika
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
