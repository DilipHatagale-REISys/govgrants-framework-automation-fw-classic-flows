@regression @siteVisits
Feature: site Visit/Desk Review scenarios without background

  @validateActiveSuppportingDocumentChecklist
Scenario Outline: validate user can add active supporting document for Reimbursement payment request as type Invoice
Given I delete the record "Automation Execution Award" from the object "Payment Request"
And I delete the record "Automation Execution Award" from the object "Progress Report"
When I delete the record "Automation Payment Request" from the object "Payment Request"
And I delete the record "Automation Execution Award" from the object "Grant"
When I login to "As a Grantor" app as "EXE" user
And I navigate to "Grants" tab
When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
And I click modal button "Continue"
And I enter "AdvPaymentGrandEdition" values from "Award_Field_Values.xlsx"
When I click modal button "Save and Continue"
And I navigate to "Attachments" sub tab
When I enter the following values into flex table with id "flexGridGrantChecklists" by clicking "Add" :
| Description | Required  | Applies To            | Status |
| Automation  | Mandatory | Reimbursement Request | Active |
And I navigate to "Subawards" sub tab
And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
And I get the "EGMS ID"
And I click on "Edit" in the page details
When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
And I click on "Save" in the page details
And I navigate to "Budget" sub tab
When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
And I perform quick search for "Automation Permenent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
When I click "Add" after selection of "Automation Permenent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
And I close modal by clicking the top right x button
When I refresh the page
When I navigate to "Budget" sub tab
And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
| Title                           | Start Date | End Date |
| Automation Permanent Focus Area | 0          | 3650     |
When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
| Funding Account | Encumbrance |
| FA--01          | 1000        |
And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
| Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
| Construction    | 1000           | 100        | 100            |
When I navigate to "Performance" sub tab
And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
| EGMS ID                                 | Target |
| Automation Permanent KPI for Regression | 10     |
And I navigate to "Management" sub tab
And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
When I enter "Payment Request Schedule" values from "Award_Field_Values.xlsx"
And I click modal button "Save"
When I close modal by clicking the top right x button
And I click on "Edit" icon for "Progress Report	" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
When I enter "Progress Report Schedule" values from "Award_Field_Values.xlsx"
And I click modal button "Save"
When I close modal by clicking the top right x button
When I navigate to "Overview" sub tab
And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
| Name           | Project Role             | Is Key Personnel |
| Automation SPI | Project Director/Manager | Checked          |
When I navigate to "Responsibilities" sub tab
And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
| Responsibility     | Name           | Description                 |
| Program Approver   | Automation PM  | Automation Test Description |
| Executive Approver | Automation EXE | Automation Test Description |
| Fiscal Approver    | Automation FO  | Automation Test Description |
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
And I click on "Send to Subrecipient" in the page details
When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
And I navigate to "Grants" tab
When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
When I click on "Start" icon for "Record Id" inside table
And I click on "Accept after Approval" in the page details
When I enter "Automation Award accepted" for comments and click "OK"
When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
And I navigate to "Grants" tab
When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
And I click toggle button to select "Draft Grants"
When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
And I click on "View" icon for "<Grant Name>" inside table
When I navigate to "Subawards" sub tab
And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
And I click on "Activate" in the page details


Examples:
| Award Name                 | Grant Name                 |
| Automation Execution Award | Automation Execution Award |