@closeout @regression
Feature: Validate all scenarios in Closeout

  Background: Navigate to award
    Given I delete the record "Automation Permanent Award" from the object "Closeout"
    And I login and view the record "Automation Permanent Award" as "EXE"
      | Actions          | Step 1        | Step 2       | Step 3               | Step 4                        |
      | Owner Navigation | As a Grantor  | Grants       | Grants and Subawards | Grants, Subaward & Amendments |
      | Complete Review  | Active Grants | ActiveGrants | View                 |                               |

  @50971 @creationOfAdhocCloseout @smoke
  Scenario: To create an Adhoc Closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "closeout::closeoutTableId"
    When I enter "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @50973 @editionOfCloseout
  Scenario: To edit a Closout Request
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @50974 @assigningApproversInCloseout
  Scenario: To assign approvers Closout Request
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Then I see that "Automation FO" has been added in flextable with Id "closeout::closeoutApproverTableId"

  @50975 @sendClosoutToSubrecipient @smoke
  Scenario: Send Closout Request to Subrecipient
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I click on "Send To Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"

  @50976 @subrecipientEntersFielsInCloseout
  Scenario: Subrecipient enters closeout fields
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Closeout          | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"

  @subrecipientAcknowledgesCloseout @smoke
  Scenario: Subrecipient acknowledges the closeout
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Closeout          | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on "Acknowledge" in the page details
    Then I see that "Closeout View" is in "Acknowledged by Subrecipient" status

  @50978 @overrideCloseout @smoke
  Scenario: Grant owner overrides the closeout
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Closeout          | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on "Acknowledge" in the page details
    When User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Closeout          | As a Grantor | QA     |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I click on "Override" in the page details
    Then I see status in Progress-bar is "Overridden" and is "green"

  @50979 @submitCloseoutForApproval
  Scenario: Closeout is submitted for approval
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Closeout          | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on "Acknowledge" in the page details
    Given User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Closeout          | As a Grantor | QA     |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"

  @adhocCloseoutHappyPath @smoke @notFunctional
  Scenario: Approval of Closeout
    Given I create a closeout from sheet "Creation" in excel "Closeout_Field_Values.xlsx"
      | Actions   | Step 1            | Step 2                         |
      | Sub tab   | Requests          |                                |
      | FlexTable | New               | flexGridGrantorCloseOutRequest |
      | Creation  | Save and Continue | Save                           |
      | ID        | EGMS ID           |                                |
    And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Closeout          | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on "Acknowledge" in the page details
    Given User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Closeout          | As a Grantor | QA     |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Closeout |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I enter "<string>" for comments and click "<string>"
    Then I see status in Progress-bar is "Completed" and is "green"

  @scheduledCloseoutHappyPath @notFunctional
  Scenario: Happy path of Scheduled closeout
    Given I navigate to "Requests" sub tab
    And I click on "View" icon for "Scheduled" inside flex table with id "GrantorCloseOutRequestFlexToggle" with wait for record
    When I get the "EGMS ID"
    Given User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Closeout          | As a Grantor | QA     |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    And I complete the fields from the sheet "Edition" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "closeout::closeoutApproverTableId" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    And User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Closeout          | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    Given I complete the fields from the sheet "Subrecipient fields" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I click on "Acknowledge" in the page details
    Given User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Closeout          | As a Grantor | QA     |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Closeout |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    Then I see status in Progress-bar is "Completed" and is "green"

