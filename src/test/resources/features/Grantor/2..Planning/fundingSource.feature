@fundingSource @grantor-regression @grantor-parallel-regression @planning
Feature: Validate all scenarios in Funding Source

  @51034 @creationOfFundingSource
  Scenario: Creation of Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51035 @editionOfFundingSource
  Scenario: Edition of Funding Source
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51036 @addAttachmentToFundingSource
  Scenario: Addition of Attachment to Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add Files" in flex table with id "---fundingSource:-:InternalFundingSourceFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    Then I see "Other" has been added in "Funding Source Files" flex table

  @51037 @creationOfFundingAccount @smoke
  Scenario: Creation of Funding Account
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51038 @editionOfFundingAccount
  Scenario: Edition of Funding Account
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51039 @activateFundingAccount @smoke
  Scenario: Activation of Funding Source
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @52661 @creationFSFOUser
  Scenario Outline:Verify that users (other than Admin/PM/EXE)are not able to create funding account &  funding source
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    Examples:
      | User |
      | PM   |

  @52662 @deactivateFundingSource
  Scenario: Verify that  user can  deactivate  Funding Source
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Draft"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"

  @52663 @deactivateFundingSourcePMUser
  Scenario: Verify that  PM user can  deactivate  Funding Source
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Funding Source}" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Funding Source}" inside table
    Then I cannot see top right button "Deactivate" in page detail

  @52666 @reactivateFundingSource @mahadev
  Scenario Outline: Verify that  user can  reactivate the deactivated  Funding Source
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Draft"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click on "Deactivate" in the page details
    When I navigate to "Planning" tab
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources -Closed"
    When I perform quick search for "<Funding Source>" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "<Funding Source>" inside table
    When I click on "View" icon for "Closed" inside flex table with id "---fundingsource:-:fundingAccountTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "Internal Funding Sources - Active"
    When I perform quick search for "<Funding Source>" in "---fundingsource:-:fundingSourceTableId---" panel
    And I click on "View" icon for "<Funding Source>" inside table
    Then I see status in Progress-bar is "Active" and is "Green"
    Examples:
      | Funding Source                                 |
      | {SavedValue:Automation Runtime Funding Source} |