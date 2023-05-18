@amendmentRequests @grantor-regression @grantor-parallel-regression @parallel-regression @regression
Feature: Validate all scenarios in the Amendment Request Allocation Feature

@257 @VerifyAdminuserwillseeCumilativeObligationfieldontheBudgetSummarybyFocusAreasectionOnNewAwardInActiveStateandRolluptheAwardAmountforeachfocusareafromtheawardbudgetgrid @sprint-19-US-255648 @hitesh @Allocation
Scenario: Verify Admin user will see Cumilative Obligation field on the Budget Summary by Focus Area section On New Award In Active State and Roll up the Award Amount for each focus area from the award budget grid.
  When I login to "As a Grantor" app as "ADMIN" user
  And I navigate to "Grants" tab
  When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
  And I perform quick search for "CR-AD-2328-00" in "---amendment:-:pendingTaskTableId---" panel
  When I click on "Start" icon for "CR-AD-2328-00" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
  And I "Approve" in the approval decision
  When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
  And I navigate to "Grants" tab
  When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
  And I click toggle button to select "Amendment Requests - Approved"
  And I perform quick search for "CR-AD-2328-00" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
  When I click on "View" icon for "CR-AD-2328-00" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
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