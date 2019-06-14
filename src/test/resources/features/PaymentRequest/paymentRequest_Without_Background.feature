@regression @PaymentRequest
Feature: scenarios without background

  @53910 @ValidateAdvancePaymentRequestButton @mahadev
  Scenario Outline: validate advance buutton not displayed to SPI user when Advance Payment Allowed selected as NO
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    And I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "AdvPaymentGrandEdition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I get the "EGMS ID"
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
    And I click on "Send to Subrecipient" in the page details
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
    Then I cannot see top right button "Advance" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @53966 @enterDetailedBudgetOnAdvPaymentRequest @mahadev
  Scenario Outline: Validate user can enter detailed budget for Advance Payment Request when Are Expense Details Required on Reimbursements? is Yes at Grant
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    Given I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I enter value "Yes" into field "IsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I get the "EGMS ID"
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
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAward_StandAlone:-:subAward_Budget_TableId---" with wait for record
    When I enter the following values into flex table with id "---subAward_StandAlone:-:budgetLineItems---" by clicking "New" :
      | Title        | Narrative     | Subaward Budget | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000            | 50         | 50             |
    And I close modal by clicking the top right x button
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
    When I click on "Send to Subrecipient" in the page details
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
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budget_TableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 500                           |
    Then I see value "$500.00" for title "Advance Requested This Action" against the value "Construction" inside table "---paymentRequest:-:budget_TableId---"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @53953 @validateProgramIncomeFieldIsDisplayedOnAdvancePaymentRequest @mahadev
  Scenario Outline: Validate user can enter Program Income at payment request when program Income Allowed is Yes at Grant
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I get the "EGMS ID"
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
    When I click on "Send to Subrecipient" in the page details
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
    When I navigate to "Financials" sub tab
    Then I see field "Program Income" as "$1,000.00"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @53912 @validateProgramIncomeTrackingNotDisplayedOnAdvPaymentRequest @mahadev
  Scenario Outline: Validate user can not see page block Program Income tracking not displayed on Advance payment request when program Income Allowed is No at Grant
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I enter value "No" into field "IsProgramIncomeAnticipated__c"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    When I click on "View" icon for "Created" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I get the "EGMS ID"
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
    When I click on "Send to Subrecipient" in the page details
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
    When I navigate to "Financials" sub tab
    Then I cannot see page block "Program Income Tracking"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

  @53965 @validateProgramIncomeFieldIsDisplayedOnReimbursementPaymentRequest @mahadev
  Scenario Outline: Validate user can enter Program Income On Reimbursement Payment Request when program Income Allowed is Yes at Grant
    Given I delete the record "Automation Payment Request" from the object "Payment Request"
    When I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
    And I get the "EGMS ID"
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
    And I click on "Send to Subrecipient" in the page details
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
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I enter value "I Agree" into field "TermsAgreement__c"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Program Income This action" as "$1,000.00"
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |

    @53964 @validateProgramIncomeTrackingNotDisplayedOnPaymentRequest @mahadev
    Scenario Outline: Validate user can not see page block Program Income tracking not displayed on Reimbursement payment request when program Income Allowed is No at Grant
      Given I delete the record "Automation Payment Request" from the object "Payment Request"
      When I delete the record "Automation Execution Award" from the object "Grant"
      When I login to "As a Grantor" app as "EXE" user
      And I navigate to "Grants" tab
      When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
      And I click on top right button "New" in flex table with id "---subAward_StandAlone:-:active_Grants_TableId---"
      And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
      And I click modal button "Continue"
      And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
      When I enter value "No" into field "IsProgramIncomeAnticipated__c"
      When I click modal button "Save and Continue"
      And I navigate to "Subawards" sub tab
      When I click on "View" icon for "Created" inside flex table with id "---subAward_StandAlone:-:subawards_TableId---"
      And I get the "EGMS ID"
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
      When I click on "Send to Subrecipient" in the page details
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
      And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
      When I enter value "Automation Payment Request" into field "Title__c"
      And I click modal button "Save and Continue"
      When I navigate to "Financials" sub tab
      Then I cannot see page block "Program Income Tracking"
      Examples:
        | Award Name                 | Grant Name                 |
        | Automation Execution Award | Automation Execution Award |