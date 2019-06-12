@awardFromFDM @regression
Feature: Validate all scenarios in the Award from FDM

  Background: Create Award from FDM
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    Given I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "FDMList1" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside table without waiting for record
    And I click on "Create Subaward" icon for "Automation Announcement for FDM" inside flex table with id "flexGridFundingDecisionMemoApplications" without waiting for record
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
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Payment Request" has been added in flextable with Id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"

  @awardProgressReportSchedule @smoke
  Scenario: Progress Report Schedule in an award
    When I navigate to "Management" sub tab
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Progress Report" has been added in flextable with Id "---subAwardFromFDM:-:progressReportSchedulesTableId---"

  @fdmRiskAssessmentApprovalAndActivation
  Scenario: Risk Assessment approval in an award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
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
    When I navigate to "Budget" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAwardFundingAccounts"
    When I click "Add" after selection of "FA--39" in the table "SelectAwardFundingAccounts"
    And I close Modal
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridSubawardContact"
    When I click "Add" after selection of "Automation SPA" in the table "AssociateSubawardContacts"
    And I close Modal
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Title          | Project Role   | Is Key Personnel |
      | Automation SPA | Fiscal Contact | Checked          |
    When I navigate to "Budget" sub tab
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 500         |
      | FA--39         | 500         |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardAcceptanceByRecipientBeforeApproval @smoke
  Scenario Outline: Validate the assignment of Approvers for the award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardReviewerAssignment
  Scenario: Validate the assignment of Reviewer for the award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I see that "Automation FO" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"

  @awardReviewerInitiation @smoke
  Scenario Outline: Validate initiation of review for the award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
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
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    Then I see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardReviewComplete
  Scenario Outline: Validate completion of review for the award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
     And I close Modal
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Then I see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    Examples:
      | Award Name                     | Grant Name                     |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardSubmissionForApproval  @smoke
  Scenario Outline: Validate award submission for approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardApproval
  Scenario Outline: Validate award Approval by respective approvers
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardSendToRecipientAfterApproval @smoke
  Scenario Outline: Validate award send to subrecipient after approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardAcceptanceByRecipientAfterApproval
  Scenario Outline: Validate award acceptance by subrecipient after approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardSiteVisit
  Scenario Outline: Validate award site visit creation
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardDeskReview
  Scenario Outline: Validate award desk review creation
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardHappyPathFromFDM @smoke
  Scenario Outline: Validate award happy path
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "inlineEditGridGrantorAwardServiceAreas" by clicking "Edit" :
      | Title                           | Start Date | End Date   |
      | Automation Permanent Focus Area | 6/14/2022 | 9/24/2022 |
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--01          | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "flexGridPaymentSchedules" without waiting for record
    And I enter "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on "Edit" icon for "Progress Report" inside flex table with id "flexGridTnCSchedules" without waiting for record
    And I enter "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I close Modal
    And I click on top right button "New" in flex table with id "flexGridAwardRiskAssessmentView"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
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
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
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
      | Automation Announcement for FDM | Automation Announcement for FDM |