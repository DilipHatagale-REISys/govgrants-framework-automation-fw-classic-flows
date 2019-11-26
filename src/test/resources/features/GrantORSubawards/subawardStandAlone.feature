@grantAndAward @awardStandAlone @regression
Feature: Validate all scenarios in the Stand Alone Award and Grant

  Background: Create Award
    Given I delete the record "Automation Execution Award" from the object "Award"
    And I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"

  @51128 @51129 @awardCreationAndEdition
  Scenario: Creation of an award and edition of an award
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Then I collect all the soft asserts

  @51130 @awardStandAloneAddContactsKeyPersonnel
  Scenario Outline: Associate a Key Contact
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---"
    When I perform quick search for "<Contact>" in "---subAwardStandAlone:-:keyContactsTableId---" panel
    When I click "Add" after selection of "<Contact>" in the table "---subAwardStandAlone:-:keyContactsTableId---"
    When I close "Associate Contacts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
      | Automation SPA | Other                    |                  |
    Then I see that "Automation SPA" has been added in flextable with Id "---subAwardStandAlone:-:associatedContactsTableId---"
    Examples:
      | Contact        |
      | Automation SPA |

  @51131 @awardStandAloneAddFundingAccount @smoke
  Scenario: Funding Account budget addition to award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    Then I see that "{SavedValue:fundingAccount}" has been added in flextable with Id "---subAwardStandAlone:-:fundingAccountsTableId---"

  @51132 @allFocusAreaAssociation @smoke
  Scenario Outline: Validate the association of Focus Area to Award
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "<Focus Area>" in "---subAwardStandAlone:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "<Focus Area>" in the table "---subAwardStandAlone:-:associateFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 0          | 3650     |
    Then I see that "<Focus Area>" has been added in flextable with Id "---subAwardStandAlone:-:focusAreaTableId---"
    Examples:
      | Focus Area                       |
      | Automation Permanent Focus Area2 |

  @51133 @awardStandAloneBudgetAddition
  Scenario: Budget addition to Award
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 10         | 90             |
    Then I see that "$10.00" has been added in flextable with Id "---subAwardStandAlone:-:subAwardBudgetTableId---"

  @51134 @allObjectiveAssociation
  Scenario: Validate the association of Objective to Award
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "SelectAwardGoals"
    Then I see that "Automation Permanent Objective2" has been added in flextable with Id "---subAwardStandAlone:-:objectivesTableId---"

  @51135 @allKPIAssociation @smoke
  Scenario Outline: Validate the association of KPI to Award
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:kpiTableId---"
    When I enter "KPI" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    Then I see that "<Title>" has been added in flextable with Id "---subAwardStandAlone:-:kpiTableId---"
    Examples:
      | Title                                   |
      | Automation Permanent KPI for Regression |

  @51136 @51128 @51129 @awardCreateAndEdit @allRiskAssessmentApprovalAndActivation @smoke
  Scenario: Risk Assessment approval in an award
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Then I softly see status in Progress-bar is "Active" and is "Green"
    Then I collect all the soft asserts

  @51137 @65397 @allApproverSelection
  Scenario: Validate the assignment of Approvers for the award | To verify that approvers can be added in the subaward phase when login by award owner as a PM
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I softly see the following messages in the page details contains:
    | Saved Successfully! |
    Then I softly see that "Automation EXE" has been added in flextable with Id "---subAwardStandAlone:-:awardApproversTableId---"
    Then I collect all the soft asserts

  @51147  @51148 @65415 @allSendToRecipientAndAcceptanceBySRBeforeApproval @smoke
  Scenario Outline: Validate the award send to recipient and acceptance by recipient before approval
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "flexGridRelatedAwards1"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "GrantorTermsandConditions"
    Then I softly see the following messages in the page details contains:
      | All mandatory terms & conditions within Project Period are already associated. |
    Then I collect all the soft asserts
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51144 @51145 @51146 @allReviewerAssignmentAndInitiationAndCompletion  @smoke
  Scenario Outline: Validate reviewer assignment, initiation of review and completion of review
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    Then I softly see that "Automation FO" has been added in flextable with Id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardStandAlone:-:peerReviewersTableId---"
    Then I collect all the soft asserts
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51142  @51143 @allSubmissionForApproval @allApproval
  Scenario Outline: Validate award submission for approval and approval of award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    Then I collect all the soft asserts
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51140 @51141 @allSendToRecipientAndAcceptanceAfterApproval
  Scenario Outline: Acceptance of award by receipient after approval
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Accept after Approval" in the page details
    Then I softly see status in Progress-bar is "Accepted" and is "Green"
    Then I collect all the soft asserts
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51139 @allActivation @smoke
  Scenario Outline: all activation
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
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
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "Total Records:120" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"

  @53838 @editionOfPaymentRequestSchedule @mahadev
  Scenario: Verify that Payment Request Schedule is editable to internal user on draft award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see field "Description" as "Automation Test Description"

  @53840 @paymentRequestSchedulesUpdateOnDraftAward @mahadev
  Scenario: Verify that Payment Request Schedule is editable to internal user on draft award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    And I enter value "Quarterly" into field "Frequency__c"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Payment Request"
    Then I see total records count "Total Records:120" in flex table "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"

  @53911 @ValidateAdvancePaymentRequestcreation @mahadev
  Scenario Outline: Advance Payment Request creation when Advance Payment Allowed selected as Yes
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
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
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                 | Grant Name                 | User |
      | Automation Execution Award | Automation Execution Award | PM   |
      | Automation Execution Award | Automation Execution Award | FO   |

  @55311 @ProgressReportScheduleUpdateOnActiveAward @mahadev
  Scenario Outline: Validate progress report schedules update on active award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I get the "EGMS ID"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "ProgressReport_Edition" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:10" in flex table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @55297 @EditProgressReportSchedule @mahadev
  Scenario: Validate user can edit progress report schedule on draft award
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter value "Calendar" into field "ScheduleBase__c"
    And I click modal button "Save"
    Then I see field "Schedule Base" as "Calendar"

  @55296 @ViewProgressReportScheduleOnDraftAward @mahadev
  Scenario: Validate user can view progress report schedule on draft award
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then I see field "Schedule Title" as "Automation Progress Report"

  @55289 @ViewProgressReportScheduleAutoCreatedOnDraftAward @mahadev
  Scenario: Validate user can view progress report schedule on draft award
    And I navigate to "Terms" sub tab
    Then I see value "Not Applicable" for title "Frequency" inside table "---subAwardStandAlone:-:progressReportScheduleTableId---"

  @55298 @DownloadProgressReportInPDF @jitendra
  Scenario: Validate user can Download the progress created Report in PDF format.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I click on top right parallel lines bar for "Progress Reports Schedule"
    And I select "Download as PDF" from parallel lines dropdown of "Progress Reports Schedule"
    And I download the file
    Then I verify that "pdf" file is downloaded

  @55306 @DownloadProgressReportInXLS @jitendra
  Scenario: Validate user can Download the progress created Report in XLS format
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I click on top right parallel lines bar for "Progress Reports Schedule"
    And I select "Download as XLS" from parallel lines dropdown of "Progress Reports Schedule"
    Then I verify that "xls" file is downloaded

  @55290 @SelectDesiredFrequencyAsMonth @jitendra
  Scenario: Verify While creating schedule user should be allowed to select the Desired Frequency as Monthly
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:120" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @55301 @SelectDesiredFrequencyAsQuarterly @jitendra
  Scenario: Verify While creating schedule user should be allowed to select the Desired Frequency as Quarterly.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Quarterly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:4" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @55293 @ScheduleEndDateAfterStartDate @jitendra
  Scenario: Verify While creating schedule user is not allowed to select the Schedule End Date after Project Period End Date.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "ScheduledEndDateAfterStartDate" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Schedule End date cannot be after Project Period End Date |

  @55300 @SelectDesiredFrequencyAsBiMonthly @jitendra
  Scenario: Verify While creating schedule user should be allowed to select the Desired Frequency as Bi Monthly.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report BiMonthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:6" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @55299 @SelectDesiredFrequencyAsAnnually @mahadev
  Scenario: Verify While creating schedule user should be allowed to select the Desired Frequency as annually.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Annually" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:1" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @55302 @SelectDesiredFrequencyAsSemiAnnually @mahadev
  Scenario: Verify While creating schedule user should be allowed to select the Desired Frequency as semi-annually.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Semi-Annually" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:2" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @55303 @SelectDesiredFrequencyAsMonthly @mahadev
  Scenario: Verify While creating schedule user should be allowed to select the Desired Frequency as monthly.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:12" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @55291 @ScheduleBaseAsReportingPeriod @jitendra
  Scenario: Verify While creating schedule user should be allowed to select the Desired Frequency as monthly
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see field "Schedule Base" as "Reporting Period"

  @55294 @verifyUserIsNotAllowedToSelectProgressReportScheduleStartDateBeforeBudgetPeriodStartDate @mahadev
  Scenario: Verify While creating schedule user is not allowed to select the Schedule Start Date which is before Budget period start date on draft award
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Error" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see the text containing :
      | Schedule Start date cannot be before Budget Period Start Date. |

  @55292 @verifyUserIsAllowedToSelectProgressReportScheduleStartDate @mahadev
  Scenario: Verify While creating progress report schedule user should be allowed to select the start date
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Fixed Date" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see field "Schedule Start Date" as "2/2/2024"

  @55309 @verifyUserCannotSubmitAwardforApprovalTillPaymentRequestScheduleNotAdded @mahadev
  Scenario Outline: Verify User cannot submit award for approval till Payment Request Schedule details is not added
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details contains:
      | Terms Tab - Provide the Payment Request Schedule details before submitting for approval |
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @55295 @veifyViewAccessForProgressReportsSchedulesOnDraftAward @mahadev
  Scenario Outline: Verify that system allows EXE, PO, FD, and FO can see the created Progress Report Schedules
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Terms" sub tab
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Then I see field "Frequency" as "Monthly"
    Examples:
      | User | Grant Name                 | Award Name                 |
      | EXE  | Automation Execution Award | Automation Execution Award |
      | FO   | Automation Execution Award | Automation Execution Award |

  @45728 @veifyNonAwardOwnerCanNotEditSchedule @mahadev
  Scenario Outline: Verify non award owner cannot edit Progress Report Schedule
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Monthly" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Terms" sub tab
    Then I cannot see row level action button "Edit" against "Progress Report" in flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Grant Name                 | Award Name                 |
      | Automation Execution Award | Automation Execution Award |

  @45735 @validateUserCannotSelectschdeuleStartDateBeforeBudgetPeriodStartDate @mahadev
  Scenario: Verify While creating schedule user is not allowed to select the Schedule Start Date before Budget Period Start Date
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report StartDate Error" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Schedule Start date cannot be before Budget Period Start Date |

  @57692 @SelectDesiredFrequencyAsMonthlywithScheduleBaseAsReportingPeriod @mahadev
  Scenario: Verify functionality of Desired Frequency as Monthly with Schedule Base type as Reporting period
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report MoreThanOneyear" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:16" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @45740 @SelectDesiredFrequencyAsMonthlywithScheduleBaseAsReportingPeriod @mahadev
  Scenario: Verify functionality of Desired Frequency as Monthly with Schedule Base type as Reporting period
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:6" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @35041 @SelectDesiredFrequencyAsMonthlyWithSchdeuleBaseAsCalendar @mahadev
  Scenario: Verify while creating schedule user should be allowed to select the desired frequency as monthly with schdeule base as calendar
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "ProgressReportCalendarSchedule" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:12" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @45725 @validateSubRecipientCannotEditSchedule @mahadev
  Scenario Outline: Verify if subaward is sent to sub-recipient for Accept action then external user should not have access to modify Schedule
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I navigate to "Terms" sub tab
    Then I cannot see row level action button "Edit" against "Progress Report" in flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Grant Name                 | Award Name                 |
      | Automation Execution Award | Automation Execution Award |

  @51110 @validateSubRecipientCannotEditSchedule
  Scenario Outline: Verify If Subaward is Send to Sub-recipient for Edit action than external user should not have access to modify Schedule.
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    And I navigate to "Terms" sub tab
    Then I cannot see row level action button "Edit" against "Progress Report" in flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Grant Name                 | Award Name                 |
      | Automation Execution Award | Automation Execution Award |

  @45729 @progressReportAnnuallyWithLessThan365DateError @jitendra
  Scenario: Verify if annually frequency is selected and schedule dates are less than year it show validation message.
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "AnnualError" values from "Errors.xlsx"
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | The time between Schedule Start Date and Schedule End Date must be greater than or equal to 365 days if Annually frequency is selected. |

  @45731 @progressReportMonthyWithLessThan28DaysDateError @jitendra
  Scenario: Verify if Monthly frequency is selected and schedule period is less than month than Validation message is shown.
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "MonthlyError" values from "Errors.xlsx"
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | The time between Schedule Start Date and Schedule End Date must be greater than or equal to 28 days if Monthly frequency is selected. |

  @45736 @SelectDesiredFrequencyAsBiMonthlyBasedOnGivenDate @jitendra
  Scenario: Verify functionality of Desired Frequency as Bi Monthly with Schedule Base type as Reporting period.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Bi-MonthlyForEightRecord" values from "Errors.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:8" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @45727 @SelectDesiredFrequencyAsSemiAnnuallyBasedOnGivenDate @jitendra
  Scenario: Verify the functionality of Desired Frequency as Semi-Annually with Schedule Base type as Reporting period.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Bi-MonthlyForEightRecord" values from "Errors.xlsx"
    And I enter value "Semi-Annually" into field "Frequency__c"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:3" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @45734 @SelectDesiredFrequencyAsMonthlywithScheduleBaseAsReportingPeriod @jitendra
  Scenario: Verify Reporting Period End Date is same as the Schedule End Date.
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the field labeled "Schedule End Date" as "ScheduleEndDate"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    And I navigate to last page in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    And I get the value from row "last row" for column name "Reporting Period End Date" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    Then I verify that the Schedule end date is matching with Reporting Period End Date

  @55315 @SelectDesiredFrequencyAsMonthlywithScheduleBaseAsReportingPeriod @jitendra
  Scenario: Verify Reporting Period Start Date is same as the Schedule Start Date.
    When I click on "Edit" in the page details
    And I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "ProgressReportQuartelyReporting" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the field labeled "Schedule Start Date" as "ScheduleStartDate"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    And I get the value from row "1" for column name "Reporting Period Start Date" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"
    Then I verify that the Schedule start date is matching with Reporting Period start Date

  @58735 @verifyProgressReportScheduleAutoCreatedWithFrequencyNotApplicable @mahadev
  Scenario Outline: Verify that Progress Reports Schedule is auto created with the frequency as 'not applicable' on draft award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I navigate to "Terms" sub tab
    Then I see value "Not Applicable" for title "Frequency" against the value "Progress Report" inside table "---subAwardStandAlone:-:progressReportScheduleTableId---"
    Examples:
      | Grant Name                 | Award Name                 |
      | Automation Execution Award | Automation Execution Award |

  @34933 @SelectDesiredFrequencyAsAnnuallyBasedOnGivenDate @jitendra
  Scenario: Verify the functionality of Desired Frequency as Annually with Schedule Base type as Reporting period.
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Bi-MonthlyForEightRecord" values from "Errors.xlsx"
    And I enter value "Annually" into field "Frequency__c"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I expand nested table containing column value "Progress Report"
    Then I see total records count "Total Records:2" in flex table "---subAwardStandAlone:-:progressReportScheduleId---"

  @58823 @AwardOwnerCancreateRAAnyTimeBeforeActivatingAward @keerti
  Scenario Outline: Validate when the Award is in Submitted for Approval and the Award Owner can still create the Risk Assessment any time before Activating the Award
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @45752 @awardDeletion  @mahadev
  Scenario Outline: Deletion of award by owner
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "Delete" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I do not see value "<Grant Name>" for title "Grant Title" inside table "---subAwardStandAlone:-:activeGrantsTableId---"
    Examples:
      | Grant Name                 |
      | Automation Execution Award |

  @45755 @removeObjectivesFromAward  @mahadev
  Scenario: Validate the removing of objectives from award
    When I navigate to "Performance" sub tab
    And I click on "Remove" icon for "Automation Permanent Objective" inside flex table with id "---subAwardStandAlone:-:objectivesTableId---"
    Then I do not see value "Automation Permanent Objective" for title "Title" inside table "---subAwardStandAlone:-:objectivesTableId---"

  @45756 @validateAwardRejectionByProgramApprover @mahadev
  Scenario Outline: Validate award Rejection by Program approver
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I get the "EGMS ID"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I click on "Disapprove" on the approval decision box
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @45764 @validateAwardRejectionByExecutiveApprover @mahadev
  Scenario Outline: Validate award Rejection by Executive approver
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I get the "EGMS ID"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Disapprove" on the approval decision box
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @45762 @VarifyAwardRejectionByFiscalApprover @keerti
  Scenario Outline: Validate award Rejection by Fiscal approver
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Disapprove" on the approval decision box
    Then I see status in Progress-bar is "Rejected" and is "red"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @45739 @VarifyAwardRejectionByRecipientBeforeApproval @keerti
  Scenario Outline: Validate the rejection of award by recipient before approval
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Reject" in the page details
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @45754 @VarifyKPIRemovingFromAward @keerti
  Scenario: Validate removing KPI from Award
    When I navigate to "Performance" sub tab
    When I click on "Remove" icon for "Automation Permanent KPI for Regression" inside flex table with id "---subAwardStandAlone:-:kpiTableId---"
    Then I do not see value "Automation Permanent KPI for Regression" for title "Title" inside table "---subAwardStandAlone:-:kpiTableId---"

  @45742 @validateRemovalOfFocusArea  @mahadev
  Scenario: Validate removal of focus area
    When I navigate to "Budget" sub tab
    When I click on "Remove" icon for "Automation Permanent Focus Area" inside flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    Then I do not see value "Automation Permanent Focus Area" for title "Title" inside table "---subAwardStandAlone:-:focusAreaTableId---"

  @65228 @VerifyRelatedFocusAreasField  @keerti
  Scenario Outline: Verify Key Performance Indicators (KPIs) value Performance tab Subaward overview is same as Program Key Performance Indicators (KPIs) table setup Tab.
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I perform quick search for "Automation Permanent Internal Program" in "Programs" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside table
    When I navigate to "Setup" sub tab
    When I perform quick search for "Information Technology" in "ProgramKeyOutcomes" panel
    And I click on "View" icon for "Information Technology" inside table
    And I save the field labeled "Domain" as "Domain"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I perform quick search for "<Award Name>" in "flexGridRelatedAwards1" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Performance" sub tab
    Then I see value "{SavedValue:domain}" for title "Domain" inside table "inlineEditGridGrantorAwardKeyOutcomes"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @65227 @VerifyRelatedFocusAreasField  @keerti
  Scenario Outline: Verify Key Performance Indicators (KPIs) value Performance tab Subaward overview is same as Program Key Performance Indicators (KPIs) table setup Tab.
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I perform quick search for "Automation Permanent Internal Program" in "Programs" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside table
    When I navigate to "Setup" sub tab
    And I get the value from row "1" for column name "Organization Name" in flex table "RelatedProgramGoalsandObjectives"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I perform quick search for "<Award Name>" in "flexGridRelatedAwards1" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Performance" sub tab
    Then I see value "{SavedValue:lastValueFromTableForCol}" for title "Organization Name" inside table "GrantorAwardGoalsObjectives"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @65226 @VerifyRelatedFocusAreasField  @keerti
  Scenario Outline: Verify Focus Area field value Budget tab Subaward overview is same as Program Related Focus Areas table setup Tab.
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I perform quick search for "Automation Permanent Internal Program" in "Programs" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside table
    When I navigate to "Setup" sub tab
    And I get the value from row "1" for column name "Title" in flex table "flexGridGrantorServiceAreasProgram"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I perform quick search for "<Award Name>" in "flexGridRelatedAwards1" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Budget " sub tab
    Then I see value "{SavedValue:lastValueFromTableForCol}" for title "Title" inside table "flexGridEnhancedGrantorAwardServiceAreas"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @65400  @validateAfterSendToSubreciepientSubreciepientCanViewRecord  @keerti
  Scenario Outline: To verify that  after clicking on the "send to subreciepient button " from the award owner profile after creating subaward is visible to the Subreciepient.
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Add" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "Record Id" in "flexGridRecipientActiveGrants" panel
    Then I see value "Draft" for title "Status" inside table "flexGridRecipientActiveGrants"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

