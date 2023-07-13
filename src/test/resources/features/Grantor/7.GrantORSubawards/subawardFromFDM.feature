@grantAndAward @awardFromFDM @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios in the award created from FDM

  Background: Create award from FDM
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"

  @67486 @67485 @totalObligation @jitendra
  Scenario: To validate that total obligation in the Financial table of funding account page navigated through the Funding account hyperlink present on the Subaward page of Grantor (Internal PM ) is the Sum of Pre-encumbrance, Encumbrance and the Spent value
    And I navigate to "Budget" sub tab
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    Then I softly see the field "Total Obligation" is equal to the sum of the following fields :
      | Pre-Encumbrance | Encumbrance | Spent |
    Then I softly see the field "Available Balance" is equal to the field "Appropriation Amount" minus the following fields :
      | Total Obligation |

  @38213 @38217 @awardCreateEditAndAddingSchedules @smoke
  Scenario: Award creation, edition and adding payment/progress report schedules
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    Then I softly see that "Payment Request" has been added in flextable with Id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    When I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    Then I softly see that "Progress Report" has been added in flextable with Id "---subAwardFromFDM:-:progressReportSchedulesTableId---"

  @64947 @BusinessFormProgressReport @jitendra
  Scenario: Verify Business Forms for Progress report on announcement is same on grant Attachments Tab.
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    And I see value "Progress Report" for title "Package Type" inside table "---subAwardFromFDM:-:grantPackagesTableId---"

  @awardApproverSelection
  Scenario: Validate the assignment of Approvers for the award
    When I navigate to "Responsibilities" sub tab
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    Then I see that "{SavedValue:EXE Username}" has been added in flextable with Id "---subAwardFromFDM:-:awardApproverTableId---"

  @50990 @riskAssessmentActivationAndAwardAcceptanceBySPI @bug-94597
  Scenario Outline: Send an award to sub-recipient before approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Title                      | Project Role   | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Fiscal Contact | Checked          |
    When I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 10         | 10             |
    And I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Active" and is "Green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    When I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @67662 @deleteFSmultiple @jitendra
  Scenario: Validate review initiation and completion for the award | verify award acceptance
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I click on "Remove" icon for "{SavedValue:fundingAccount}" inside flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"

  @38219 @65402 @awardReviewInitiationAndCompletion @smoke
  Scenario Outline: Validate review initiation and completion for the award | verify award acceptance
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---subAwardFromFDM:-:peerReviewersTableId---"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @67671 @validateUsershouldAllowedToUseMoneyMoreThanPreEncumbranceAmount @jitendra
  Scenario Outline: Validate User is allowed to utilize money greater than Pre En-cumbrance Balance but less than available Balance
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @67665 @67564 @validateEncumberanceGreaterAndLessValue @jitendra
  Scenario: Validate that the encumbrance value should not be less than budget value before Submitting for approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantsRolesAndResponsibilitiesTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantsRolesAndResponsibilitiesTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:GrantsRolesAndResponsibilitiesTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 500         |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Total Encumbrance must be equal to the total Award Amount in the Subaward budget section |
    And I refresh the page
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1001        |
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Total Encumbrance must be equal to the total Award Amount in the Subaward budget section |

  @67700 @emailNotificationAfterPMApproverSubaward @jitendra
  Scenario Outline: Validate that after program approver approves the subaward the mail generates for the Fiscal approver
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "SubawardID"
    Given I click on "Complete Review" in the page details
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "govgrantsuat@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Subaward {SavedValue:SubawardID} has been Assigned forApproval.
      """
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @67698 @validateEmailNotificationToAwardOwnerAfterAwardSubmission @monu @smoke
  Scenario Outline: To Validate that email is getting generated for award owner once user submit subaward for approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "award id"
    Given I click on "Complete Review" in the page details
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I checkout to yopmail with mailid "govgrantsuat@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Subaward {SavedValue:award id} has been Assigned forApproval.
      """
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @38222 @50994 @65418 @65420 @awardApprovalAndSendToRecipientAfterApproval @ErrorMessageForTargetFields
  Scenario Outline: Validate award approval and send to subrecipient after approval | validate submit for approval button displayed
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "SelectAwardGoals"
    Then I see that "Automation Permanent Objective2" has been added in flextable with Id "---subAwardFromFDM:-:objectivesTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI |        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Created" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Performance Tab - Enter Target values. |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I click on "Send to Subrecipient" in the page details
    Then I softly see that "Status" is in "Sent to Subrecipient after Approval" status
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @50997 @awardAcceptanceByRecipientAfterApproval @smoke
  Scenario Outline: Validate award acceptance by sub-recipient after approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I navigate to "Budget" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    When I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    Then I see status in Progress-bar is "Accepted" and is "Green"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @67557 @PRFrequencyNotEnterAndSubmitForApprove @jitendra
  Scenario Outline: To validate that if frequency column is not set in the payment requests schedule Table  by the Grantor (Internal user pm profile ) and Submit for approval button is clicked the validation message must appear.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment_Request_Wt_Frequency" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I refresh the page
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    When I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I see the following messages in the page details contains:
      | Terms Tab - Provide the Payment Request Schedule details before submitting for approval. |
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |


  @54166 @validatePaymentRelatedSettingOnAwardFromAnnouncement @mahadev @smoke
  Scenario Outline: Validate payment related settings are get copied from announcement to grant
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    When I perform quick search for "<Annoucement Name>" in "---subAwardFromFDM:-:announcemetTableId---" panel
    And I click on "View" icon for "<Annoucement Name>" inside flex table with id "---subAwardFromFDM:-:announcemetTableId---"
    And I save the field labeled "Advance Payment Allowed?" as "IsAdvancePaymentAllowed"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    Then I see field "Advance Payment Allowed?" as "{savedValue:IsAdvancePaymentAllowed}"
    Examples:
      | Annoucement Name                                 | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @64943 @verifyApproversCarryForwardedFromAnnoucementToAward @mahadev @wip
  Scenario: Verify Approvers added at announcement is same on subaward when grant which is created with application
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---subAwardStandAlone:-:awardApproversTableId---"

  @45743 @VerifyProjectPeriodStartDateIsSameAsScheduleStartDateOnAwardCreatedFromFDM @mahadev
  Scenario Outline: Verify if award is created from FDM then Project Period Start Date populated is same as progress report schedule start date
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    When I save the field labeled "Estimated Project Period Start Date" as "ProjectPeriodStartDate"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    Then I see field "Reporting Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Examples:
      | Grant Name                                       | Award Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @45726 @VerifyProjectPeriodStartDateIsSameAsScheduleEndDateOnAwardCreatedFromFDM @mahadev
  Scenario Outline: Verify if award is created from FDM then Project Period End Date populated same as progress report schedule End date
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    When I save the field labeled "Estimated Project Period End Date" as "ProjectPeriodEndDate"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "View" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    Then I see field "Reporting Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Examples:
      | Grant Name                                       | Award Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @45745 @VerifyAwardRejectionByS/R @keerti @bug-94597
  Scenario Outline: Validate the rejection of award by recipient after approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Remove" icon for "Project Director/Manager" inside flex table with id "---subAwardFromFDM:-:associateContactTableId---" without waiting for record
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:associateContactTableId---"
    When I perform quick search for "Automation SPA" in "---subAwardFromFDM:-:keyContactsTableId---" panel
    When I click "Associate" after selection of "Automation SPA" in the table "---subAwardFromFDM:-:keyContactsTableId---"
    When I close "Associate Contacts" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Title          | Project Role   | Is Key Personnel |
      | Automation SPA | Fiscal Contact | Checked          |
    When I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 10         | 10             |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Reject" in the page details
    Then I see status in Progress-bar is "Rejected" and is "Red"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @45765 @validateNoDeleteActionDisplayedforGrant
  Scenario Outline:  Validate award is not deleted for application initiated grant
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    Then I softly see that "Payment Request" has been added in flextable with Id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    When I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    Then I cannot see row level action button "Delete" against "<Grant Name>" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Examples:
      | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @38214 @validateViewAccessToDraftGrantForInternalUsers  @mahadev
  Scenario Outline: Verify all internal users can view draft grants
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    Then I softly see field "Status" as "Draft"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    Then I softly see field "Status" as "Draft"
    Examples:
      | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @64570 @64566 @64720 @64721 @64569 @64719 @64723 @64568 @64564 @64718 @64562 @VerifyWorkPlanRequiredFocusAreaRequiredProjectPeriodStartDateProjectPeriodEndDate @keerti
  Scenario Outline: Verify Work Plan Required? field setting entered at announcement is same on grant which is created with application.
    When I navigate to "Announcements" tab
    When I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesAll" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Overview" sub tab
    And I save the field labeled "Internal Organization" as "InternalOrg"
    And I save the field labeled "Program ID" as "ProgramID"
    And I save the field labeled "KPI's Required?" as "KPI"
    #@64570 this functionality is disabled now
    #And I save the field labeled "Work Plan Required?" as "WPR"
    And I save the field labeled "Program Income Allowed?" as "PIA"
    And I save the field labeled "Focus Area Required?" as "FAR"
    And I save the field labeled "Estimated Project Period Start Date" as "PPSD"
    And I save the field labeled "Estimated Project Period End Date" as "PPED"
    And I save the field labeled "Created By" as "CreatedBy"
    And I save the field labeled "Objectives Required?" as "ObjRequired"
    And I save the field labeled "Pre-Application Required?" as "PreApp"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Overview" sub tab
    # @64570 this functionality is disabled now
    #Then I softly see field "Work Plan Required?" as "{SavedValue:WPR}"
    Then I softly see field "Focus Area Required?" as "{SavedValue:FAR}"
    Then I softly see field "Project Period Start Date" as "{SavedValue:PPSD}"
    Then I softly see field "Program Income Allowed?" as "{SavedValue:PIA}"
    Then I softly see field "Project Period End Date" as "{SavedValue:PPED}"
    Then I softly see field "Created by" as "{SavedValue:PM Username}"
    Then I softly see field "KPI's Required?" as "{SavedValue:KPI}"
    Then I softly see field "Funding Organization" as "{SavedValue:InternalOrg}"
    Then I softly see field "Objectives Required?" as "{SavedValue:ObjRequired}"
    Then I softly see field "Internal Program" as "{SavedValue:ProgramID}"
    Then I softly cannot see field "Pre-Application Required?" inside page block
    Examples:
      | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @64785  @verifyAnnoucementNameCarryForwardedOnGrant
  Scenario Outline: Verify Announcement Name is carried forward to Grant Title on grant which is created with application
    When I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Annoucement>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Annoucement>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    Then I see field "Grant" as "<Annoucement>"
    Examples:
      | Annoucement                                      |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @64788 @VerifyFundingAccountFieldOnBudgetTab  @keerti
  Scenario Outline: Verify Funding Account field on Budget Tab Subaward overview is same as announcement financial tab.
    When I navigate to "Announcements" tab
    When I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesAll" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Financials" sub tab
    And I get the value from row "1" for column name "Funding Account" in flex table "flexGridAnnouncementFundingAccountGrantor"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I perform quick search for "<Award Name>" in "flexGridRelatedAwards1" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Budget" sub tab
    Then I see value "{SavedValue:lastValueFromTableForCol}" for title "Funding Account" inside table "flexGridAwardFundingAccounts"
    Examples:
      | Grant Name                                       | Award Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @64791 @VerifyKeyPerformanceIndicatorsValue @keerti
  Scenario Outline: Verify Key Performance Indicators (KPIs) value Performance tab Subaward overview is same as announcement Key Performance Indicators (KPIs) table setup Tab.
    When I navigate to "Announcements" tab
    When I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesAll" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Setup" sub tab
    And I click on "View" icon for "Information Technology" inside table
    And I save the field labeled "Domain" as "Domain"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I perform quick search for "<Award Name>" in "flexGridRelatedAwards1" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Performance" sub tab
    Then I see value "{SavedValue:Domain}" for title "Domain" inside table "GrantorAwardKeyOutcomesgrid"
    Examples:
      | Grant Name                                       | Award Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @64790 @VerifyObjectivesFieldValueOnPerformanceTab  @keerti @buglogged127817
  Scenario Outline: Verify Objectives field value Performance tab Subaward overview is same as announcement Objectives table setup Tab.
    When I navigate to "Announcements" tab
    When I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesAll" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Setup" sub tab
    When I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---announcement:-:objectivesTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I perform quick search for "<Award Name>" in "---subAwardFromFDM:-:subawardsTableId---" panel
    And I click on "View" icon for "<Award Name>" inside table
    When I navigate to "Performance" sub tab
    Then I see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---subAwardFromFDM:-:objectivesTableId---"
    Examples:
      | Grant Name                                       | Award Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @64722 @VerifyRelatedFocusAreasField @keerti
  Scenario Outline: Verify Related Focus Areas field value setup tab overview at announcement is same on grant which is created with application Overview Tab.
    When I navigate to "Announcements" tab
    When I perform quick search for "<Grant Name>" in "ActiveFundingOpportunitiesAll" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Overview" sub tab
    And I click on "View" icon for "Automation Permanent Focus Area" inside table
    And I save the field labeled "GAT Title" as "title"
    And I close modal by clicking the top right x button
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Overview" sub tab
    Then I see value "{SavedValue:title}" for title "Title" inside table "GrantFocusAreas"
    Examples:
      | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @65409  @verifyErrorMessageForFocusArea
  Scenario Outline: To verify the action on adding a focus area start and end end date in between the budget period date in the budget tab of subaward phase in the award owner profile PM User category
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 2          | 3650     |
    Then I see the following messages in the page details contains:
      | Focus area start date should be between budget period. |
    Examples:
      | Grant Name                                       | Award Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @65412 @addFederalProgram @bug-94597
  Scenario Outline: To verify that federal program can be added from the award owner profile in overview tab after the sub award is accepted by the sub recipient
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 10         | 10             |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    And I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "<Award Name>" inside table with wait for record
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:federalProgramTableId---"
    When I click "Add" after selection of "Federal" in the table "---subAwardFromFDM:-:federalListTableId---"
    And I pause execution for "3" seconds
    Then I see total records count "Total Records:1" in flex table "---subAwardStandAlone:-:federalProgramTableId---"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @64793 @VerifViewPermissionOfGrantToSubRecipientUser-Draft  @keerti
  Scenario: Verify SR user is not able to view the grant whose status is draft.
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    And I click toggle button to select "Grants - All"
    And I perform quick search for "Record id" in "GrantsList" panel
    Then I do not see value "Record id" for title "EGMS ID" inside table "GrantsList"

  @67250  @validateApplicationHyperlink
  Scenario: To verify that after clicking on the Application Hyperlink present application id of the Grant all table it redirects to the Application page with the progress bar showing Converted to award
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "ActiveFundingOpportunitiesCompitive" without waiting for record
    When I navigate to "Related Log" sub tab
    And I click on "View" icon for "Converted to Award" inside flex table with id "RelatedFOApplications" without waiting for record
    When I save the field labeled "EGMS ID" as "APPID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I click on hyperlink containing value "{SavedValue:APPID}"
    Then I see status in Progress-bar is "Converted to Award" and is "green"

  @67447 @validateFundingAccountLinkOnAward
  Scenario: To validate that after clicking on the Funding account hyperlink present Funding account column of Funding Account information table Directs to the Funding account page
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I click on hyperlink containing value "{SavedValue:fundingAccount}"
    Then I see field "Title" as "Automation Permanent Funding Account"

  @67673 @validateFundingAccountEditActionNotDisplayed
  Scenario Outline: Validate that Funding account table is not editable after submitted for approval
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
#    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
#      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
#      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I navigate to "Budget" sub tab
    Then I cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @67661 @71124 @71125 @71123 @addAnotherFundingAccountAfterSubawardAccepted @jitendra
  Scenario Outline: Validate that the new Funding account can be added before Approval by award-owner.
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date                          | End Date                      |
      | Automation Permanent Focus Area | {SavedValue:ProjectPeriodStartDate} | {SavedValue:BudgetPeriodDate} |
    When I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Non-Cash Match |
      | Supplies        | 100            |
    Then I softly see value "$100.00" for title "Total Match" against the value "Supplies" inside table "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Total Project Cost" against the value "Supplies" inside table "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cash Match | Non-Cash Match |
      | Supplies        | 100        | 0              |
    Then I softly see value "$100.00" for title "Total Match" against the value "Supplies" inside table "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Total Project Cost" against the value "Supplies" inside table "---subAwardFromFDM:-:subAwardBudgetTableId---"
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Cash Match | Non-Cash Match |
      | Supplies        | 100        | 100            |
    Then I softly see value "$200.00" for title "Total Match" against the value "Supplies" inside table "---subAwardFromFDM:-:subAwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Total Project Cost" against the value "Supplies" inside table "---subAwardFromFDM:-:subAwardBudgetTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardFromFDM:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardFromFDM:-:awardApproverTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I get the value from row "1" for column name "EGMS ID" in flex table "SelectAwardFundingAccounts"
    When I click "Associate" after selection of "{SavedValue:lastValueFromTableForCol}" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Then I see value "{SavedValue:lastValueFromTableForCol}" for title "Funding Account" inside table "---subAwardFromFDM:-:AwardFundingAccountTableId---"
    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @81590 @verifyInitiateNegotiationIconISNotVisible @monu
  Scenario Outline: validate Initiate Negotiation icon should not be visible to Announcement owner
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Funding Decision Memo" inside flex table with id "---grantor_tableId:-:FDMTableId---"
    And I navigate to "Funding Decision Memo" sub tab
    Then I cannot see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |