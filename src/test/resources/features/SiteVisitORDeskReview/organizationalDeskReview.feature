@organizationalDeskReview @regression
Feature: Validate all scenarios in Organizational Desk Review

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
Scenario Outline: Subrrecipient Participant Association of Organizational Desk Review 
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details 
	When I navigate to "Overview" sub tab 
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "<Subrecipient>" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal 
	Then I see that "<Subrecipient>" has been added in flextable with Id "---orgLevelDeskReview:-:associateContactsId---" 
	Examples: 
		| Subrecipient   |
		| Automation SPA |
      
@54210 @monitoringTypeFiscalDR @deepika
Scenario: Validate the Monitoring type 'Fiscal' for Organizational Desk Review
	Given I navigate to "Related Log" sub tab 
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview" 
	And I enter "Fiscal" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	Then I see field "Monitoring Type" as "Fiscal"

	
 @54295 @monitoringTypeProgramDR @deepika
Scenario: Validate the Monitoring type 'Program' for Organizational Desk Review
	Given I navigate to "Related Log" sub tab 
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview" 
	And I enter "Program" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click modal button "Save and Continue" 
	Then I see field "Monitoring Type" as "Program"
	
	
@54423 @orgDeskReviewTypeApplication @deepika
Scenario: Validate the Desk Review Org Level type Application
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Application" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue" 
	Then I see field "Desk Review Type" as "Application"

@54424 @orgDeskReviewTypeAward @deepika
Scenario: Validate the Desk Review Org Level type Award
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	Then I see field "Desk Review Type" as "Award"
	
@54425 @addParticipantsT0OrgDeskReview @deepika
Scenario: Validate the participants for the Desk Review Org Level
	Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	When I click on "Save" in the page details 
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation EXE" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal 
	Then I see that "Automation EXE" has been added in flextable with Id "---orgLevelDeskReview:-:associateContactsId---" 
	
@54458 @approverSelectionDeskReviewOrgLevel @deepika
  Scenario Outline: Approver selection of Desk Review Org Level
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	  When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details  
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Roles            | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I see that "<Program Approver Name>" has been added in flextable with Id "---orgLevelDeskReview:-:approverSiteVisitTableId---"
    Examples:
      | Program Approver Name |
      | Automation PM         |
      
 @54459 @notifySubrecipientDeskReviewOrgLevel @smoke @deepika
  Scenario: Notify Subrecipient about the Desk Review Org Level
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	  When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details  
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    And I click on "Notify" in the page details
    Then I see that "Automation Desk Review Org level" is in "Notified" status
    
 @54460 @notifyPendingTaskForSubrecipientDeskReviewOrgLevel @deepika
  Scenario: Subrecipient pending task check for Desk Review Org Level
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	  When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details 
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    Then I see that "Automation Desk Review Org level" is in "Notified" status
    
  @54461 @conductDeskReviewOrgLevel @smoke @deepika
  Scenario: Conduct Desk Review Org level
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details  
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I see status in Progress-bar is "In Progress" and is "green"
    
  @54462 @addingOutcomeDeskReviewOrgLevel @deepika
  Scenario: Adding outcomes to Desk Review OrgLevel
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	  When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details 
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    Then I see that "Automation Finding" has been added in flextable with Id "---orgLevelDeskReview:-:correctiveTableId---"
      
@54572 @formFillingDeskReviewOrgLevel @smoke @deepika
Scenario: Filling up of form in Desk Review Org Level
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	  When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details 
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    Then I see that "100.00%" has been added in flextable with Id "---orgLevelDeskReview:-:reportsTableId---"
    
@54571 @submittingForApprovalDeskReviewOrgLevel @deepika
Scenario: Submitting Desk Review for approval Org level
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	  When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details 
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
      And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
      When I click on "Submit for Approval" in the page details
      Then I see status in Progress-bar is "Submitted for Approval" and is "green"

