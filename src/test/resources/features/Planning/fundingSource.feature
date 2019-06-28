@fundingSource @regression
Feature: Validate all scenarios in Funding Source

  Background: To setup data
    Given I delete the record "Automation Execution Funding Source" from the object "Funding Source"

  @51034 @creationOfFundingSource @smoke
  Scenario: Creation of Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51035 @editionOfFundingSource
  Scenario: Edition of Funding Source
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51036 @addAttachmentToFundingSource
  Scenario: Addition of Attachment to Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents"
    Then I see "Supporting Documents" has been added in "Attachments" flex table

  @51037 @creationOfFundingAccount @smoke
  Scenario: Creation of Funding Account
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51038 @editionOfFundingAccount
  Scenario: Edition of Funding Account
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
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
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @51040 @fundingSourceHappyPath @smoke
  Scenario: Funding Source HappyPath
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @52661 @creationFSFOUser @smoke
  Scenario Outline:Verify that other users (other than Admin/PM/EXE)are not able to create funding account &  funding source
    When I am on "INTERNAL" portal
    When I login as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    Examples:
      | User |
      | PM   |

  @52662 @deactivateFundingSource @smoke
  Scenario: Verify that  user can  deactivate  Funding Source
    When I am on "INTERNAL" portal
    When I login as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click toggle button to select "Draft Internal Funding Sources"
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"

  @52663 @deactivateFundingSourcePMUser @smoke
  Scenario: Verify that  PM user can  deactivate  Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "InternalFundingSource"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
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

  @52666 @reactivateFundingSource @smoke @mahadev
  Scenario Outline: Verify that  user can  reactivate the deactivated  Funding Source
    When I am on "INTERNAL" portal
    When I login as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click toggle button to select "Draft Internal Funding Sources"
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Source_Table_Id---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click toggle button to select "Closed Internal Funding Sources"
    When I perform quick search for "<Funding Source>" in "---fundingsource:-:funding_Source_Table_Id---" panel
    And I click on "View" icon for "<Funding Source>" inside table
    When I click on "View" icon for "Closed" inside flex table with id "---fundingsource:-:funding_Account_Table_Id---"
    And I click on "Activate" in the page details
    And I navigate to "Funding Sources" content inside "Planning" subheader on left panel
    And I click toggle button to select "Active Internal Funding Sources"
    When I perform quick search for "<Funding Source>" in "---fundingsource:-:funding_Source_Table_Id---" panel
    And I click on "View" icon for "<Funding Source>" inside table
    Then I see status in Progress-bar is "Active" and is "Green"
    Examples:
      | Funding Source                      |
      | Automation Execution Funding Source |