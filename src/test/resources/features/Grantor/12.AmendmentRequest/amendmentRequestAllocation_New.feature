@amendmentRequests @grantor-regression @grantor-parallel-regression @parallel-regression @regression
Feature: Validate all scenarios in the Amendment Request Allocation Feature

  @264084 @264589 @264590 @264085 @264083 @264080 @264594 @264591 @264564 @264581 @264086 @263945 @264906 @264952 @264963 @264964 @264953 @264965 @264556 @263938 @264974 @ValidatePMusercanseevalidationonSubmitforApprovalbuttowhenRevisedObligationislessthanBudgetedAmountonBudgetSummarysectiononAmendmentrequestFAisYES @sprint-20-US-249450-249461 @vaibhav @Allocation @TBE
  Scenario: Validate PM user can see validation on Submit for Approval button when 'Revised Obligation' is less than Budgeted Amount on Budget Summary section on Amendment request (FA is YES)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
    And I wait for "2" seconds
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 300               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 300                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$300.00"
    And I save the field labeled "Spent" as "awardSpent"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "500" into field "fieldRequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I wait for "8" seconds
    And I click on "Submit to Grantor" in the page details
    #264906
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Carry Forward Amount in the budget period section must be equal to the Carry Forward amount on the Budget Summary section. |
    #264963
      | Overview Tab - The Budgeted Amount must be equal to the Revised Obligation in the Budget Summary Section                                  |
    When I click on "Edit" in the page details
    And I enter value "900" into field "fieldRequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    #264952
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Carry Forward Amount in the budget period section must be equal to the Carry Forward amount on the Budget Summary section. |
    #264964
      | Overview Tab - The Budgeted Amount must be equal to the Revised Obligation in the Budget Summary Section                                  |
    When I click on "Edit" in the page details
    And I enter value "700" into field "fieldRequestedChangeInBudget__c"
    When I click on "Save" in the page details
    #264965
    Then I softly see field "Budgeted Amount" as "$2,700.00"
    Then I softly see field "Revised Obligation" as "$2,700.00"
    And I click on "Submit to Grantor" in the page details
    #264953,264965
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                           |
      | 500   | fieldRequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Revised Obligation must be equal to the Budgeted Amount in the Budget Summary Section.                          |
    #264589
      | Overview Tab - The Revised Obligation ($2500.0) must be equal to the total of Revised Encumbrance in the Funding Account ($2700.0) |
    #264085
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                           |
      | 1500  | fieldRequestedChangeInBudget__c |
    #263945
    Then I softly see that "Budgeted Amount" rendered in view mode only
    And I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,700.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $2,700.00            |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    #264085
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Revised Obligation must be equal to the Budgeted Amount in the Budget Summary Section.                          |
    #264590
      | Overview Tab - The Revised Obligation ($3500.0) must be equal to the total of Revised Encumbrance in the Funding Account ($2700.0) |
    #264083
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                           |
      | 700   | fieldRequestedChangeInBudget__c |
    #264080
    Then I softly see that "Revised Obligation" rendered in view mode only
    And I click on "Save" in the page details
    And I save the field labeled "Carry Forward Amount" as "CarryForward"
    And I save the field labeled "Current Obligation" as "CurrentObligation"
    And I save the field labeled "Revised Obligation" as "RevisedObligation"
    Then I softly see addition of two fields "{SavedValue:CarryForward}" and "{SavedValue:CurrentObligation}" is equal to "{SavedValue:RevisedObligation}"
    Then I softly see field "Carry Forward Amount" as "$700.00"
    Then I softly see field "Current Obligation" as "$2,000.00"
    Then I softly see field "Revised Obligation" as "$2,700.00"
    #264564
    Then I softly see "Carry Forward Amount" in flex table header "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$200.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$700.00" for title "Carry Forward Amount" against the value "Grand Total" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    #264581
    Then I softly see "Revised Obligation" in flex table header "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$2,000.00" for title "Current Obligation" against the value "Grand Total" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$2,700.00" for title "Revised Obligation" against the value "Grand Total" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    And I save the value from row "3" for column name "Current Obligation" as "CurrentObligationFATotal" from flex table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    And I save the value from row "3" for column name "Carry Forward Amount" as "CarryForwardFATotal" from flex table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    And I save the value from row "3" for column name "Revised Obligation" as "RevisedObligationFATotal" from flex table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see addition of two fields "{SavedValue:CarryForwardFATotal}" and "{SavedValue:CurrentObligationFATotal}" is equal to "{SavedValue:RevisedObligationFATotal}"
    #264556
    Then I softly see value "$300.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    Then I softly see value "$300.00" for title "Spent" against the value "Grand Total" inside table "---amendment:-:grantorCarryForwardFocusAreaTableId---"
    #263938
    Then I softly see field "Spent" as "$300.00"
    And I save the field labeled "Spent" as "Spent"
    Then I softly see value "{SavedValue:awardSpent}" is "Equals to" the value "{SavedValue:Spent}"
    #264594
    Then I softly cannot see top right button "Associate" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    #264083,264591
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Overview" sub tab
    Then I softly see field "Revised Obligation" as "$2,700.00"
    Then I softly see value "$2,700.00" for title "Revised Encumbrance" inside table "---amendment:-:amendmentFundingAccountsTableId---"
    #264086
    Then I softly see field "Revised Obligation" as "$2,700.00"
    And I save the field labeled "Revised Obligation" as "RevisedObligation"
    Then I softly see field "Budgeted Amount" as "$2,700.00"
    And I save the field labeled "Budgeted Amount" as "BudgetedAmount"
    Then I softly see value "{SavedValue:RevisedObligation}" is "Equals to" the value "{SavedValue:BudgetedAmount}"
    #264974
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see field "Status" as "Submitted for Approval"
    And I expand nested table containing column value "BP01"
    Then I softly do not see "Actions" in flex table header "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    Then I softly do not see "Actions" in flex table header "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"

  @264616 @264638 @264613 @264611 @264635 @264651 @264616 @265056 @265111 @265112 @265113 @265114 @ValidateAdminusercanseeCarryForwardiseditablefield&canacceptonlyzerodollarvalueonSubmittoGrantorstateofAmendmentRequestFAisNO @sprint-20-US-249450 @vaibhav @Allocation
  Scenario: Validate Admin user can see 'Carry Forward' is editable field & can accept only zero dollar value on Submit to Grantor state of Amendment Request FA is NO
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation ADMIN user" of type "Competitive"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "1500" into field "fieldRequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 1000          |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 3000                 | 300        | 0              |
    And I refresh the page
    And I wait for "8" seconds
    And I click on "Submit to Grantor" in the page details
    #265111
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Carry Forward Amount in the budget period section must be equal to the Carry Forward amount on the Budget Summary section. |
    #265114
      | Overview Tab - The Budgeted Amount must be equal to the Revised Obligation in the Budget Summary Section                                  |
    When I click on "Edit" in the page details
    And I enter value "500" into field "fieldRequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    #265112
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Carry Forward Amount in the budget period section must be equal to the Carry Forward amount on the Budget Summary section. |
    #265113
      | Overview Tab - The Budgeted Amount must be equal to the Revised Obligation in the Budget Summary Section                                  |
    When I click on "Edit" in the page details
    And I enter value "1000" into field "fieldRequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    #265056
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Revised Commitment" rendered in view mode only
    Then I softly see field "Revised Commitment" as "$0.00"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
    #264638
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "fieldRevisedCommitment__c" is in edit mode
    #264613
    Then I softly see that "Revised Obligation" rendered in view mode only
    When I enter values into fields
      | Value | Field                     |
      | 5000  | fieldRevisedCommitment__c |
    #264611
    Then I softly see that "Budgeted Amount" rendered in view mode only
    When I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$5,000.00"
    #264611,264613
    Then I softly see field "Budgeted Amount" as "$3,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $3,000.00            |
    And I save the field labeled "Carry Forward Amount" as "CarryForward"
    And I save the field labeled "Current Obligation" as "CurrentObligation"
    And I save the field labeled "Revised Obligation" as "RevisedObligation"
    Then I softly see addition of two fields "{SavedValue:CarryForward}" and "{SavedValue:CurrentObligation}" is equal to "{SavedValue:RevisedObligation}"
    Then I softly see field "Carry Forward Amount" as "$1,000.00"
    Then I softly see field "Current Obligation" as "$2,000.00"
    Then I softly see field "Revised Obligation" as "$3,000.00"
    When I click on "Edit" in the page details
    And I enter value "0" into field "fieldRequestedChangeInBudget__c"
    When I click on "Save" in the page details
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    #264635
    Then I softly see that "Carry Forward Amount" rendered in view mode only
    #264651
    Then I softly see that "Revised Commitment" rendered in view mode only
    Then I softly see field "Revised Commitment" as "$5,000.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Under Revision"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 0             |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I wait for "10" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I click on "Submit for Approval" in the page details
    #264616
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Overview" sub tab
    Then I softly see field "Carry Forward Amount" as "$0.00"

  @264081 @ValidatePMusercanseevalidationonSubmitforApprovalbuttonwhenRevisedObligationislessthanspentonAmendmentrequestFAisYES @sprint-20-US-249450 @vaibhav @Allocation
  Scenario: Validate PM user can see validation on Submit for Approval button when Revised Obligation is less than spent on Amendment request FA is YES
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1500   | 100        | 100            |
    And I wait for "2" seconds
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1500   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 500   | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 500                 |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 250                  | 25         | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 250                  | 25         | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 1000              |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 1000                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "200" into field "fieldRequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 100           |
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 100           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 350                  | 35         | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 350                  | 35         | 0              |
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 700                 |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Revised Obligation must be greater than or equal to the Spent amount. |

  @264608 @265844 @265014 @265015 @265043 @265105 @265009 @265010 @ValidateAdminusercanseeSpentasreadonlyfieldanditsvaluewhichisTotalSpentontheawardversion1onBP01FAisNO @sprint-20-US-249450 @vaibhav @Allocation
  Scenario: Validate Admin user can see 'Spent' as read only field and it's value which is Total Spent on the award version 1 on BP01 FA is NO
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation ADMIN user" of type "Competitive"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$2,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligationAward"
    And I save the field labeled "Total Commitment" as "TotalCommitmentAward"
    Then I softly see field "Total Commitment" as "$4,000.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 300        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 300                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                        | Reimbursement |
      | {SavedValue:ADMIN Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$300.00"
    And I save the field labeled "Spent" as "awardSpent"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "1000" into field "fieldRequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    #265010
    And I save the field labeled "Spent" as "Spent"
    Then I softly see field "Spent" as "$300.00"
    Then I softly see value "{SavedValue:awardSpent}" is "Equals to" the value "{SavedValue:Spent}"
    #265014
    Then I softly see field "Current Commitment" as "$4,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitmentAward}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    #265009
    Then I softly see field "Current Obligation" as "$2,000.00"
    And I save the field labeled "Current Obligation" as "CurrentObligation"
    Then I softly see value "{SavedValue:CumulativeObligationAward}" is "Equals to" the value "{SavedValue:CurrentObligation}"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 1000          |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 4000                 | 400        | 0              |
    And I refresh the page
    And I wait for "8" seconds
    And I click on "Submit to Grantor" in the page details
    #265844
    Then I softly see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount must be equal to the Revised Obligation in the Budget Summary Section |
      | You have allotted $2000.0, but have carried forward $1000.0.                                             |
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 3000                 | 300        | 0              |
    And I refresh the page
    #265015, 265043
    And I click on "Edit" in the page details
    Then I softly see that "Revised Obligation" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    And I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$0.00"
    Then I softly see field "Carry Forward Amount" as "$1,000.00"
    Then I softly see field "Current Obligation" as "$2,000.00"
    Then I softly see field "Revised Obligation" as "$3,000.00"
    And I wait for "8" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    #265105
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "Revised Obligation" rendered in view mode only
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Spent" as "Spent"
    Then I softly see field "Spent" as "$300.00"
    Then I softly see value "{SavedValue:awardSpent}" is "Equals to" the value "{SavedValue:Spent}"

  @264092 @264972 @264971 @ValidatePMusercannotseeCarryForwardiseditablefieldinUnderRevisionstateofAmendmentRequestFAisYES @sprint-20-US-249450 @vaibhav @Allocation
  Scenario: Validate PM user cannot see Carry Forward is editable field in Under Revision state of Amendment Request FA is YES
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
    And I wait for "2" seconds
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 500    | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 300               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 300                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction  | 1000                 | 100        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "700" into field "fieldRequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1200                 | 120        | 0              |
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 1500                 | 150        | 0              |
    And I refresh the page
    And I wait for "5" seconds
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    #264972
    And I expand nested table containing column value "BP01"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I click on "Send Back to Subrecipient" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I click on "Edit" in the page details
    #264092
    Then I softly see that "Carry Forward Amount" rendered in view mode only
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see field "Status" as "Under Revision"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 100           |
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 400           |
    And I refresh the page
    #264971
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$400.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"

  @264969 @264842 @264977 @264979 @264998 @264957 @264958 @264959 @264875 @264834 @ValidateSPAusercanseeCarryForwardAmountclmunderBudgetPeriodsectioniseditableinCreatedstateofAmendmentRequestFAisYES @sprint-20-US-249461 @vaibhav @Allocation @TBE
  Scenario: Validate SPA user can see 'Carry Forward Amount clm under Budget Period section is editable in Created state of Amendment Request (FA is YES)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Financials" sub tab
    And I enter value "Yes" into field "fieldDetailedBudgetingRequired__c"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 500          | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    When I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 500          | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non Cash Match |
      | Extra Salary | The narrative | 1000         | 100        | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I select value inside table "---paymentRequest:-:paymentRequestBudgetTableId---" is "5"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 150               |
    And I select value inside table "---paymentRequest:-:paymentRequestBudgetTableId---" is "5"
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 150               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 300                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$300.00"
    And I save the field labeled "Spent" as "awardSpent"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "700" into field "fieldRequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 200           |
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 500           |
    And I refresh the page
    #264958,264959
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$200.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Carry Forward Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$700.00" for title "Carry Forward Amount" against the value "Grand Total" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$1,200.00" for title "Revised Obligation" against the value "Automation Permanent Focus Area" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$1,500.00" for title "Revised Obligation" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$2,700.00" for title "Revised Obligation" against the value "Grand Total" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    And I save the value from row "3" for column name "Current Obligation" as "CurrentObligationFATotal" from flex table "---amendment:-:carryForwardFocusAreaTableId---"
    And I save the value from row "3" for column name "Carry Forward Amount" as "CarryForwardFATotal" from flex table "---amendment:-:carryForwardFocusAreaTableId---"
    And I save the value from row "3" for column name "Revised Obligation" as "RevisedObligationFATotal" from flex table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see addition of two fields "{SavedValue:CarryForwardFATotal}" and "{SavedValue:CurrentObligationFATotal}" is equal to "{SavedValue:RevisedObligationFATotal}"
    #264969
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$200.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Carry Forward" against the value "Construction" inside table "---amendment:-:RecipientCarryForwardBudgetTableId---"
    #264842
    And I click on "Edit" in the page details
    Then I softly see that "Revised Obligation" rendered in view mode only
    Then I softly see that "Revised Commitment" rendered in view mode only
    And I click on "Save" in the page details
    Then I softly see field "Revised Commitment" as "$0.00"
    Then I softly see field "Carry Forward Amount" as "$700.00"
    Then I softly see field "Current Obligation" as "$2,000.00"
    Then I softly see field "Revised Obligation" as "$2,700.00"
    #264977
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---amendment:-:amendmentLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non Cash Match |
      | Extra Salary | The narrative | 1200         | 120        | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---amendment:-:amendmentLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non Cash Match |
      | Extra Salary | The narrative | 1500         | 150        | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    Then I softly see value "$1,200.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    #264957
    Then I softly see value "$150.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$150.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    Then I softly see value "$300.00" for title "Spent" against the value "Grand Total" inside table "---amendment:-:carryForwardFocusAreaTableId---"
    #264834
    Then I softly see field "Spent" as "$300.00"
    And I save the field labeled "Spent" as "Spent"
    Then I softly see value "{SavedValue:awardSpent}" is "Equals to" the value "{SavedValue:Spent}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #264998
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---amendment:-:amendmentLineItemsTableId---"
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly cannot see row level action button "Edit" against "Extra Salary" in flex table with id "---amendment:-:amendmentLineItemsTableId---"
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    Then I softly see value "$1,200.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I softly see value "$1,500.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    #264875
    Then I cannot see top right button "Edit" in page detail
    Then I softly see that "Carry Forward Amount" rendered in view mode only
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:recipientSideAmendmentRequestTableId---" panel
    When I click on "View" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:recipientSideAmendmentRequestTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #264979
    Then I softly see field "Status" as "Under Revision"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---amendment:-:amendmentLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non Cash Match |
      | Extra Salary | The narrative | 1300         | 130        | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly can see row level action button "Edit" against "Extra Salary" in flex table with id "---amendment:-:amendmentLineItemsTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount | Cash Match | Non Cash Match |
      | Extra Salary | The narrative | 1600         | 160        | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    Then I softly see value "$1,300.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I softly see value "$1,600.00" for title "Revised Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"

  @265845 @ValidateSPIusercancarryforwardpartialamountfromremainingamountpresentonthatparticularFAfromoneFAtootherFAfrompreviousAwardversion1onBP02whenwedoingcarryforwardARonBP03ifwehave3budgetperiodsonAward @sprint-20-US-249461 @vaibhav @Allocation
  Scenario: Validate SPI user can carry forward partial amount from remaining amount present on that particular FA from one FA to other FA from previous Award version 1 on BP02 when we doing carry forward AR on BP03 if we have 3 budget periods on Award
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation ADMIN user" of type "Competitive"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 6000  | fieldRevisedCommitment__c       |
      | 4100  | fieldProposedBudgetEndDate__c   |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId1"
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId1}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId1}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "1000" into field "fieldRequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I expand nested table containing column value "BP02"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 1000           |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 3000                 | 300        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"

  @265846 @ValidateSPIusercancarryforwardTotalamountfromremainingamountpresentonthatparticularFAfromonFAtootherFAfrompreviousAwardversion1onBP02whenwedoingcarryforwardARonBP03ifwehave3budgetperiodsonAward @sprint-20-US-249461 @vaibhav @Allocation
  Scenario: Validate SPI user can carry forward Total amount from remaining amount present on that particular FA from one FA to other FA from previous Award (version 1 on BP02) when we doing carry forward AR on BP03 if we have 3 budget periods on Award
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation ADMIN user" of type "Competitive"
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 4000  | fieldRevisedCommitment__c       |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                           |
      | 2000  | fieldRequestedChangeInBudget__c |
      | 6000  | fieldRevisedCommitment__c       |
      | 4100  | fieldProposedBudgetEndDate__c   |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PeriodicID"
    And I refresh the page
    And I save the field labeled "Proposed Budget Period Start Date" as "updatedBudgetPeriodStartDate"
    And I save the field labeled "Proposed Budget Period End Date" as "updatedBudgetPeriodEndDate"
    And I get the "EGMS ID"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                        | Amendment Request |
      | {SavedValue:ADMIN Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 2000                 | 200        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId1"
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId1}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId1}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldPurposeRTA__c"
    And I enter value "2000" into field "fieldRequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    And I refresh the page
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I expand nested table containing column value "BP02"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Carry Forward |
      | Construction    | 2000          |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category | Revised Award Amount | Cash Match | Non Cash Match |
      | Construction    | 4000                 | 400        | 0              |
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"

  @257465 @VerifyPOuserseeSpentfieldwithspentamountonpaymentrequestonawardFAisNo @sprint-19-US-228100 @hitesh @Allocation
  Scenario: Verify PO user see Spent field with spent amount on payment request on award (FA is No)
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_ByApp_Focus_No" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "IsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 1000         | 100        |    0           |
    And I save the value from row "1" for column name "Award Amount" as "AwardAmount1" from flex table "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    When I pause execution for "10" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 100        | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 100                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                        | Reimbursement |
      | {SavedValue:PO Username}    |   Step 1      |
    When I get the "EGMS ID"
    And I refresh the page
    When I click on "Submit for Approval" in the page details
    And I refresh the page
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    Then I softly see field "Spent" as "$100.00"
    And I save the field labeled "Spent" as "Spent"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount |
      | Extra Salary | The narrative | 900          |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Indirect costs" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title          | Narrative     | Award Amount |
      | Indirect costs | The narrative | 100          |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see field "Spent" as "$100.00"
    And I save the field labeled "Spent" as "Spent1"
    Then I softly see value "{SavedValue:Spent}" is "Equals to" the value "{SavedValue:Spent1}"

  @257449 @257456 @VerifyPOusercanseeBudgetedAmountasReadonlyfieldwhichisRolledupfromthebudgetchangesectionsRevisedAwardAmountcolumnFAisYes @sprint-19-US-228100 @hitesh @Allocation
  Scenario: Verify PO user can see Budgeted Amount as Read only field which is Rolled up from the budget change section's Revised Award Amount column (FA is Yes)
    And I published "Formula" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_RISK_ASS_NO-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see field "Total Commitment" as "$1,000.00"
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
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount |
      | Construction  | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount|
      | Other             | 50                  |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount |
      | Construction  | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount|
      | Other             | 50                  |
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    #257456
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see field "Current Obligation" as "$1,000.00"
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    And I save the field labeled "Current Commitment" as "CurrentObligation"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentObligation}"
    When I click on "Save" in the page details
    And I click on "Send Back to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount |
      | Construction  | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name    | Revised Award Amount |
      | Indirect Charges | 50                   |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount|
      | Other             | 0                   |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name | Revised Award Amount |
      | Construction  | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name    | Revised Award Amount |
      | Indirect Charges | 50                   |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount|
      | Other             | 0                   |
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |

  @256760 @256744 @256766 @256804 @256822 @256639 @VerifySPIusercanseeRevisedSubawardBudgetfieldRenamedfromRevisedAwardAmountinBudgetChangesectionontheBudredARValuescanbeeditableonAR @sprint-19-US-244517 @hitesh @Allocation
  Scenario: VerifySPIusercanseeRevisedSubawardBudgetfieldRenamedfromRevisedAwardAmountinBudgetChangesectionontheBudredARValuescanbeeditableonAR
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields3" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_By_App_Focus_Yes" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "IsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Amendment Award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date | New Obligation |
      | Automation Permanent Focus Area | 0          | 3650     | 500            |
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:focusAreaTableId---"
    And I perform quick search for "Automation Permanent Focus Area2" in "---subAwardStandAlone:-:associateModalTableId---" panel
    When I check "Automation Permanent Focus Area2" boxes in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:associateModalTableId---"
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date | New Obligation |
      | Automation Permanent Focus Area2 | 0          | 3650     | 500            |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Construction | The narrative | 500          | 50         |    0           |
    And I save the value from row "1" for column name "Award Amount" as "AwardAmount1" from flex table "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I click on page navigation arrow "---subAwardStandAlone:-:subAwardBudgetTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Amount | Cash Match | Non-Cash Match |
      | Construction | The narrative | 500          | 50         |    0           |
    And I save the value from row "1" for column name "Award Amount" as "AwardAmount2" from flex table "---subAwardStandAlone:-:RecipientAwardBudgetCategoryTableId---"
    When I close "Subaward Budget Category" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                        | Award  |
      | {SavedValue:ADMIN Username} | Step 1 |
    And I refresh the page
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    When I click on "View" icon for "{SavedValue:AwardEGMSID}" inside table with wait for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    And I click on "Save" in the page details
    #256639
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    #256760
    Then I softly see "Revised Award Amount" in flex table header "---amendment:-:budgetChangeTableId---"
    Then I softly do not see "Revised Subaward Budget" in flex table header "---amendment:-:budgetChangeTableId---"
    #256744
    Then I softly see "Budget Change" page block displayed
    Then I softly see "Award Amount" in flex table header "---amendment:-:budgetChangeTableId---"
    Then I softly do not see "Subaward Budget" in flex table header "---amendment:-:budgetChangeTableId---"
    Then I see value "$500.00" for title "Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I see value "$500.00" for title "Award Amount" against the value "Construction" inside table "---amendment:-:budgetChangeTableId---"
    Then I see the following rows under the following headers in table with id "---amendment:-:budgetChangeTableId---" :
      | Award Amount |
      | $1,000.00    |
    #256766 #256804
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly see "Award Amount" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly do not see "Awarded Budget" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I save the value from row "1" for column name "Award Amount" as "AwardAmount3" from flex table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "{SavedValue:AwardAmount1}" is "Equals to" the value "{SavedValue:AwardAmount3}"
    Then I softly see "Prior Award Amount" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly do not see "Prior Awarded Budget" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I save the value from row "1" for column name "Prior Award Amount" as "PriorAwardAmount3" from flex table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "{SavedValue:AwardAmount1}" is "Equals to" the value "{SavedValue:PriorAwardAmount3}"
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    Then I softly see "Award Amount" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly do not see "Awarded Budget" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I save the value from row "1" for column name "Award Amount" as "AwardAmount4" from flex table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "{SavedValue:AwardAmount1}" is "Equals to" the value "{SavedValue:AwardAmount4}"
    Then I softly see "Prior Award Amount" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly do not see "Prior Awarded Budget" in flex table header "---amendment:-:AddLineItemForBudgetChangeTableId---"
    And I save the value from row "1" for column name "Prior Award Amount" as "PriorAwardAmount4" from flex table "---amendment:-:AddLineItemForBudgetChangeTableId---"
    Then I softly see value "{SavedValue:AwardAmount2}" is "Equals to" the value "{SavedValue:PriorAwardAmount4}"
    When I close "Add Line Items" modal by clicking the top right x button
    #256822
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount |
      | Construction | The narrative | 5000         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount |
      | Construction | The narrative | 500          |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount cannot be increased or decreased during a Budget Redirection.|

  @256581 @VerifySPIusercanseeanewsectionofBudgetSummaryinsteadofFundingChangeontheBudredamendmentrequestwhichiscreatedfromdirectaward @sprint-19-US-244517 @hitesh @Allocation
  Scenario: Verify SPI user can see a new section of "Budget Summary" instead of "Funding Change " on the  Bud red amendment request which is created from direct award
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user" of type "Formula_By_Applicant_Focus_Area"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    And I click on "Save" in the page details
    Then I softly see "Budget Summary" page block displayed
    Then I softly do not see "Funding Change" page block displayed
    And I click on "Edit" in the page details
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only

  @256784 @256646 @256701 @256754 @Verifyusershouldnotabletoeditanyfieldinbudgetsummary&budgetsummarybyfocusareasectionwhenAmendmentisinsubmitforapproval&ApprovedstateFAYes @sprint-19-US-255590 @hitesh @Allocation
  Scenario: Verify user should not able to edit any field in budget summary & budget summary by focus area section when Amendment is in submit for approval & Approved state(FA Yes)
    And I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 300              |
    And I select value inside table "---paymentRequest:-:paymentRequestBudgetTableId---" is "5"
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 200               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                         | Reimbursement |
      | {SavedValue:EXE Username}    | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
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
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    #256646
    And I click on "Edit" in the page details
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see field "Current Obligation" as "$1,000.00"
    And I save the field labeled "Current Obligation" as "CurrentObligation"
    Then I softly see value "{SavedValue:CumulativeObligation}" is "Equals to" the value "{SavedValue:CurrentObligation}"
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see field "Spent" as "$500.00"
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    When I click on "Save" in the page details
    #256754
    Then I softly see "Revised Award Amount" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Revised Subaward Budget" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see "Award Amount" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly do not see "Subaward Budget" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    #256701
    Then I softly see value "$300.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$200.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Grand Total" inside table "---amendment:-:projectAreasTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:projectAreasTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see that "Budgeted Amount" rendered in view mode only
    Then I softly see that "Current Commitment" rendered in view mode only
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---amendment:-:projectAreasTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---amendment:-:projectAreasTableId---"

  @256651 @256661 @256709 @256955 @VerifusershouldabletoseeBudgetSummarybyFocusAreaSectiononlyifFocusareaisYes @sprint-19-US-255590-255591 @hitesh @Allocation
  Scenario: Verify user should able to see Budget Summary by Focus Area Section, only if Focus area is Yes
    And I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    #256955
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$0.00" for title "Budgeted Amount" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    Then I softly see value "$0.00" for title "Current Obligation" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:projectAreasTableId---"
    #256661
    Then I softly see field "Current Obligation" inside page block
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see field "Spent" inside page block
    #256709
    Then I softly see "Revised Award Amount" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:grantorBudgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |

  @256990 @256966 @VerifySpentvalueshouldbeCalculatedagainsteachfocusareaFAareaYes @sprint-19-US-255591 @hitesh @Allocation
  Scenario: Verify Spent value should be  Calculated against each focus area(FA area Yes)
    And I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 300              |
    And I select value inside table "---paymentRequest:-:paymentRequestBudgetTableId---" is "5"
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 200               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                         | Reimbursement |
      | {SavedValue:EXE Username}    | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
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
    And I enter value "Automation Justification" into field "fieldJustification__c"
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see value "$300.00" for title "Spent" against the value "Automation Permanent Focus Area" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "$200.00" for title "Spent" against the value "Automation Permanent Focus Area2" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "$500.00" for title "Spent" against the value "Grand Total" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see field "Spent" as "$500.00"
    #256966
    Then I softly see field "Current Obligation" as "$1,000.00"
    And I save the field labeled "Current Obligation" as "CurrentObligation"
    Then I softly see value "{SavedValue:CumulativeObligation}" is "Equals to" the value "{SavedValue:CurrentObligation}"

  @256780 @256911 @256921 @257014 @VerifyusershouldabletoseePriorawardedbudgetAwardedbudgetshouldberenamedFAyes @sprint-19-US-255590-255591 @hitesh @Allocation
  Scenario: Verify user should able to see Budget Summary by Focus Area Section, only if Focus area is Yes
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Financials" sub tab
    And I enter value "Yes" into field "fieldDetailedBudgetingRequired__c"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 500          | 50         | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    When I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    When I click on "Add Line Item Details" icon for "Indirect Charges" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title            | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Indirect Charges | The narrative | 500          | 50         | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
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
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    #256921
    And I click on "Edit" in the page details
    Then I softly see "Budget Summary" page block displayed
    Then I softly see that "Current Obligation" rendered in view mode only
    Then I softly see field "Current Obligation" as "$1,000.00"
    And I save the field labeled "Current Obligation" as "CurrentObligation"
    Then I softly see value "{SavedValue:CumulativeObligation}" is "Equals to" the value "{SavedValue:CurrentObligation}"
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see field "Spent" as "$0.00"
    Then I softly see that "Budgeted Amount" rendered in view mode only
    #257014
    Then I softly see "Revised Award Amount" in flex table header "---amendment:-:budgetChangeTableId---"
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I see the following rows under the following headers in table with id "---amendment:-:budgetChangeTableId---" :
      | Revised Award Amount |
      | $1,000.00            |
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    When I click on "Save" in the page details
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount |
      | Construction | The narrative | 5000         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I click on "Add Line Items" icon for "Indirect Charges" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "Edit" :
      | Title            | Narrative     | Award Amount |
      | Indirect Charges | The narrative | 500          |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "5" seconds
    #256911
    Then I see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount cannot be increased or decreased during a Budget Redirection.|
    And I pause execution for "5" seconds
    And I refresh the page
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount |
      | Construction | The narrative | 500          |
    When I close "Add Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #256780
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see "Award Amount" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see "Prior Award Amount" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:grantorBudgetChangeTableId---" for table id "Next"
    Then I click on "Add Line Items" icon for "Indirect Charges" inside flex table with id "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see "Award Amount" in flex table header "---amendment:-:grantorBudgetChangeTableId---"
    Then I softly see "Prior Award Amount" in flex table header "---amendment:-:grantorBudgetChangeTableId---"

  @256936 @VerifusershouldabletoseeBudgetSummarybyFocusAreaSectiononlyifFocusareaisYes @sprint-19-US-255591 @hitesh @Allocation
  Scenario: Verify user should able to see Budget Summary by Focus Area Section, only if Focus area is Yes.
    And I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---amendment:-:subrecipientProjectAreasTableId---"

  @256909 @VerifywhenusertriedtogivemoreAwardamountthantheAwardedbudgetthenusershouldseetheValidationFAYes @sprint-19-US-255591 @hitesh @Allocation
  Scenario: Verify when user  tried  to give more Award amount than the Awarded budget  then user should see the Validation(FA Yes)
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Financials" sub tab
    And I enter value "Yes" into field "fieldDetailedBudgetingRequired__c"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 500          | 50         | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    When I expand nested table containing column value "BP01"
    And I click on page navigation arrow "---applicationReview:-:budgetTableId---" for table id "Next"
    When I click on "Add Line Item Details" icon for "Indirect Charges" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title            | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Indirect Charges | The narrative | 500          | 50         | 0              |
    When I close "Add Line Items" modal by clicking the top right x button
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    Then I see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation EXE user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
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
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I click on "Add Line Items" icon for "Construction" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "Edit" :
      | Title        | Narrative     | Award Amount |
      | Construction | The narrative | 5000         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    Then I click on "Add Line Items" icon for "Indirect Charges" inside flex table with id "---amendment:-:budgetChangeTableId---"
    When I edit the following rows inline in flex table with id "---amendment:-:AddLineItemForBudgetChangeTableId---" by clicking "Edit" :
      | Title            | Narrative     | Award Amount |
      | Indirect Charges | The narrative | 500          |
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Overview Tab - The Budgeted Amount cannot be increased or decreased during a Budget Redirection.|

  @258303 @258282 @258306 @258327 @258297 @258237 @258238 @258369 @258243 @VerifySPIusercanseevalueforTotalCommitmentfieldsiscomingfromthelatestactiveawardandforLatestBPongrantFAisYes @sprint-19-US-255644 @hitesh @Allocation
  Scenario: Verify user should able to see Budget Summary by Focus Area Section, only if Focus area is Yes.
    And I published "Formula" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA_BY_APPL_NEGOTIATION_NO-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 50                   |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 50                   |
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    #258237
    And I navigate to "Budget" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    #258243
    Then I softly see field "New Obligation" as "$0.00"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    #258282
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---" :
      | Award Amount |
      | $500.00      |
    And I click on page navigation arrow "---subAwardStandAlone:-:sRBudgetCategoryTableId---" for table id "Next"
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:sRBudgetCategoryTableId---" :
      | Award Amount |
      | $500.00      |
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Budget" sub tab
    #258303
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitmentGrant"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:TotalCommitmentGrant}"
    And I refresh the page
    When I hovering mouse on help text icon inside page block detail "Total Commitment"
    Then I softly see "Total amount committed through this and prior awards in this Budget period" shown as help text
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    And I save the value from row "1" for column name "Cumulative Obligation" as "CumulativeObligation" from flex table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Budget" sub tab
    #258306
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:grantSubrecipientFocusAreaTableId---"
    And I save the value from row "1" for column name "Cumulative Obligation" as "CumulativeObligation1" from flex table "---subAwardStandAlone:-:grantSubrecipientFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantSubrecipientFocusAreaTableId---"
    Then I softly see value "{SavedValue:CumulativeObligation}" is "Equals to" the value "{SavedValue:CumulativeObligation1}"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    #258238
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see "New Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    #258369
    Then I softly see field "New Obligation" as "$0.00"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    #258327
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$1,000.00"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:grantsBudgetSummaryFocusAreaTableId---"
    #258297
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation1"
    Then I softly see value "{SavedValue:CumulativeObligation}" is "Equals to" the value "{SavedValue:CumulativeObligation1}"

  @258330 @258233 @258299 @258305 @VerifyvalueswillgetupdatedongrantonlyonceanewAwardwillgetactiveFAisNo @sprint-19-US-255644 @hitesh @Allocation
  Scenario: Verify values will get updated on grant only once a new Award will get active  (FA is No)
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_ByApp_Focus_No" values from "Award_Field_Values.xlsx"
    And I enter value "20" into field "fieldBudgetRedirectionThreshhold__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:PO Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I pause execution for "3" seconds
    And I click on "Send to Subrecipient" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 900                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 100                  |
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see field "Total Commitment" as "$2,000.00"
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation1"
    Then I softly see field "Total Commitment" as "$2,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Budget" sub tab
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see field "Total Commitment" as "$2,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment1"
    #258305
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment1}"
    When I hovering mouse on help text icon inside page block detail "Total Commitment"
    Then I softly see "Total amount committed through this and prior awards in this Budget period" shown as help text
    #258299
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation2"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "{SavedValue:CumulativeObligation1}" is "Equals to" the value "{SavedValue:CumulativeObligation2}"
    And I refresh the page
    When I hovering mouse on help text icon inside page block detail "Cumulative Obligation"
    Then I softly see "Total Awarded amount across budget periods." shown as help text
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    #258233
    And I navigate to "Budget" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only

  @258244 @258231 @258252 @258245 @VerifyPOusercanseeNewObligationfieldvalueisdisplayas$0afterbudgetredirectionamendmentamendmentonawardinactivatedstateFAisNo @sprint-19-US-255644 @hitesh @Allocation
  Scenario: Verify PO user can see New Obligation field value is display as $0 after budget redirection amendment amendment on award in activated state (FA is No)
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_ByApp_Focus_No" values from "Award_Field_Values.xlsx"
    And I enter value "4" into field "fieldBudgetRedirectionThreshhold__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see field "Current Commitment" as "$2,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 960                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 40                  |
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "4" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    #258245
    And I navigate to "Budget" sub tab
    Then I softly see field "Total Commitment" as "$2,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see value "{SavedValue:TotalCommitment}" is "Equals to" the value "{SavedValue:CurrentCommitment}"
    Then I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    #258231
    And I navigate to "Budget" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    #258244
    And I navigate to "Budget" sub tab
    Then I softly see field "New Obligation" as "$0.00"
    #258252
    And I save the value from row "1" for column name "Encumbrance" as "Encumbrance" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "$1,000.00" for title "Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"

  @258247 @258251 @258232 @VerifyPOusercanseeTotalCommitmentfieldvalueonawardwhichisinActivatedstateiscopiedfromthecurrentCommitmentfieldfromthebudgetsummarysectionFAisYes @sprint-19-US-255644 @hitesh @Allocation
  Scenario: Verify PO user can see Total Commitment field value on award which is in Activated state is copied from the current Commitment field from the budget summary section (FA is Yes)
    And I published "Formula" type announcement having name "Automation Runtime Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PO user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 900                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 100                   |
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I navigate to "Overview" sub tab
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    And I wait for "4" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    And I save the value from row "1" for column name "Encumbrance" as "Encumbrance" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "$1,000.00" for title "Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    #258232
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    #258251
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    #258247
    Then I softly see field "Total Commitment" as "$1,000.00"
    And I save the field labeled "Total Commitment" as "TotalCommitment1"
    Then I softly see value "{SavedValue:CurrentCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment1}"

  @257249 @257244 @257260 @257279 @257112 @257315 @257342 @257305 @257265 @257242 @257246 @257292 @VerifySPIusershouldabletoseeallvaluesontheoldAmendedawardshouldremainthesameandusershouldnotabletochangeFAYes @sprint-19-US-255639 @hitesh @Allocation
  Scenario: Verify SPI user should able to see all values on the old(Amended) award should  remain the same and  user should  not able to change(FA Yes)
    And I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "SECOND_FOCUS_AREA-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "SECOND_BUDGET_CATEGORY"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}" and properties "Automation PM user"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category | Spent This Action |
      | Construction    | 300              |
    And I select value inside table "---paymentRequest:-:paymentRequestBudgetTableId---" is "10"
    And I click on page navigation arrow "---paymentRequest:-:paymentRequestBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" by clicking "Edit" :
      | Budget Category  | Spent This Action |
      | Construction     | 200               |
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                  |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                         | Reimbursement |
      | {SavedValue:EXE Username}    | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I see status in Progress-bar is "Paid" and is "green"
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
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 50                   |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 450                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 50                   |
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Submit to Grantor" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "4" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Overview" sub tab
    Then I softly see field "Current Commitment" as "$1,000.00"
    And I save the field labeled "Current Commitment" as "CurrentCommitment"
    And I wait for "4" seconds
    And I click on "Amend Subaward" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "Green"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    #257242
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    And I save the value from row "1" for column name "Encumbrance" as "Encumbrance" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "$1,000.00" for title "Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    #257315
    Then I softly can see page block "Budget Summary by Focus Area"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"
    Then I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    #257260
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly see field "New Obligation" as "$0.00"
    Then I softly see that "New Obligation" rendered in view mode only
    #257342
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---focusarea:-:SubAwardFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---focusarea:-:SubAwardFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---focusarea:-:SubAwardFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---focusarea:-:SubAwardFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---focusarea:-:SubAwardFocusAreaTableId---"
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" :
      | Award Amount |
      | $500.00      |
    And I click on page navigation arrow "---subAwardFromFDM:-:subAwardBudgetTableId---" for table id "Next"
    Then I see the following rows under the following headers in table with id "---subAwardFromFDM:-:subAwardBudgetTableId---" :
      | Award Amount |
      | $500.00      |
    #257265
    Then I softly see that "Total Commitment" rendered in view mode only
    And I save the field labeled "Total Commitment" as "Total Commitment"
    Then I softly see field "Total Commitment" as "$1,000.00"
    Then I softly see value "{SavedValue:CurrentCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment}"
    #257292
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly see field "New Obligation" as "$0.00"
    Then I softly see that "New Obligation" rendered in view mode only
    And I save the value from row "1" for column name "Encumbrance" as "Encumbrance" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "$1,000.00" for title "Encumbrance" against the value "{SavedValue:fundingAccount}" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see that "Total Commitment" rendered in view mode only
    And I save the field labeled "Total Commitment" as "Total Commitment"
    Then I softly see field "Total Commitment" as "$1,000.00"
    Then I softly see value "{SavedValue:CurrentCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment}"
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"
    #257410
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Budget" sub tab
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:focusAreaTableId---"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only
    Then I softly see field "New Obligation" as "$1,000.00"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see field "Total Commitment" as "$1,000.00"
    #257112
    Then I softly do not see field "Budgeted Amount" inside "Budget Summary" section
    Then I softly do not see "Budgeted Amount" in flex table header "---amendment:-:subrecipientProjectAreasTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see field "Spent" as "$500.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    #257244
    When I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary by Focus Area"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$500.00" for title "Cumulative Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I softly see value "$1,000.00" for title "Cumulative Obligation" against the value "Grand Total" inside table "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    #257279
    Then I softly see that "Total Commitment" rendered in view mode only
    And I save the field labeled "Total Commitment" as "TotalCommitment"
    Then I softly see field "Total Commitment" as "$1,000.00"
    Then I softly see value "{SavedValue:CurrentCommitment}" is "Equals to" the value "{SavedValue:TotalCommitment}"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Budget" sub tab
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---amendment:-:recipientActiveGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---amendment:-:recipientActiveGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---amendment:-:recipientAwardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    #257305
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    And I save the field labeled "Cumulative Obligation" as "CumulativeObligation"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:CumulativeObligation}"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Budget" sub tab
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    Then I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    Then I navigate to "Subawards" sub tab
    And I click on "View" icon for "Amended" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    #257246
    Then I softly see that "New Obligation" rendered in view mode only
    Then I softly see that "Cumulative Obligation" rendered in view mode only
    Then I softly see that "Total Commitment" rendered in view mode only
    Then I softly see field "New Obligation" as "$1,000.00"
    Then I softly see field "Cumulative Obligation" as "$1,000.00"
    Then I softly see field "Total Commitment" as "$1,000.00"
    When I navigate to "Actuals" sub tab
    Then I softly see that "Spent" rendered in view mode only
    Then I softly see field "Spent" as "$500.00"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Completed"
    Then I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see "Cumulative Obligation" in flex table header "---focusarea:-:SubAwardFocusAreaTableId---"
    Then I see field "Cumulative Obligation" as "$1,000.00"
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see "Cumulative Obligation" in flex table header "---subAwardStandAlone:-:subrecipientFocusAreaTableId---"
    Then I see field "Cumulative Obligation" as "$1,000.00"

  @257335 @VerifywhentheinitialAwardisnotfromFDMthenthefocusareawithzeroNewObligationshouldbevisible @sprint-19-US-255639 @hitesh @Allocation
  Scenario: Verify when  the initial  Award is not from FDM,  then the  focus area with zero New Obligation should be visible
    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMIS_YES_FOCUS_AREA_NO_SUB_ORG_IND-Automation EXE user" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "IND" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Construction      | 900                  |
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name     | Revised Award Amount |
      | Indirect costs    | 100                  |
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Submit to Grantor" in the page details
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area" inside table "---subAwardStandAlone:-:focusAreaTableId---"
    Then I softly see value "$0.00" for title "New Obligation" against the value "Automation Permanent Focus Area2" inside table "---subAwardStandAlone:-:focusAreaTableId---"


