@awardStandAlone @regression
Feature: Validate all scenarios in the Stand Alone Award and Grant

  Background: Create Award
    Given I delete the record "Automation Grant Award for Post Award" from the object "Progress Report"
    Given I delete the record "Automation Grant Award for Post Award" from the object "Payment Request"
    Given I delete the record "Automation Grant Award for Post Award" from the object "Grant"
    And I create a Grant as user "EXE" from sheet "Grant_Creation" in excel "Award_Field_Values.xlsx"
      | Actions    | Step 1               | Step 2       | Step 3                        |
      | Navigation | As a Grantor         | Grants       | Grants, Subaward & Amendments |
      | FlexTable  | Grants and Subawards | ActiveGrants | Draft Grants                  |
      | Creation   | New                  | Continue     |                               |
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    Given I click on "View" icon for "Created" inside flex table with id "subAwardStandAlone::subawardsTableId"
    And I get the "EGMS ID"

  @51128 @awardCreation  @smoke
  Scenario: Creation of an award
   Then I see status in Progress-bar is "Created" and is "green"

  @51129 @awardStandAloneEdition 
  Scenario: Edition of an award
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

   @51130 @awardStandAloneAddContactsKeyPersonnel 
   Scenario: Associate a Key Contact
    When I navigate to "Overview" sub tab
   And I click on top right button "Associate" in flex table with id "subAwardStandAlone::associateContactTableId"
    When I check "Automation SPA" boxes in flex table with id "subAwardStandAlone::keyContactsTableId"
    When I click on top right button "Add" in flex table with id "subAwardStandAlone::keyContactsTableId"
    And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Title          | Project Role             |
     | Automation SPA | Project Director/Manager |
    Then I see that "Automation SPA" has been added in flextable with Id "subAwardStandAlone::associateContactTableId"

  @51131 @awardStandAloneFundingAccount  @smoke
  Scenario Outline: Funding Account budget addition to Award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::fundingAccountsTableId"
    When I click "Add" after selection of "FA--154" in the table "subAwardStandAlone::awardFundingAccountsTableId"
    And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    Then I see that "<EGMS Id>" has been added in flextable with Id "subAwardStandAlone::fundingAccountsTableId"
    Examples:
      | EGMS Id |
      | FA--154 |

  @51132 @allFocusAreaAssociation  @smoke
   Scenario: Validate the association of Focus Area to Award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::focusAreaTableId"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "popupflextableGAT"
    And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Automation Permanent Focus Area | 0          | 500      |
    Then I see that "Automation Permanent Focus Area" has been added in flextable with Id "subAwardStandAlone::focusAreaTableId"


  @51133 @awardStandAloneBudgetEdition 
  Scenario: Budget addition to Award
    When I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Cash Match |
      | Construction    | 2000       |
    Then I see that "Construction" has been added in flextable with Id "subAwardStandAlone::subAwardBudgetTableId"

  @51134 @allObjectiveAssociation  @nonFunctional
  Scenario: Validate the association of Objective to Award
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::objectivesTableId"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "SelectAwardGoals"
    And I close Modal
    Then I see that "Automation Permanent Objective" has been added in flextable with Id "subAwardStandAlone::objectivesTableId"

   @51135 @allKPIAssociation  @smoke
  Scenario Outline: Validate the association of KPI to Award
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      |Automation Permanent KPI for Regression | 10     |
    Then I see that "<EGMS Id>" has been added in flextable with Id "subAwardStandAlone::kpiTableId"
    Examples:
      | EGMS Id                               |
      |Automation Permanent KPI for Regression|

  @51136 @allRiskAssessmentApprovalAndActivation  @smoke
  Scenario: Risk Assessment approval in an award
   Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Program Approver   | Automation PM  | Automation Test Description |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
       Then I see status in Progress-bar is "Active" and is "green"

  @51137 @allApproverSelection 
  Scenario: Validate the assignment of Approvers for the award
      When I navigate to "Responsibilities" sub tab
     And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      Then I see that "Automation EXE" has been added in flextable with Id "GrantorAwardRolesAndResponsibilitiesFlexToggle"

  @51148 @allSendToRecipientBeforeApproval 
  Scenario Outline: Validate the assignment of Approvers for the award
     Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Automation Permanent Focus Area | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      |Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                        | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Subaward Risk Assessment"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    Then I click on "Send to Subrecipient" in the page details
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review |

  @51147 @allAcceptanceByRecipientBeforeApproval @smoke
  Scenario Outline: Validate the Acceptance by recipient before approval
     Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "1" records "FA--154"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Automation Permanent Focus Area | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      |Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::associateContactTableId"
    When I check "Automation SPI" boxes in flex table with id "subAwardStandAlone::keyContactsTableId"
    When I click on top right button "Add" in flex table with id "subAwardStandAlone::keyContactsTableId"
    And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Title          | Project Role             |
      | Automation SPI | Project Director/Manager |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Program Approver   | Automation PM  | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Subaward Risk Assessment"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see status in Progress-bar is "Created" and is "green"
      Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review |

  @51146 @allReviewerAssignment 
  Scenario Outline: Validate the assignment of Reviewer for the award
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
      And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
      And I get the "EGMS ID"
    Then I see that "Automation FO" has been added in flextable with Id "subAwardStandAlone::peerReviewersTableId"
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Permanent Award for Automation | Permanent Award for Automation | Subaward Review |

  @51145 @allReviewerInitiation 
  Scenario Outline: Validate initiation of review for the award
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Automation Permanent Focus Area | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      |Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    #When I navigate to "Overview" sub tab
    #And I click on top right button "Associate" in flex table with id "subAwardStandAlone::associateContactTableId"
    #When I check "Automation SPI" boxes in flex table with id "subAwardStandAlone::keyContactsTableId"
    #When I click on top right button "Add" in flex table with id "subAwardStandAlone::keyContactsTableId"
    #And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Title          | Project Role             |
      | Automation SPI | Project Director/Manager |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I select "2" approvers "Automation PM,Automation FO"
      | Actions    | Step 1                                        | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Approve Subaward Risk Assessment"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
     Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Award Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "subAwardStandAlone::peerReviewersTableId"
    When I enter "Reviewer" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    Then I see that "Sent for Review" has been added in flextable with Id "subAwardStandAlone::peerReviewersTableId"
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review |

  @51144 @allReviewComplete  @smoke
  Scenario Outline: Validate completion of review for the award
     Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          |  500     |
      | Automation Permanent Focus Area | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
      And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Review Grantor Award"
    When I click on "Start" icon for "Review Grantor Award" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "subAwardStandAlone::peerReviewersTableId"
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review | Review Grantor Award |

  @51143 @allSubmissionForApproval 
  Scenario Outline: Validate award submission for approval
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          |  500     |
      | Automation Permanent Focus Area | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
      And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Review Grantor Award"
    When I click on "Start" icon for "Review Grantor Award" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review |

  @51142 @allApproval 
  Scenario Outline: Validate award Approval by respective approvers
        Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          |  500     |
      | Automation Permanent Focus Area | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
      And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Review Grantor Award"
    When I click on "Start" icon for "Review Grantor Award" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
     Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review |

 @51141 @allSendToRecipientAfterApproval  @smoke
  Scenario Outline: Validate award send to recipient after Approval
      Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          |  500     |
      | Automation Permanent Focus Area | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
      And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Review Grantor Award"
    When I click on "Start" icon for "Review Grantor Award" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                    |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review | Approve Grantor Subaward |

  @51140 @allAcceptanceByRecipientAfterApproval 
  Scenario Outline: Validate Award Acceptance by Recipient after Approval
        Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          |  500     |
      | Automation Permanent Focus Area | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
      And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Review Grantor Award"
    When I click on "Start" icon for "Review Grantor Award" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "Record id" with comments "Automation Award accepted"
      | Actions    | Step 1        | Step 2        | Step 3                | Step 4            |
      | Login      | Grants Portal | SUBPORTAL     |                       |                   |
      | Navigation | Grants        | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start         | Accept        | Accept after Approval | OK                |
    Then I see that "Subaward" is in "Accepted" status
    Examples:
      | Award Name                            | Grant Name                            | Type            | Type1                    |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review | Approve Grantor Subaward |

  @51139 @allActivation @smoke
  Scenario Outline: Validate Award Activation
        Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "1" records "FA--154"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
    #  | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          |  500     |
      | Automation Permanent Focus Area | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
      And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Review Grantor Award"
    When I click on "Start" icon for "Review Grantor Award" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "Record id" with comments "Automation Award accepted"
      | Actions    | Step 1        | Step 2        | Step 3                | Step 4            |
      | Login      | Grants Portal | SUBPORTAL     |                       |                   |
      | Navigation | Grants        | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start         | Accept        | Accept after Approval | OK                |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                            | Grant Name                            | Type            |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award | Subaward Review |
 
  @51138 @awardHappyPathStandAlone @awardStandAlone
  Scenario Outline: Validate award Happy path stand alone
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area "
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
  And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      #| Automation Permanent Focus Area    | 0          |  500     |
      | Automation Permanent Focus Area     | 0          | 1095     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID                                | Target |
      | Automation Permanent KPI for Regression| 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    Given I select "2" approvers "Automation PM,Automation FO"
     | Actions    | Step 1                                         | Step 2 | Step 3           |
      | Subtab     | Responsibilities                              |        |                  |
      | Approver 1 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Program Approver |
      | Approver 2 | GrantorRiskAssessmentRolesandResponsibilities | Edit   | Fiscal Approver  |
    And I click on "Submit for Approval" in the page details
   Given "2" Approvers "PM,FO" approve the record "Record Id"
     | Actions    | Step 1        | Step 2     | Step 3            |
     | Navigation | As a Grantor  | Monitoring |                   |
     | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
     | Approval   | Start         | Approve    |                   |
   When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
   When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
   When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Project Role             | Name           |
      | Project Director/Manager | Automation SPI |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I enter the following values into flex table with id "flexGridEnhancedDivIdGrantorAwardReviewer" by clicking "New" :
     | Reviewer Name | Responsibility   | Description                 | Due Date |Allow Record Editing |
     | Automation FO | Fiscal Reviewer  | Review Financial details   | 10        |  No                 |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Review Grantor Award"
    When I click on "Start" icon for "Review Grantor Award" inside table
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
      And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "Record id" with comments "Automation Award accepted"
      | Actions    | Step 1        | Step 2        | Step 3                | Step 4            |
      | Login      | Grants Portal | SUBPORTAL     |                       |                   |
      | Navigation | Grants        | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start         | Accept        | Accept after Approval | OK                |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"
    Examples:
      | Award Name                            | Grant Name                             |
      | Automation Grant Award for Post Award | Automation Grant Award for Post Award  | 
