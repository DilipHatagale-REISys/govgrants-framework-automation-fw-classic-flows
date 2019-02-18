@applicationIntake
Feature: Validate all scenarios in the Application Intake

	Background: Qualify Announcement and Create Application
	Given I delete the record "Automation Application Regression" from the object "Application"
	And I delete the record "Automation Announcement Regression" from the object "Qualified Announcement"
	Given I am on "SUBPORTAL" portal
	And I qualify the announcement "Automation Announcement Regression" as user "SPI"
	| Actions 	 | Step 1 	      | Step 2		  | Step 3  | Step 4 	    |
	| Navigation | Grants Portal  | Opportunities | Active  | Opportunities |
	| FlexTable  | popupflextable | View		  | Qualify | 				|
	Given I create an Application from sheet "Creation" in excel "Application_Field_Values.xlsx"
	| Actions | Step 1 	       | Step 2		    	    | Step 3 |
	|Creation | Create Application | Save and Continue  | Save   |

  	@34044 @applicationCreation @applicationIntake @all
  	Scenario: Creating an Application
	Then I see that "Application Title" is in "Created" status

  	@34045 @applicationEdition @applicationIntake @all
  	Scenario: Edition of an application
	When I click on "Edit" in the page details
	And I enter "Edition" values from "Application_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see status in Progress-bar is "Created" and is "green"
	
  	@34303 @addFocusAreaToApplication @applicationIntake @all
  	Scenario Outline: Addition of Focus area to an application
    When I navigate to "Budget" sub tab
    And I click on top right button "Add Focus Area" in flex table with id "FocusAreaApp"
    When I click "Add" after selection of "<EGMS Id>" in the table "AddAppProjects"
    And I switch to Parent frame
    Then I see that "<EGMS Id>" has been added in flextable with Id "FocusAreaApp"
	Examples:
	| EGMS Id |
	| 00005   |

  	@addBudgetDetailsToApplication @applicationIntake @all
  	Scenario Outline: Addition of budget in the budget grid to an application
  	Given I associate "1" records "02493"
	| Actions 	  | Step 1 | Step 2	   	    | Step 3  	   | Step 4  | Step 5  		  |
    | Associate 1 | Budget | Add Focus Area | FocusAreaApp | Add	 | AddAppProjects |
  	When I navigate to "Budget" sub tab
    And I expand nested table containing column value "Proposed Budget" inside nested table containing "BP01"
    When I edit the following rows inline in flex table with id "flexGridEnhanceAppBudCatGrantorFlexGrid" by clicking "Edit" :
	| Category Name | Budget | Cash Match | Non-Cash Match |
	| Construction	| 5000 	 | 1000   	  | 3000 		   | 
	Examples:
	| Application Name 											 | Flextable Name |
	| Automation Announcement for Application Intake Application | Budget Details |
	
  	@addTargetToKPIInApplication @applicationIntake @all
  	Scenario Outline: Addition of KPI target to an application 
  	When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "flexGridRecipientApplicationRelatedKPIs" by clicking "Edit" :
	| EGMS ID  | Target |
	| KPI-0419 | 10		|
	| KPI-0420 | 10		|
	Then I see that "10" has been added in flextable with Id "flexGridRecipientApplicationRelatedKPIs"
	Examples:
	| Application Name 	   | Flextable Name |
	| Automation App Dec10 | Budget Details |
	
	@formFillingApplication @applicationIntake @all
    Scenario: To fill and complete the form in Progress Report
    When I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "FormEnhancedTable"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Application Form - Project H.E.A.T." inside flex table with id "FormEnhancedTable"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    Then I see that "100.00%" has been added in flextable with Id "FormComponent"
	
  	@uploadAttachmentForChecklistInApplication @applicationIntake @all
  	Scenario: Attaching a document for attachment checklist in an application
    When I navigate to "Attachments" sub tab
    And I click on "Attach" icon for "Not Applicable" inside flex table with id "inlineEditGridApplicationChecklists"
    When I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Application"
    And I close Modal
    When I click on "Attach" icon for "Not Applicable" inside flex table with id "inlineEditGridApplicationChecklists"
    And I choose the file "Announcement_Field_Values.xlsx" to upload for "Checklist" of type "Application"
    When I close Modal
	
  	@34156 @submitApplication @applicationIntakeHappyPath @applicationIntake @all
  	Scenario: Submitting an application to Grantor
	Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
	| Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate "1" records "02493"
	| Actions 	  | Step 1 | Step 2	   	    | Step 3  	   | Step 4  | Step 5  		  |
    | Associate 1 | Budget | Add Focus Area | FocusAreaApp | Add	 | AddAppProjects |
	Given I expand nested table containing column value "BP01"
	And I edit the following rows inline in flex table with id "flexGridEnhanceAppBudCatGrantorFlexGrid" by clicking "Edit" :
	| Category Name | Budget | Cash Match | Non-Cash Match |
	| Construction	| 5000 	 | 1000   	  | 3000 		   |
	When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "flexGridRecipientApplicationRelatedKPIs" by clicking "Edit" :
	| EGMS ID  | Target |
	| KPI-0419 | 10		|
	| KPI-0420 | 10		|
	Given I upload "1" checklist document "Announcement_Field_Values.xlsx"
	| Actions 	 | Step 1 							   | Step 2		 | Step 3 	      |
	| Navigation | Attachments 						   | 			 |				  |
	| FlexTable  | inlineEditGridApplicationChecklists | Attach 	 | Not Applicable |
	| Upload	 | Checklist 						   | Application |				  |
	And I navigate to "Attachments" sub tab
	And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "FormEnhancedTable"
	Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Application Form - Project H.E.A.T." inside flex table with id "FormEnhancedTable"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Then I see status in Progress-bar is "Submitted" and is "green"
	
  	@34346 @viewSubmitedApplication @applicationIntake @all
  	Scenario Outline: Viewing the application submitted by subrecipient as Internal user
  	Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
	| Actions 		  | Step 1 | Step 2	|
    | Edition Buttons | Edit   | Save   |
    And I associate "1" records "02493"
	| Actions 	  | Step 1 | Step 2	   	    | Step 3  	   | Step 4  | Step 5  		  |
    | Associate 1 | Budget | Add Focus Area | FocusAreaApp | Add	 | AddAppProjects |
	Given I expand nested table containing column value "Proposed Budget" inside nested table containing "BP01"
	And I edit the following rows inline in flex table with id "inlineEditGridApplicationBudgetCategoryGrantorFlexGrid" by clicking "Edit" :
	| Category Name | Budget | Cash Match | Non-Cash Match |
	| Construction	| 5000 	 | 1000   	  | 3000 		   |
	When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "flexGridRecipientApplicationRelatedKPIs" by clicking "Edit" :
	| EGMS ID  | Target |
	| KPI-0419 | 10		|
	| KPI-0420 | 10		|
	Given I upload "1" checklist document "Announcement_Field_Values.xlsx"
	| Actions 	 | Step 1 							   | Step 2		 | Step 3 	      |
	| Navigation | Attachments 						   | 			 |				  |
	| FlexTable  | inlineEditGridApplicationChecklists | Attach 	 | Not Applicable |
	| Upload	 | Checklist 						   | Application |				  |
	And I navigate to "Attachments" sub tab
	And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "FormEnhancedTable"
	Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Application Form - Project H.E.A.T." inside flex table with id "FormEnhancedTable"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
	And I navigate to "Applications" content inside "Applications" subheader on left panel
	When I click toggle button to select "Submitted Applications"
	And I perform quick search for "<Application Name>" in "ApplicantGrantorApplications" panel
	When I click on "View" icon for "<Application Name>" inside table
	Examples:
	| User | Application Name                    |
	| EXE  | Automation Application Regression	 |