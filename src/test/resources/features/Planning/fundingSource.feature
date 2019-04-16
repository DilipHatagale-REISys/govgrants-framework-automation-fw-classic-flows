@fundingSource @regression
Feature: Validate all scenarios in Funding Source

  Background: To setup data
    Given I delete the record "Automation Execution Funding Source" from the object "Funding Source"
    And I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Cancel                         |
      | ID         | EGMS ID         |                       |                                |

  @creationOfFundingSource @smoke
  Scenario: Creation of Funding Source
    Then I see status in Progress-bar is "Created" and is "green"

  @editionOfFundingSource
  Scenario: Edition of Funding Source
    And I click on "Edit" in the page details
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @addAttachmentToFundingSource
  Scenario: Addition of Attachment to KPI
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add" in flex table with id "fundingSource::fundingSourceAttachmentTableId"
    When I choose the file "InternalOrganization_Field_Values.xlsx" to upload for "Attachment" of type "Supporting Documents"
    And I close Modal
    Then I see that "Supporting Documents" has been added in flextable with Id "fundingSource::fundingSourceAttachmentTableId"

  @creationOfFundingAccount @smoke
  Scenario: Creation of Funding Source
    When I click on top right button "New" in flex table with id "fundingSource::fundingAccountTableId"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Cancel" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @editionOfFundingAccount
  Scenario: Edition of Funding Source
    Given I click on top right button "New" in flex table with id "fundingSource::fundingAccountTableId"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Cancel" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @activateFundingAccount @smoke
  Scenario: Activation of Funding Source
    Given I click on top right button "New" in flex table with id "fundingSource::fundingAccountTableId"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Funding Account Edition" in excel "FundingSource_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @fundingSourceHappyPath @smoke
  Scenario: Creation of Funding Source
    Given I complete the fields from the sheet "Edition" in excel "FundingSource_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I add an attachment "InternalOrganization_Field_Values.xlsx"
      | Actions               | Step 1      | Step 2               | Step 3             |
      | Attachment Navigation | Attachments | Add                  | a150b000001rv7VAAQ |
      | Attachment Details    | Attachment  | Supporting Documents |                    |
    And I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "fundingSource::fundingAccountTableId"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Cancel" in the page details
    Given I complete the fields from the sheet "Funding Account Edition" in excel "FundingSource_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on "Activate" in the page details
    When I click "fundingsource__c" lookup link
    Then I see status in Progress-bar is "Active" and is "green"