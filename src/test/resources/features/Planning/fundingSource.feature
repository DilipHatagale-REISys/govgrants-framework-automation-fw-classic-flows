@fundingSource @regression
Feature: Validate all scenarios in Funding Source

  Background: To setup data
    Given I delete the record "Automation Execution Funding Source" from the object "Funding Source"

  @51034 @creationOfFundingSource @smoke 
  Scenario: Creation of Funding Source 
	Given I login to "As a Grantor" app as "EXE" user 
	When I navigate to "Planning" tab 
	When I navigate to "Funding Sources" content inside "Planning" subheader on left panel 
	And I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---" 
	When I enter "Creation" values from "FundingSource_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	And I click on "Save" in the page details 
	Then I see status in Progress-bar is "Created" and is "green" 

  @51035 @editionOfFundingSource
  Scenario: Edition of Funding Source
      Given I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Save                           |
      | ID         | EGMS ID         |                       |                                |
    And I click on "Edit" in the page details
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    
  @51036 @addAttachmentToFundingSource 
  Scenario: Addition of Attachment to Funding Source
      Given I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Save                           |
      | ID         | EGMS ID         |                       |                                |
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "---fundingsource:-:funding_Source_Attachment_Table_Id---"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Supporting Documents"
    And I close Modal
    Then I see that "Supporting Documents" has been added in flextable with Id "---fundingSource:-:funding_Source_Attachment_Table_Id---"

  @51037 @creationOfFundingAccount @smoke
  Scenario: Creation of Funding Account
      Given I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Save                           |
      | ID         | EGMS ID         |                       |                                |
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51038 @editionOfFundingAccount
  Scenario: Edition of Funding Account
      Given I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Save                           |
      | ID         | EGMS ID         |                       |                                |
    Given I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51039 @activateFundingAccount @smoke
   Scenario: Activation of Funding Source
    Given I login to "As a Grantor" app as "EXE" user 
	When I navigate to "Planning" tab 
	When I navigate to "Funding Sources" content inside "Planning" subheader on left panel 
	And I click on top right button "New" in flex table with id "InternalFundingSource"
	When I enter "Creation" values from "FundingSource_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	And I click on "Save" in the page details 
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Funding Account Edition" in excel "FundingSource_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @51040 @fundingSourceHappyPath @smoke
  Scenario: Funding Source HappyPath
      Given I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Save                           |
      | ID         | EGMS ID         |                       |                                |
    Given I complete the fields from the sheet "Edition" in excel "FundingSource_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    
 @52661 @creationFSFOUser @smoke 
Scenario Outline:Verify that other users (other than Admin/PM/EXE)are not able to create funding account &  funding source
	Given I am on "INTERNAL" portal 
	Given I login as "<User>" user 
	When I navigate to "Planning" tab 
	And I navigate to "Funding Sources" content inside "Planning" subheader on left panel 
	Then  I cannot see top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---" 
	Examples: 
		|User|
		|PM |
		
@52662 @deactivateFundingSource @smoke 
Scenario: Verify that  user can  deactivate  Funding Source
Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Funding Sources" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Internal Funding Sources" 
	When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---" 
	When I enter "Creation" values from "FundingSource_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	And I get the "EGMS ID" 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "FundingSource_Field_Values.xlsx" 
	When I click on "Save" in the page details 
    And I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "green" 
    
    
@52663 @deactivateFundingSourcePMUser @smoke 
Scenario: Verify that  PM user can  deactivate  Funding Source
Given I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Save                           |
      | ID         | EGMS ID         |                       |                                |
    Given I complete the fields from the sheet "Edition" in excel "FundingSource_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal 
	When I navigate to "Planning" tab 
	And I navigate to "Funding Sources" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Active Internal Funding Sources" 
	When I perform quick search for "Automation Execution Funding Source" in "---fundingsource:-:funding_Source_Table_Id---" panel 
	And I click on "View" icon for "Automation Execution Funding Source" inside table 
	Then I cannot see top right button "Deactivate" in page detail  
	
@52666 @reactivateFundingSource @smoke @wip @deepika
Scenario: Verify that  user can  reactivate the deactivated  Funding Source
Given I am on "INTERNAL" portal 
	Given I login as "EXE" user 
	When I navigate to "Planning" tab 
	And I navigate to "Funding Sources" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Draft Internal Funding Sources" 
	When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---" 
	When I enter "Creation" values from "FundingSource_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	When I click on "Save" in the page details 
	And I get the "EGMS ID" 
	When I click on "Edit" in the page details 
	And I enter "Edition" values from "FundingSource_Field_Values.xlsx" 
	When I click on "Save" in the page details 
    And I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    When I navigate to "Planning" tab 
	And I navigate to "Funding Sources" content inside "Planning" subheader on left panel 
	And I click toggle button to select "Closed Internal Funding Sources" 
	When I perform quick search for "Automation Execution Funding Source" in "---fundingsource:-:funding_Source_Table_Id---" panel 
	And I click on "View" icon for "Automation Execution Funding Source" inside table 
	And I click on "Reactivate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"
    