@54886 @approvalOfDeskReviewOrgLevel @deepika
     Scenario: Approval of Desk Review Org Level
      Given I navigate to "Related Log" sub tab
      And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
      And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
      When I click modal button "Save and Continue"
      When I click on "Cancel" in the page details
      When I click on "Edit" in the page details
      And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
      When I click on "Save" in the page details
      When I get the "EGMS ID"
      When I navigate to "Responsibilities" sub tab
      And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
        | Responsibilities | Name          | Description                 |
        | Program Approver | Automation PM | Automation Test Description |
        | Fiscal Approver  | Automation FO | Automation Test Description |
      When I navigate to "Overview" sub tab
      And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
      When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
      And I close Modal
      And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
      When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
      And I close Modal
      When I get the "EGMS ID"
      And I click on "Notify" in the page details
      When I click on "Conduct" in the page details
      When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
      And I navigate to "Home" tab
      When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
      And I perform quick search for "Record Id" in "PendingTasks" panel
      When I click on "Start" icon for "Record Id" inside table
      When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
      And I navigate to "Home" tab
      When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
      When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
      And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
      Given I navigate to "Related Log" sub tab
      When I perform quick search for "Record Id" in "DeskReview" panel
      And I click on "View" icon for "Record Id" inside table
      And I navigate to "Reports and Outcomes" sub tab
      When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
      And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
      And I click on "Save" in the page details
      When I click on "Back" in the page details
      When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
        | Title                  | Description            | Type        |
        | Automation Finding     | Automation Description | Finding     |
        | Automation Concern     | Automation Description | Concern     |
        | Automation Observation | Automation Description | Observation |
      And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
      When I click on "Submit for Approval" in the page details
      When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
      And I navigate to "Monitoring" tab
      When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
      When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
      And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
      And I click on "Approve" on the approval decision box
      When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
      And I navigate to "Monitoring" tab
      When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
      When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
      And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
      And I click on "Approve" on the approval decision box
      Then I see status in Progress-bar is "Approved" and is "green"

@54887 @deskReviewSendToSubrecipientOrgLevel @deepika
  Scenario: Send Desk Review to Subrecipient Org Level
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I close Modal
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"

