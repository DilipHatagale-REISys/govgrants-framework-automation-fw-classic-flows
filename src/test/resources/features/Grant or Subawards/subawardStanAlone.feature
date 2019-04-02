@awardStandAlone
Feature: Validate all scenarios in the Stand Alone Award and Grant

  Background: Create Award
    Given I delete the record "Permanent Grant/Award For Automation" from the object "Grant"
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

  @38213 @awardStanAlone @allCreation @awardStanAlone @all
  Scenario: Creation of an award
    Then I see status in Progress-bar is "Created" and is "green"

  @38217 @awardStandAloneEdition @awardStanAlone @all
  Scenario: Edition of an award
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @awardStandAloneAddContactsKeyPersonnel @awardStanAlone @all
  Scenario: Associate a Key Contact
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::associateContactTableId"
    When I check "Automation SPI" boxes in flex table with id "subAwardStandAlone::keyContactsTableId"
    When I click on top right button "Add" in flex table with id "subAwardStandAlone::keyContactsTableId"
    And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Title          | Project Role             |
      | Automation SPI | Project Director/Manager |
    Then I see that "Automation SPI" has been added in flextable with Id "subAwardStandAlone::associateContactTableId"

  @awardStandAloneFundingAccount @awardStanAlone @all
  Scenario Outline: Funding Account budget addition to Award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::fundingAccountsTableId"
    When I click "Add" after selection of "FA--126" in the table "subAwardStandAlone::awardFundingAccountsTableId"
    And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    Then I see that "<EGMS Id>" has been added in flextable with Id "subAwardStandAlone::fundingAccountsTableId"
    Examples:
      | EGMS Id |
      | FA--126 |

  @34775 @awardStanAlone @allFocusAreaAssociation @awardStanAlone @all
  Scenario: Validate the association of Focus Area to Award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::focusAreaTableId"
    When I click "Associate" after selection of "Automation Grant Focus Area" in the table "popupflextableGAT"
    And I close Modal
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    Then I see that "Automation Grant Focus Area" has been added in flextable with Id "subAwardStandAlone::focusAreaTableId"


  @awardStandAloneBudgetEdition @awardStanAlone @all
  Scenario: Budget addition to Award
    When I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Cash Match |
      | Construction    | 2000       |
    Then I see that "Construction" has been added in flextable with Id "subAwardStandAlone::subAwardBudgetTableId"

  @34775 @awardStanAlone @allObjectiveAssociation @awardStanAlone @all @nonFunctional
  Scenario: Validate the association of Objective to Award
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "subAwardStandAlone::objectivesTableId"
    When I click "Associate" after selection of "Permanent Objective Automation" in the table "SelectAwardGoals"
    And I close Modal
    Then I see that "Permanent Objective Automation" has been added in flextable with Id "subAwardStandAlone::objectivesTableId"

  @34775 @awardStanAlone @allKPIAssociation @awardStanAlone @all
  Scenario Outline: Validate the association of KPI to Award
    When I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
    Then I see that "<EGMS Id>" has been added in flextable with Id "subAwardStandAlone::kpiTableId"
    Examples:
      | EGMS Id  |
      | KPI-0419 |

  @awardStanAlone @allRiskAssessmentApprovalAndActivation @awardStanAlone @all
  Scenario: Risk Assessment approval in an award
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
    Then I see status in Progress-bar is "Active" and is "green"

  @awardStanAlone @allApproverSelection @awardStanAlone @all
  Scenario: Validate the assignment of Approvers for the award
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "subAwardStandAlone::approversTableId"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "subAwardStandAlone::approversTableId"
    And I fill in the "Automation FO" for the Approver details
    And I close Modal
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "subAwardStandAlone::approversTableId"
    When I fill in the "Automation EXE" for the Approver details
    And I close Modal
    Then I see that "Automation EXE" has been added in flextable with Id "subAwardStandAlone::approversTableId"

  @awardStanAlone @allSendToRecipientBeforeApproval @awardStanAlone @all
  Scenario Outline: Validate the assignment of Approvers for the award
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    Then I click on "Send to Subrecipient" in the page details
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review |

  @awardStanAlone @allAcceptanceByRecipientBeforeApproval @awardStanAlone @all
  Scenario Outline: Validate the assignment of Approvers for the award
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Type>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Type>" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see that "Subaward" is in "Created" status
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review |

  @awardStanAlone @allReviewerAssignment @awardStanAlone @all
  Scenario Outline: Validate the assignment of Reviewer for the award
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Type>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Type>" inside table
    And I click on "Accept" in the page details
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
    Then I see that "Automation FO" has been added in flextable with Id "subAwardStandAlone::peerReviewersTableId"
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Permanent Award for Automation | Permanent Award for Automation | Subaward Review |

  @awardStanAlone @allReviewerInitiation @awardStanAlone @all
  Scenario Outline: Validate initiation of review for the award
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
      | Actions    | Step 1        | Step 2        | Step 3                | Step 4            |
      | Login      | Grants Portal | SUBPORTAL     |                       |                   |
      | Navigation | Grants        | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start         | Accept        | Accept after Approval | OK                |
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
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review |

  @awardStanAlone @allReviewComplete @awardStanAlone @all
  Scenario Outline: Validate completion of review for the award
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    When I re-login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Type1>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Type1>" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardStandAlone::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "subAwardStandAlone::peerReviewersTableId"
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review | Review Grantor Award |

  @awardStanAlone @allSubmissionForApproval @awardStanAlone @all
  Scenario Outline: Validate award submission for approval
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "Review Grantor Award"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
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
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review |

  @awardStanAlone @allApproval @awardStanAlone @all
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "Review Grantor Award"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
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
    Given I re-login to "As a Grantor" app as "Automation PM" user
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "Automation FO" user
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "Automation EXE" user
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review |

  @awardStanAlone @allSendToRecipientAfterApproval @awardStanAlone @all
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "Review Grantor Award"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
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
    Given "3" Approvers "PM,FO,EXE" approve the record "<Type1>"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I click on "Send to Subrecipient after Approval" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                    |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review | Approve Grantor Subaward |

  @awardStanAlone @allAcceptanceByRecipientAfterApproval @awardStanAlone @all
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "Record Id" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "Review Grantor Award"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
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
    Given "3" Approvers "PM,FO,EXE" approve the record "<Type1>"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Type1>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Award Name>" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see that "Subaward" is in "Accepted" status
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                    |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review | Approve Grantor Subaward |

  @awardStanAlone @allActivation @awardStanAlone @all
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type2>" with comments "Automation Award accepted"
      | Actions    | Step 1 | Step 2        | Step 3                | Step 4            |
      | Navigation | Grants | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start  | Accept        | Accept after Approval | OK                |
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "<Award Name>"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Type>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
      | Actions    | Step 1 | Step 2        | Step 3                | Step 4            |
      | Navigation | Grants | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start  | Accept        | Accept after Approval | OK                |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                     | Grant Name                     | Type            |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review |

  @awardStanAlone @allSiteVisit @awardStanAlone @all
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      #| Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "Review Grantor Award"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
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
    Given "3" Approvers "PM,FO,EXE" approve the record "<Type1>"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "<Type2>" with comments "Automation Award accepted"
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
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click modal button "Save And Close"
    And I click on "Cancel" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                    | Type2           |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review | Approve Grantor Subaward | Subaward Review |

  @awardStandAloneDeskReview @awardStandAlone
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      #| Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "Review Grantor Award"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
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
    Given "3" Approvers "PM,FO,EXE" approve the record "<Type1>"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "<Type2>" with comments "Automation Award accepted"
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
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save And Close"
    And I click on "Cancel" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                    | Type2           |
      | Permanent Award For Automation | Permanent Award For Automation | Subaward Review | Approve Grantor Subaward | Subaward Review |

  @awardHappyPathStandAlone @awardStandAlone
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--126,Automation Grant Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
     # | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Grant Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--126         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID  | Target |
      | KPI-0419 | 10     |
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
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Type>" with comments "Automation Award accepted"
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
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    Given Review is completed as user "FO" for the record "Review Grantor Award"
      | Actions             | Step 1            | Step 2 | Step 3                       | Step 4        |
      | Reviewer Navigation | As a Grantor      | Grants | Pending Tasks                | My Tasks      |
      | FlexTable           | PhasePendingTasks | Start  | flexGridGrantorAwardReviewer | Enter Review  |
      | Enter Review        | Sent for Review   | Passed | Save                         | Submit Review |
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
    Given "3" Approvers "PM,FO,EXE" approve the record "<Type1>"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "<Type2>" with comments "Automation Award accepted"
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
      | Award Name                     | Grant Name                     | Type            | Type1                    | Type2           |
      | Permanent Award for Automation | Permanent Award For Automation | Subaward Review | Approve Grantor Subaward | Subaward Review |