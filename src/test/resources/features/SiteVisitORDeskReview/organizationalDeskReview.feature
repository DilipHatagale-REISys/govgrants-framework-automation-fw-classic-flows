@organizationalDeskReview @regression
Feature: Validate all scenarios in the Site Visit

  Background: Creation of Organizational Desk Review
    Given I delete the record "Automation Desk Review Org level" from the object "Desk Review"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table

@54291 @organizationalDeskReviewCreation @smoke @deepika
 Scenario: Validate the Desk Review is in created status.
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see status in Progress-bar is "Created" and is "green"
    
@54293 @organizationalDeskReviewEdition @deepika
Scenario: Validate the edition of Desk Review Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details 
	Then I see status in Progress-bar is "Created" and is "green" 
    
@54294 @participantAssociationOrganizationalDeskReview @smoke @deepika
Scenario Outline: Participant Association of Organizational Desk Review 
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
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
      
@54210 @monitoringTypeFiscalDR @deepika
Scenario: Validate the Monitoring type 'Fiscal' for Organizational Site Visit 
	Given I navigate to "Related Log" sub tab 
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview" 
	And I enter "Fiscal" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	Then I see field "Monitoring Type" as "Fiscal"

	
 @54295 @monitoringTypeProgramDR @deepika
Scenario: Validate the Monitoring type 'Program' for Organizational Site Visit 
	Given I navigate to "Related Log" sub tab 
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview" 
	And I enter "Program" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	Then I see field "Monitoring Type" as "Program"
	
	
	@orgDeskReviewTypeApplication @deepika
Scenario: Validate the Site Visit type	
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Application" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue" 
	Then I see field "Desk Review Type" as "Application"

	@orgDeskReviewTypeAward @deepika
Scenario: Validate the Site Visit type
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	Then I see field "Desk Review Type" as "Award"
	
	   @addParticipantsT0OrgDeskReview @deepika
Scenario: Validate the participants for the Site Visit
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	When I click on "Save" in the page details 
	And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts" 
	When I click "Associate" after selection of "Automation EXE" in the table "SelectSiteDeskReviewContacts" 
	And I close Modal 
	Then I see that "Automation EXE" has been added in flextable with Id "GrantorSiteVisitOrganizationContacts" 
