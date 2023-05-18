@amendmentRequests @grantor-regression @grantor-parallel-regression @parallel-regression @regression
Feature: Validate all scenarios in the Amendment Request Allocation Feature

@257 @VerifyAdminuserwillseeCumilativeObligationfieldontheBudgetSummarybyFocusAreasectionOnNewAwardInActiveStateandRolluptheAwardAmountforeachfocusareafromtheawardbudgetgrid @sprint-19-US-255648 @hitesh @Allocation
Scenario: Verify Admin user will see Cumilative Obligation field on the Budget Summary by Focus Area section On New Award In Active State and Roll up the Award Amount for each focus area from the award budget grid.
  When I login to "As a Grantor" app as "ADMIN" user
  When I navigate to "Applications" tab
  And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
  When I click toggle button to select "Application Reviews - All"
  And I perform quick search for "AN-REI-166" in "---applicationReview:-:announcementListTableId---" panel
  When I click on "Initiate Review Process" icon for "AN-REI-166" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
  And I created approved FDM on application "AN-REI-166"
  Given I created award from approved FDM with announcement "AN-REI-166" and properties "Automation ADMIN user"
  And I activate award from FDM having application name "AN-REI-166"
When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
And I navigate to "Grants" tab
And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
And I click toggle button to select "Subawards  - All"
When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
Given I navigate to "Management" sub tab
And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
And I click modal button "Save and Continue"
Then I softly see status in Progress-bar is "Created" and is "green"
And I enter value "Automation Justification" into field "fieldJustification__c"
And I click on "Save" in the page details
And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
| Category Name | Revised Award Amount |
| Construction  | 450                  |
And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
| Category Name   | Revised Award Amount |
| Indirect costs  | 50                   |
And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
| Category Name | Revised Award Amount |
| Construction  | 450                  |
And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
| Category Name   | Revised Award Amount |
| Site work       | 50                   |
And I click on "Submit to Grantor" in the page details
Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
And I get the "EGMS ID"
When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
And I navigate to "Grants" tab
When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
When I navigate to "Responsibilities" sub tab
When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
| Name                      | Amendment Request |
| {SavedValue:ADMIN Username} | Step 1            |
And I click on "Submit for Approval" in the page details
Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
And I navigate to "Grants" tab
When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
And I "Approve" in the approval decision
When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
And I navigate to "Grants" tab
When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
And I click toggle button to select "Amendment Requests - Approved"
And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
And I click on "Amend Subaward" in the page details
Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
When I navigate to "Budget" sub tab
    #257982
Then I softly see field "Cumilative Obligation" as "$1,000.00"
Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
And I click on page navigation arrow "---subAwardStandAlone:-:sRBudgetCategoryTableId---" for table id "Next"
Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
And I save the field labeled "EGMS ID" as "AwardEGMSID1"
When I click on "Activate" in the page details
Then I softly see field "Status" as "Activated"
When I navigate to "Budget" sub tab
Then I softly see field "Cumilative Obligation" as "$1,000.00"
Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"
And I click on page navigation arrow "---subAwardStandAlone:-:sRBudgetCategoryTableId---" for table id "Next"
Then I softly see value "$1,000.00" for title "Award Amount" against the value "Construction" inside table "---subAwardStandAlone:-:sRBudgetCategoryTableId---"