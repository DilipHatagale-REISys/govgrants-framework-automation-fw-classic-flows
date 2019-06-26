@awardStandAlone @regression
Feature: Validate all scenarios in the Stand Alone Award and Grant

  Background: Create Award
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    Given I delete the record "Automation Execution Award" from the object "Progress Report"
    Given I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    Given I click on "View" icon for "Created" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I get the "EGMS ID"

  @51128 @awardCreation @smoke
  Scenario: Creation of an award
    Then I see status in Progress-bar is "Created" and is "green"

  @51129 @awardStandAloneEdition
  Scenario: Edition of an award
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @51130 @awardStandAloneAddContactsKeyPersonnel
  Scenario Outline: Associate a Key Contact
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---"
    When I perform quick search for "<Contact>" in "---subAward_StandAlone:-:key_Contacts_TableId---" panel
    When I click "Add" after selection of "<Contact>" in the table "---subAward_StandAlone:-:key_Contacts_TableId---"
    And I close modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
      | Automation SPA | Other                    |                  |
    Then I see that "Automation SPA" has been added in flextable with Id "---subAward_StandAlone:-:associated_Contacts_TableId---"
    Examples:
      | Contact        |
      | Automation SPA |

  @51131 @awardStandAloneFundingAccount @smoke
  Scenario Outline: Funding Account budget addition to Award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "<EGMS Id>" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close Modal
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    Then I see that "<EGMS Id>" has been added in flextable with Id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    Examples:
      | EGMS Id |
      | FA--01  |

  @51132 @allFocusAreaAssociation @smoke
  Scenario: Validate the association of Focus Area to Award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:focusArea_TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "popupflextableGAT"
    And I close Modal
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area  | 0          | 3650     |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    Then I see that "Automation Permanent Focus Area2" has been added in flextable with Id "---subAward_StandAlone:-:focusArea_TableId---"

  @51133 @awardStandAloneBudgetEdition
  Scenario: Budget addition to Award
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Then I see that "Construction" has been added in flextable with Id "---subAward_StandAlone:-:subAward_Budget_TableId---"

  @51134 @allObjectiveAssociation
  Scenario: Validate the association of Objective to Award
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:objectives_TableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    And I close Modal
    Then I see that "Automation Permanent Objective2" has been added in flextable with Id "---subAward_StandAlone:-:objectives_TableId---"

  @51135 @allKPIAssociation @smoke
  Scenario Outline: Validate the association of KPI to Award
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:kpi_TableId---"
    When I enter "KPI" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    Then I see that "<Title>" has been added in flextable with Id "---subAward_StandAlone:-:kpi_TableId---"
    Examples:
      | Title                                   |
      | Automation Permanent KPI for Regression |

  @51136 @allRiskAssessmentApprovalAndActivation @smoke
  Scenario: Risk Assessment approval in an award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Active" and is "green"

  @51137 @allApproverSelection
  Scenario: Validate the assignment of Approvers for the award
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "---subAward_StandAlone:-:award_Approvers_TableId---"

  @51148 @allSendToRecipientBeforeApproval
  Scenario Outline: Validate the assignment of Approvers for the award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51147 @allAcceptanceByRecipientBeforeApproval @smoke
  Scenario Outline: Validate the Acceptance by recipient before approval
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51146 @allReviewerAssignment
  Scenario Outline: Validate the assignment of Reviewer for the award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---subAward_StandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I see that "Automation FO" has been added in flextable with Id "---subAward_StandAlone:-:peerReviewersTableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51145 @allReviewerInitiation
  Scenario Outline: Validate initiation of review for the award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---subAward_StandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAward_StandAlone:-:peerReviewersTableId---"
    Then I see that "Sent for Review" has been added in flextable with Id "---subAward_StandAlone:-:peerReviewersTableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51144 @allReviewComplete  @smoke
  Scenario Outline: Validate completion of review for the award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAward_StandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAward_StandAlone:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAward_StandAlone:-:peerReviewersTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "---subAward_StandAlone:-:peerReviewersTableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51143 @allSubmissionForApproval
  Scenario Outline: Validate award submission for approval
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51142 @allApproval
  Scenario Outline: Validate award Approval by respective approvers
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51141 @allSendToRecipientAfterApproval  @smoke
  Scenario Outline: Validate award send to recipient after Approval
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51140 @allAcceptanceByRecipientAfterApproval
  Scenario Outline: Acceptance of award by receipient after approval
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see status in Progress-bar is "Accepted" and is "green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51139 @allActivation @smoke
  Scenario Outline: all activation
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51138 @awardHappyPathStandAlone @awardStandAlone
  Scenario Outline: Validate award Happy path stand alone
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    When I refresh the page
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @53835 @paymentRequestScheduleBlankOnDraftAward @mahadev
  Scenario: Verify that Payment Request Schedule is blank on draft award
    When I navigate to "Management" sub tab
    Then I see field name "Frequency__c" is blank in flex table

  @53837 @paymentRequestSchedulesCreationOnDraftAward @mahadev
  Scenario: Verify that Payment Request Schedule is blank on draft award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "Total Records:120" in flex table "---subAward_StandAlone:-:paymentRequest_Schedules_TableId---"

  @53838 @editionOfPaymentRequestSchedule @mahadev
  Scenario: Verify that Payment Request Schedule is editable to internal user on draft award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    And I enter value "Quarterly" into field "Frequency__c"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    Then I see value "Quarterly" for title "Frequency" against the value "Payment Request" inside table "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"

  @53840 @paymentRequestSchedulesUpdateOnDraftAward @mahadev
  Scenario: Verify that Payment Request Schedule is editable to internal user on draft award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    And I enter value "Quarterly" into field "Frequency__c"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "Total Records:40" in flex table "---subAward_StandAlone:-:paymentRequest_Schedules_TableId---"

  @53911 @ValidateAdvancePaymentRequestcreation @mahadev
  Scenario Outline: Advance Payment Request creation when Advance Payment Allowed selected as Yes
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---"
    When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAward_StandAlone:-:award_Funding_Accounts_TableId---"
    And I close modal by clicking the top right x button
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:focusArea_TableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAward_StandAlone:-:funding_Accounts_TableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:kpi_TableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAward_StandAlone:-:paymentRequest_Schedule_TableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAward_StandAlone:-:progressReport_Schedule_TableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAward_StandAlone:-:risk_Assessment_TableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:riskAssessment_Approver_TableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:associated_Contacts_TableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAward_StandAlone:-:award_Approvers_TableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAward_StandAlone:-:pending_Task_TableId---"
    And I click on "Approve" on the approval decision box
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAward_StandAlone:-:pending_Task_TableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Awards, Amendments" subheader on left panel
    And I click toggle button to select "Active Grants"
    When I perform quick search for "<Grant Name>" in "---paymentRequest:-:recipient_Grant_Table_Id---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---paymentRequest:-:recipient_Grant_Table_Id---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipient_Award_Table_Id---"
    When I navigate to "Requests" sub tab
    And I click on top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @38205 @DraftAwardNavigation @mahadev
  Scenario Outline: Navigation to draft award by FO User
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "---subAward_StandAlone:-:active_Grants_TableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |