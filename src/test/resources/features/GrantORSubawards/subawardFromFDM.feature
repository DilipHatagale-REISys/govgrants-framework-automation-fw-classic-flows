@awardFromFDM @regression
Feature: Validate all scenarios in the award created from FDM

  Background: Create award from FDM
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Create Subaward" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

  @38213 @38217 @awardCreateEditAndAddingSchedules
  Scenario: Award creation, edition and adding payment/progress report schedules
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    Then I softly see that "Payment Request" has been added in flextable with Id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    When I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I softly see that "Progress Report" has been added in flextable with Id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    Then I collect all the soft asserts

  @awardApproverSelection
  Scenario: Validate the assignment of Approvers for the award
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "---subAwardFromFDM:-:awardApproverTableId---"

  @riskAssessmentActivationAndAwardAcceptanceBySPI
  Scenario Outline: Send an award to sub-recipient before approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:associateContactTableId---"
    When I perform quick search for "Automation SPA" in "---subAwardFromFDM:-:keyContactsTableId---" panel
    When I click "Add" after selection of "Automation SPA" in the table "---subAwardFromFDM:-:keyContactsTableId---"
    When I close "Associate Contacts" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Title          | Project Role   | Is Key Personnel |
      | Automation SPA | Fiscal Contact | Checked          |
    When I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 10         | 10             |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I "Approve" in approval decision
    Then I softly see status in Progress-bar is "Active" and is "Green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Then I collect all the soft asserts
    Examples:
      | Award Name                      | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardReviewInitiationAndCompletion
  Scenario Outline: Validate review initiation and completion for the award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see that "Automation FO" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I collect all the soft asserts
    Examples:
      | Award Name                      | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @38222 @awardApprovalAndSendToRecipientAfterApproval @smoke
  Scenario Outline: Validate award approval and send to subrecipient after approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    Given I click on "Complete Review" in the page details
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    When I click on "Approve" on the approval decision box
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see that "Status" is in "Sent to Subrecipient after Approval" status
    Then I collect all the soft asserts
    Examples:
      | Award Name                      | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardAcceptanceByRecipientAfterApproval
  Scenario Outline: Validate award acceptance by sub-recipient after approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    When I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept after Approval" in the page details
    Then I see status in Progress-bar is "Accepted" and is "Green"
    Examples:
      | Award Name                      | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @awardSiteVisitAndDeskReview
  Scenario Outline: Validate award site visit and desk review creation
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name           | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    When I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    When I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I click on "Activate" in the page details
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Site Visit" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    When I click on top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    And I enter "Desk Review" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I collect all the soft asserts
    Examples:
      | Award Name                      | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @54166 @validatePaymentRelatedSettingOnAwardFromAnnouncement @mahadev
  Scenario Outline: Validate payment related settings are get copied from announcement to grant
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    When I perform quick search for "<Annoucement Name>" in "---subAwardFromFDM:-:announcemetTableId---" panel
    And I click on "View" icon for "<Annoucement Name>" inside flex table with id "---subAwardFromFDM:-:announcemetTableId---"
    And I save the field labeled "Advance Payment Allowed?" as "IsAdvancePaymentAllowed"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    Then I see field "Advance Payment Allowed?" as "{savedValue:IsAdvancePaymentAllowed}"
    Examples:
      | Annoucement Name                | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @45743 @VerifyProjectPeriodStartDateIsSameAsScheduleStartDateOnAwardCreatedFromFDM @mahadev
  Scenario Outline: Verify if award is created from FDM then Project Period Start Date populated is same as progress report schedule start date
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I save the field labeled "Estimated Project Period Start Date" as "ProjectPeriodStartDate"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see field "Schedule Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Examples:
      | Grant Name                      | Award Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @45726 @VerifyProjectPeriodStartDateIsSameAsScheduleEndDateOnAwardCreatedFromFDM @mahadev
  Scenario Outline: Verify if award is created from FDM then Project Period End Date populated same as progress report schedule End date
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I save the field labeled "Estimated Project Period End Date" as "ProjectPeriodEndDate"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see field "Schedule End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Examples:
      | Grant Name                      | Award Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @45745 @VerifyAwardRejectionByS/R   @keerti
  Scenario Outline: Validate the rejection of award by recipient after approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:associateContactTableId---"
    When I perform quick search for "Automation SPA" in "---subAwardFromFDM:-:keyContactsTableId---" panel
    When I click "Add" after selection of "Automation SPA" in the table "---subAwardFromFDM:-:keyContactsTableId---"
    When I close "Associate Contacts" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Title          | Project Role   | Is Key Personnel |
      | Automation SPA | Fiscal Contact | Checked          |
    When I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 10         | 10             |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I "Approve" in approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Reject" in the page details
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Examples:
      | Award Name                      | Grant Name                      |
      | Automation Announcement for FDM | Automation Announcement for FDM |
