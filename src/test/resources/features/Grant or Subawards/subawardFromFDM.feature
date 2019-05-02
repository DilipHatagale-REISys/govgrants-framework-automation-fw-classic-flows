@awardFromFDM @regression
Feature: Validate all scenarios in the Award from FDM

  Background: Create Award from FDM
    Given I delete the record "Automation Grant Award for Post Award" from the object "FDM"
    Given I create a subaward from the Announcement "Execution Announcement for Automation" for the Application "Automation App Jan25" as user "EXE"
      | Actions    | Step 1          | Step 2       | Step 3                                | Step 4                                  |
      | Navigation | As a Grantor    | Applications | Application Review                    | Funding Decision Memo (FDM)             |
      | FlexTable  | FDMList1        | View         | Approved Funding Decision Memos (FDM) | flexGridFundingDecisionMemoApplications |
      | Buttons    | Create Subaward |              |                                       |                                         |
    Given I login and view the "Draft" award "Created" with name "Automation Grant Award for Post Award" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I get the "EGMS ID"

  @38213  @allCreation  @smoke
  Scenario: Creation of an award
    Then I see status in Progress-bar is "Created" and is "green"

  @38217  @Edition 
  Scenario: Edition of an award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @50984 @awardPaymentRequestSchedule  @smoke
  Scenario: Payment Request Schedule in an award
    When I navigate to "Management" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "subAwardFromFDM::paymentRequestSchedulesTableId"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Payment Request" has been added in flextable with Id "subAwardFromFDM::paymentRequestSchedulesTableId"

  @50985 @awardProgressReportSchedule  @smoke
  Scenario: Progress Report Schedule in an award
    When I navigate to "Management" sub tab
    When I click on "Edit" icon for "Progress Report" inside flex table with id "subAwardFromFDM::progressReportSchedulesTableId"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Progress Report" has been added in flextable with Id "subAwardFromFDM::progressReportSchedulesTableId"

  @50986 @fdmRiskAssessmentApprovalAndActivation 
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

  @50989 @awardApproverSelection
  Scenario: Validate the assignment of Approvers for the award
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" icon for "Program Approver" inside flex table with id "subAwardFromFDM::approversTableId"
    When I fill in the "Automation PM" for the Approver details
    And I close Modal
    When I click on "Edit" icon for "Fiscal Approver" inside flex table with id "subAwardFromFDM::approversTableId"
    And I fill in the "Automation FO" for the Approver details
    And I close Modal
    And I click on "Edit" icon for "Executive Approver" inside flex table with id "subAwardFromFDM::approversTableId"
    When I fill in the "Automation EXE" for the Approver details
    And I close Modal
    Then I see that "Automation EXE" has been added in flextable with Id "subAwardFromFDM::approversTableId"

  @50988 @awardSendToRecipientBeforeApproval 
  Scenario Outline: Validate the award Send To Recipient Before Approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    Then I click on "Send to Subrecipient" in the page details
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50990 @awardAcceptanceByRecipientBeforeApproval @smoke
  Scenario Outline: Validate the award Acceptance By Recipient Before Approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 100000      |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | EXEcutive Approver |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Award Name>" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see that "Subaward" is in "Created" status
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50991 @awardReviewerAssignment 
  Scenario Outline: Validate the assignment of Reviewer for the award
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
      | Actions    | Step 1        | Step 2        | Step 3                | Step 4            |
      | Login      | Grants Portal | SUBPORTAL     |                       |                   |
      | Navigation | Grants        | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start         | Accept        | Accept after Approval | OK                |
    When I re-login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Award Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I enter "Reviewer" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Automation FO" has been added in flextable with Id "subAwardFromFDM::peerReviewersTableId"
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50992 @awardReviewerInitiation  @smoke
  Scenario Outline: Validate initiation of review for the award
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    When I re-login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Award Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I enter "Reviewer" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    Then I see that "Sent for Review" has been added in flextable with Id "subAwardFromFDM::peerReviewersTableId"
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50993 @awardReviewComplete
  Scenario Outline: Validate completion of review for the award
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    And I assign, initiate a reviewer from sheet "Reviewer" in excel "Award_Field_Values.xlsx"
      | Actions             | Step 1           | Step 2                       | Step 3 |
      | Reviewer Navigation | Responsibilities |                              |        |
      | FlexTable           | New              | flexGridGrantorAwardReviewer | Save   |
      | Send Review         | Send for Review  | Created                      |        |
    When I re-login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    When I click on "Start" icon for "<Award Name>" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "subAwardFromFDM::peerReviewersTableId"
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50994 @awardSubmissionForApproval  @smoke
  Scenario Outline: Validate award submission for approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
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
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50995 @awardApproval 
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
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
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given I re-login to "As a Grantor" app as "PM" user
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" user
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "EXE" user
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Award Name>" in "PhasePendingTasks" panel
    And I click on "Start" icon for "<Award Name>" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50996 @awardSendToRecipientAfterApproval @smoke
  Scenario Outline: Validate award send to subrecipient after approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1 | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
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
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    When I re-login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Award Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Record Id" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    When I click on "Send to Subrecipient after Approval" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "green"
    Examples:
      | Award Name       | Grant Name                               |
      | Automation Grant | Permanent Application(Dr) for Automation |

  @50997 @awardAcceptanceByRecipientAfterApproval 
  Scenario Outline: Validate award acceptance by subrecipient after approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
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
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
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
      | Award Name       | Grant Name                     |
      | Automation Grant | Permanent Award For Automation |

  @50998 @awardActivation  @smoke
  Scenario Outline: Validate award Activation
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
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
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "<Award Name>"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I click on "Send to Subrecipient" in the page details
    Given The subrecipient user "SPI" accepts the award "<Award Name>" with comments "Automation Award accepted"
      | Actions    | Step 1 | Step 2        | Step 3                | Step 4            |
      | Navigation | Grants | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start  | Accept        | Accept after Approval | OK                |
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    When I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name       | Grant Name                     |
      | Automation Grant | Permanent Award For Automation |

  @50999 @awardSiteVisit 
  Scenario Outline: Validate award site visit creation
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
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
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Given "3" Approvers "PM,FO,EXE" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Grants   |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    And I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    Given I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "Record Id" with comments "Automation Award accepted"
      | Actions    | Step 1        | Step 2        | Step 3                | Step 4            |
      | Login      | Grants Portal | SUBPORTAL     |                       |                   |
      | Navigation | Grants        | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start         | Accept        | Accept after Approval | OK                |
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click modal button "Save And Close"
    And I click on "Cancel" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name       |
      | Automation Grant |

  @51000 @awardDeskReview 
  Scenario Outline: Validate award desk review creation
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    Given I select "3" approvers "Automation PM,Automation FO,Automation EXE"
      | Actions    | Step 1                               | Step 2 | Step 3             |
      | Subtab     | Responsibilities                     |        |                    |
      | Approver 1 | GrantorAwardRolesAndResponsibilities | Edit   | Program Approver   |
      | Approver 2 | GrantorAwardRolesAndResponsibilities | Edit   | Fiscal Approver    |
      | Approver 3 | GrantorAwardRolesAndResponsibilities | Edit   | Executive Approver |
    And I click on "Send to Subrecipient" in the page details
    And The subrecipient user "SPI" accepts the award "Record Id" with comments "Automation Award accepted"
      | Actions    | Step 1        | Step 2        | Step 3                | Step 4            |
      | Login      | Grants Portal | SUBPORTAL     |                       |                   |
      | Navigation | Grants        | Pending Tasks | My Tasks              | PhasePendingTasks |
      | Acceptance | Start         | Accept        | Accept after Approval | OK                |
    Given I login and view the "Draft" award "Record Id" with name "<Award Name>" as User "EXE"
      | Actions    | Step 1       | Step 2         | Step 3               | Step 4                        |
      | Navigation | As a Grantor | Grants         | Grants and Subawards | Grants, Subaward & Amendments |
      | FlexTable  | Grants       | ActiveGrants   | View                 |                               |
      | Subaward   | Subawards    | RelatedAwards1 | View                 |                               |
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save And Close"
    And I click on "Cancel" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name       |
      | Automation Grant |

  @51001 @awardHappyPathFromFDM @smoke
  Scenario Outline: Validate award happy path
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--154,Automation Permanent Focus Area"
      | Actions     | Step 1      | Step 2    | Step 3                                 | Step 4    | Step 5                     |
      | Associate 1 | Budget      | Associate | flexGridAwardFundingAccounts           | Add       | SelectAwardFundingAccounts |
      | Associate 2 | Budget      | Associate | inlineEditGridGrantorAwardServiceAreas | Associate | popupflextableGAT          |
      | Associate 3 | Performance | Associate | GrantorAwardGoalsObjectives            | Associate | SelectAwardGoals           |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                               | Start Date | End Date |
      | Automation Permanent Focus Area         | 0          | 500      |
      | Permanent Focus Area for Automation | 0          | 500      |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--154         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Subaward  Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000             | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    And I click on "View" icon for "Record Id" inside flex table with id "subAwardFromFDM::subAwardsTableId"
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subAwardsTableId"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"
    Examples:
      | Award Name                     | Grant Name                     | Type            | Type1                    | Type2           |
      | Permanent Award for Automation | Permanent Award For Automation | Subaward Review | Approve Grantor Subaward | Subaward Review |