@54888 @deskReviewCorrectiveActionsBySubrecipientOrgLevel @smoke @deepika
  Scenario: Desk Review Corrective Actions By Subrecipient
  Given I navigate to "Related Log" sub tab
  And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
  And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
  When I click modal button "Save and Continue"
  When I click on "Cancel" in the page details
  When I click on "Edit" in the page details
  And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
  When I click on "Save" in the page details
  When I navigate to "Responsibilities" sub tab
  And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
    | Responsibilities | Name          | Description                 |
    | Program Approver | Automation FO | Automation Test Description |
    | Fiscal Approver  | Automation PM | Automation Test Description |
  When I navigate to "Overview" sub tab
  And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
  When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
  And I close Modal
  And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
  When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
  And I close Modal
  When I get the "EGMS ID"
  And I click on "Notify" in the page details
  When I click on "Conduct" in the page details
  When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
  And I navigate to "Home" tab
  When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
  And I perform quick search for "Record Id" in "PendingTasks" panel
  When I click on "Start" icon for "Record Id" inside table
  When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
  And I navigate to "Home" tab
  When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
  When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
  And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
  Given I navigate to "Related Log" sub tab
  When I perform quick search for "Record Id" in "DeskReview" panel
  And I click on "View" icon for "Record Id" inside table
  And I navigate to "Reports and Outcomes" sub tab
  When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
  And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
  And I click on "Save" in the page details
  When I click on "Back" in the page details
  When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
    | Title                  | Description            | Type        |
    | Automation Finding     | Automation Description | Finding     |
    | Automation Concern     | Automation Description | Concern     |
    | Automation Observation | Automation Description | Observation |
  And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
  When I click on "Submit for Approval" in the page details
  When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
  And I navigate to "Monitoring" tab
  When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
  When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
  And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
  And I click on "Approve" on the approval decision box
  When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
  And I navigate to "Monitoring" tab
  When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
  When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
  And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
  And I click on "Approve" on the approval decision box
  Given I click on "Send to Subrecipient" in the page details
   When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
   When I navigate to "Monitoring" tab
   And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
   When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
   And I click on "Start" icon for "Record Id" inside table
   When I navigate to "Reports and Outcomes" sub tab
   And I expand nested table containing column value "Automation Observation"
   When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
     | Title                               | Description            | Status      | Due Date | Assigned To    |
     | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
   When I collapse nested table containing column value "Automation Observation"
   And I expand nested table containing column value "Automation Concern"
   When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
     | Title                           | Description            | Status      | Due Date | Assigned To    |
     | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
   When I collapse nested table containing column value "Automation Concern"
   And I expand nested table containing column value "Automation Finding"
   When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
     | Title                           | Description            | Status      | Due Date | Assigned To    |
     | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
   And I collapse nested table containing column value "Automation Finding"
   Then I see that "Automation Desk Review Org level" is in "Sent to Subrecipient" status

  @55203 @deskReviewSubmitToGrantorBySubrecipientOrgLevel @deepika
  Scenario: Desk Review Submit to Grantor By Subrecipient
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I close Modal
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"

  @55204 @deskReviewAcceptAndCloseOrgLevel @smoke @deepika
  Scenario: Desk Review Accept and Close
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I close Modal
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "green"
    
  @55415 @viewOrgDeskReviewAcceptButtonAfterSRecipientsSubmission @deepika
  Scenario: Validate User will be able to view the Desk Review Accept button after review the submission by Recipients
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I close Modal
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To    |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:receipientTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To    |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | Automation SPI |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    Then I can see top right button "Accept and Close" in page detail
    
  @55416 @deskReviewOrgLevelSendBackToOwner @deepika
  Scenario: User will be able to return the Desk Review Org Level record back to Recipients when outcomes are not properly addressed
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I close Modal
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Send to Owner" on the approval decision box
    Then I see status in Progress-bar is "Created" and is "green"

  @55459 @deskReviewOrgLevelWithOutAddingCorerctiveItems @deepika
  Scenario:  User will not be able to submit the Desk Review Org Level to Grantor without adding corrective actions to findings.
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I close Modal
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Submit to Grantor" in the page details
    Then I see the following messages in the page details :
      |Reports and Outcomes : Enter corrective actions on all Findings outcomes using the "+" icons.|

  @55460 @approverForwardUserGetPendingTaskDeskReview @deepika
  Scenario: Validate when the Approver forward Org Level Desk Review to other user, the Pending Task will be created to the User
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation FO | Automation Test Description |
      | Fiscal Approver  | Automation PM | Automation Test Description |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---"
    When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    And I close Modal
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
    And I close Modal
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "Record Id" in "DeskReview" panel
    And I click on "View" icon for "Record Id" inside table
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I click on top right button "Validate" in flex table with id "---orgLevelDeskReview:-:reportsTableId---"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---orgLevelDeskReview:-:phasePendingTaskTableId---"
    And I click on "Reassign,Automation EXE" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---orgLevelDeskReview:-:phasePendingTaskTableId---" panel
    Then I see that "Approve Desk Review Org" has been added in flextable with Id "---orgLevelDeskReview:-:phasePendingTaskTableId---"

  @55793 @internalUserParticipantOrganizationalDeskReview @smoke @deepika
  Scenario Outline: Internal User participant Association of Organizational Desk Review 
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details 
	When I navigate to "Overview" sub tab 
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "<User>" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal 
	Then I see that "<User>" has been added in flextable with Id "---orgLevelDeskReview:-:associateContactsId---" 
	Examples: 
		| User           |
		| Automation EXE |
		
  @55797 @organizationalDeskReviewPurpose @deepika
  Scenario: Validate the Purpose of Desk Review Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition1" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details
	Then I see the following messages in the page details :
      |Purpose is Required to save under Overview.|
      
  @55798 @organizationalDeskReviewSource @deepika
  Scenario: Validate the Source of Desk Review Org level
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition1" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details
	Then I see the following messages in the page details :
      |Source is Required to save under Overview.|

  @notifyButtonDeskReviewOrgLevel @smoke @deepika
  Scenario: User will be able to view the Notify button on the Desk review Page
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	  When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details  
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    Then I can see top right button "Notify" in page detail 
    
  @55806 @conductButtonDeskReviewOrgLevel @smoke @deepika
  Scenario: User will be able to view the Conduct button on the Desk Review to complete the action items
    Given I navigate to "Related Log" sub tab
	And I click on top right button "Initiate Desk Review" in flex table with id "DeskReview"
	And I enter "Award" values from "Organizational_DeskReview_Field_Values.xlsx"
	When I click modal button "Save and Continue"
	When I click on "Cancel" in the page details 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx" 
	When I click on "Save" in the page details  
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---orgLevelDeskReview:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Responsibilities | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I navigate to "Overview" sub tab
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateContactsId---" 
	When I click "Associate" after selection of "Automation SPI" in the table "---orgLevelDeskReview:-:deskReviewContactsTableId---" 
	And I close Modal
	And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:associateAwardId---"
	When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---orgLevelDeskReview:-:selectAwardId---"
	And I close Modal 
    When I get the "EGMS ID"
    And I click on "Notify" in the page details
    Then I can see top right button "Conduct" in page detail 
    

