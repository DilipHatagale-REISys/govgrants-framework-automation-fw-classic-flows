@awardFromFDM @regression
Feature: Validate all scenarios in the Award from FDM

  Background: Create Award from FDM
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    Given I delete the record "Automation Announcement for FDM" from the object "FDM"
    Given I create a subaward from the Announcement "Automation Announcement for FDM" for the Application "Automation Application for FDM" as user "EXE"
      | Actions    | Step 1          | Step 2       | Step 3                                | Step 4                                  |
      | Navigation | As a Grantor    | Applications | Application Review                    | Funding Decision Memo (FDM)             |
      | FlexTable  | FDMList1        | View         | Approved Funding Decision Memos (FDM) | flexGridFundingDecisionMemoApplications |
      | Buttons    | Create Subaward |              |                                       |                                         |
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    Given I get the "EGMS ID"

  @38213 @allCreation @smoke
  Scenario: Creation of an award
    Then I see status in Progress-bar is "Created" and is "green"

  @38217 @Edition
  Scenario: Edition of an award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @awardPaymentRequestSchedule @smoke
  Scenario: Payment Request Schedule in an award
    When I navigate to "Management" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "subAwardFromFDM::paymentRequestSchedulesTableId"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Payment Request" has been added in flextable with Id "subAwardFromFDM::paymentRequestSchedulesTableId"

  @awardProgressReportSchedule @smoke
  Scenario: Progress Report Schedule in an award
    When I navigate to "Management" sub tab
    When I click on "Edit" icon for "Progress Report" inside flex table with id "subAwardFromFDM::progressReportSchedulesTableId"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Progress Report" has been added in flextable with Id "subAwardFromFDM::progressReportSchedulesTableId"

  @fdmRiskAssessmentApprovalAndActivation
  Scenario: Risk Assessment approval in an award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    Then I see status in Progress-bar is "Active" and is "green"

  @awardApproverSelection
  Scenario: Validate the assignment of Approvers for the award
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "GrantorAwardRolesAndResponsibilitiesFlexToggle"

  @awardSendToRecipientBeforeApproval
  Scenario Outline: Validate the assignment of Approvers for the award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I associate "2" records "FA--148,Automation SPA"
      | Actions     | Step 1   | Step 2    | Step 3                       | Step 4 | Step 5                     |
      | Associate 1 | Budget   | Associate | flexGridAwardFundingAccounts | Add    | SelectAwardFundingAccounts |
      | Associate 2 | Overview | Associate | flexGridSubawardContact      | Add    | AssociateSubawardContacts  |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::associateContactTableId" by clicking "Edit" :
      | Title          | Project Role   | Is Key Personnel |
      | Automation SPA | Fiscal Contact | Checked          |
    When I navigate to "Budget" sub tab
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 500         |
      | FA--148         | 500         |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subawardsTableId"
    And I navigate to "Responsibilities" tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardAcceptanceByRecipientBeforeApproval @smoke
  Scenario Outline: Validate the assignment of Approvers for the award
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
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
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardFromFDM::subawardsTableId"
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardReviewerAssignment
  Scenario: Validate the assignment of Reviewer for the award
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I see that "Automation FO" has been added in flextable with Id "subAwardFromFDM::peerReviewersTableId"

  @awardReviewerInitiation @smoke
  Scenario Outline: Validate initiation of review for the award
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    Then I see that "Sent for Review" has been added in flextable with Id "subAwardFromFDM::peerReviewersTableId"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardReviewComplete
  Scenario Outline: Validate completion of review for the award
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "subAwardFromFDM::peerReviewersTableId"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardSubmissionForApproval  @smoke
  Scenario Outline: Validate award submission for approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
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
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardApproval
  Scenario Outline: Validate award Approval by respective approvers
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
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
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "Green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardSendToRecipientAfterApproval @smoke
  Scenario Outline: Validate award send to subrecipient after approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
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
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I click on "Send to Subrecipient" in the page details
    Then I see that "Status" is in "Sent to Subrecipient after Approval" status
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardAcceptanceByRecipientAfterApproval
  Scenario Outline: Validate award acceptance by subrecipient after approval
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
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
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    Then I see status in Progress-bar is "Accepted" and is "Green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardSiteVisit
  Scenario Outline: Validate award site visit creation
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardDeskReview
  Scenario Outline: Validate award desk review creation
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |

  @awardHappyPathFromFDM @smoke
  Scenario Outline: Validate award happy path
    Given I complete the fields from the sheet "Edition" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 08/01/2019 | 12/10/2019 |
    Given I edit the following rows inline in flex table with id "subAwardFromFDM::fundingAccountTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--77          | 2000        |
    And I edit the following rows inline in flex table with id "subAwardFromFDM::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::kpiTableId" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule_FDM" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule_FDM" in excel "Award_Field_Values.xlsx"
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
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "subAwardFromFDM::peerReviewersTableId" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "subAwardFromFDM::peerReviewersTableId"
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
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    Given I click on "Complete Review" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Activated" and is "green"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Application for FDM | Automation Application for FDM |