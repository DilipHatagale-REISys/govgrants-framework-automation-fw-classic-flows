@closeout @grantor-regression @grantor-parallel-regression
Feature: Validate all scenarios in Closeout

  Background: Navigate to award
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"

  @50971 @50973 @96200 @creationAndEditionOfAdhocCloseout
  Scenario: To create and Edit an Adhoc Closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "closeoutRequestNo"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"
    #96200 #monu
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I softly can see row level action button "View" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    Then I softly cannot see row level action button "Delete" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"

  @50975 @50974 @assigningApproversAndsendCloseoutToSubrecipient @smoke
  Scenario: Send Closeout Request to Subrecipient and assigning approvers to the closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "Green"

  @50977 @50976 @subrecipientEntersFieldInCloseoutAndAcknowledges
  Scenario: Validate whether Subrecipient enters closeout fields and acknowledges
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "green"

  @50979 @50978 @86715 @overrideCloseoutAndSubmitForApproval @smoke
  Scenario Outline: Grant owner overrides the Closeout and is submitted for approval
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "<Award Name>" in "---paymentRequest:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "<Award Name>" inside flex table with id "---paymentRequest:-:recipientsSubawardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
      | Extra Salary | The narrative | 500        | 1        | Feet        | 0                 | 0               | 0                        | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 500                   |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:approversTableId---" by clicking "Edit" :
      | Responsibility  | Name                     | Description                 |
      | Fiscal Approver | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Submit for Approval" in the page details
    When I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    And I enter "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:EGMSID}" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "DynamicUser" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "ProjectPeriodCloseoutGrantor"
    #86715
    Then I softly see field "EGMS ID" as "{SavedValue:closeoutID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Attachments" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
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
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    Then I see status in Progress-bar is "Overridden" and is "green"
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    Examples:
      | Award Name                                         |
      | {SavedValue:Automation Runtime Award for closeout} |

  @50980 @adhocCloseoutHappyPath @smoke @notFunctional @wip
  Scenario: Approval of Closeout
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Given User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Closeout          | As a Grantor | QA     |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Closeout |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    Then I see status in Progress-bar is "Completed" and is "green"

  @50982 @scheduledCloseoutHappyPath @notFunctional @wip
  Scenario: Happy path of Scheduled closeout
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Given User "EXE" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2       | Step 3 |
      | Navigation | Closeout          | As a Grantor | QA     |
      | Left Panel | Pending Tasks     | My Tasks     |        |
      | FlexTable  | PhasePendingTasks | Start        |        |
    And I complete the fields from the sheet "Override" in excel "Closeout_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2   | Step 3            |
      | Navigation | As a Grantor  | Closeout |                   |
      | FlexTable  | Pending Tasks | My Tasks | PhasePendingTasks |
      | Approval   | Start         | Approve  |                   |
    Then I see status in Progress-bar is "Completed" and is "green"

  @40066 @40605 @40608 @40071 @NavigationAcknowledgementAutoPopulatedFieldsGrantOverview  @Keerti
  Scenario: Navigating to the Closeout Request/Validating whether the Acknowledgement section has Default Null Value before sent to sub-recipient
  / Verifying the Auto-populated fields Closeout Effective Date and the Closeout Activities Due date
  /Validating whether the fields are carried forward from the Grant Overview tab to Closeout Grant Overview Tab
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field value having link labeled "Subrecipient Organization" as "SubrecipientOrganization"
    And I save the field value having link labeled "Funding Organization" as "FundingOrganization"
    And I navigate to "Requests" sub tab
    Then I softly see field "Closeout Requests" inside page block
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "Acknowledgement" as "AcknowledgementCheck"
    And I save the field labeled "Acknowledgement Date" as "AcknowledgementDate"
    And I save the field labeled "Acknowledgement By" as "AcknowledgementBy"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    And I save the field value having link labeled "Subrecipient Organization" as "CloseoutSubrecipientOrganization"
    And I save the field value having link labeled "Funding Organization" as "CloseoutFundingOrganization"
    Then I softly see that the saved value "{SavedValue:AcknowledgementCheck}" and "" are equal
    Then I softly see that the saved value "{SavedValue:AcknowledgementDate}" and "" are equal
    Then I softly see that the saved value "{SavedValue:AcknowledgementBy}" and "" are equal
    Then I softly see that the saved value "{SavedValue:ProjectPeriodEndDate}" and "{SavedValue:CloseoutEffectiveDate}" are equal
    Then I softly see that the saved value "{SavedValue:SubrecipientOrganization}" and "{SavedValue:CloseoutSubrecipientOrganization}" are equal
    Then I softly see that the saved value "{SavedValue:FundingOrganization}" and "{SavedValue:CloseoutFundingOrganization}" are equal

  @40636 @40747 @ChecklistSupportingDocumentNotes @Keerti @bug-97109
  Scenario: Verifying the Checklist of Closeout Request/ Validate the Supporting Document Checklist Section / Validate the user can add the Notes for Closeout Requests
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Checklist" sub tab
    Then I softly see field "Has the subrecipient submitted all payment requests?" as "Yes"
    Then I softly see field "Did the subrecipient incur any costs after the period of performance end date?" as "Yes"
    Then I softly see field "Have all submitted payments to the subrecipient been issued, including the final payment?" as "Yes"
    Then I softly see field "Have all expenditures been reviewed for allowability?" as "Yes"
    Then I softly see field "Is there an unspent balance remaining on this award?" as "Yes"
    Then I softly see field "Have all indirect expenses been posted to the award?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient met the match requirement?" as "Yes"
    Then I softly see field "Has the subrecipient provided supporting documentation for all reported match, including third party in-kind match?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Did the subrecipient fully expend program income earned during the award period prior to the closeout of the award?" as "Yes"
    Then I softly see field "Has the subrecipient returned unexpended program income to the funding organiation, if required by program regulations?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient completed the scope of work as outlined in the subaward agreement?" as "Yes"
    Then I softly see field "Has the subrecipient met all deliverable requirements?" as "Yes"
    Then I softly see field "Has the subrecipient submitted required documentation of performance completion?" as "Yes"
    Then I softly see field "Did the subrecipient request an extension to the period of performance?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient submitted all programmatic or progress reports?" as "Yes"
    Then I softly see field "Has the subrecipient submitted all required site visit reports?" as "Yes"
    Then I softly see field "Has the funding organization program staff reviewed and accepted all reports?" as "Yes"
    Then I softly see field "Is the subrecipient required to provide ongoing outcome or compliance reporting after the period of performance end date?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient submitted a equipment inventory?" as "Yes"
    Then I softly see field "Has the subrecipient put in place the required deed restrictions or mortgage liens for real property acquired, constructed, rehabilitated, or reconstructed with federal award funds?" as "Yes"
    Then I softly see field "Did the subrecipient make facility or infrastructure improvements that trigger change of use requirements and is the subrecipient required to provide ongoing maintenance?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    Then I softly see field "Has the subrecipient completed all corrective actions for any open findings/concerns?" as "Yes"
    Then I softly see field "Has the funding organization reviewed and accepted all corrective actions?" as "Yes"
    Then I softly see field "Comments" as "Automation test description"
    When I navigate to "Attachments" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" by clicking "Add" :
      | Description                 | Required  | Status |
      | Automation test description | Mandatory | Active |
    Then I softly see value "Automation test description" for title "Description" inside table "CloseoutChecklistsFlexToggle"
    And I add notes records
    When I close "Add Notes" modal by clicking the top right x button
    Then I softly see table with header "Notes" contains records "Notes Record"

  @40729 @87356 @VerifyErrorMessageForCloseoutRequest @monu
  Scenario: validate user should get error message on closeout request for Tye and Reason fields
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
     #87356
    Then I softly see "Create Closeout Request" opens in overLay window
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details contains:
      | Type is Required to save.   |
      | Reason is Required to save. |

  @40065 @87352 @40608 @89221 @89222 @89223 @89224 @89225 @89226 @89228 @89229 @89227 @88734 @88735 @88736 @88737 @88738 @88739 @ValidatingCloseoutRequest @meenakshi
  Scenario: To verify the PM user should be able to create the  Closeout Request
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    #40065
    Then I softly see "Create Closeout Request" opens in overLay window
    #87352
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    #40608
    And I save the field labeled "Closeout Activities Due Date" as "CloseoutActivitiesDueDate"
    Then I softly see field "Closeout Activities Due Date" as "{SavedValue:CloseoutActivitiesDueDate}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    When I navigate to "Responsibilities" sub tab
    #89221
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    Then I softly see that "{SavedValue:PM Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    #89222
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    Then I softly see that "Automation PM" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly see that "Program Reviewer" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly see that "Automation Test Description" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"
    #89223
    When I navigate to "Attachments" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" by clicking "Add" :
      | Description                 | Required  | Status |
      | Automation test description | Mandatory | Active |
    Then I softly see value "Automation test description" for title "Description" inside table "CloseoutChecklistsFlexToggle"
    #89224
    And I click on "Attach" icon for "Automation test description" inside flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" with wait for record
    Then I softly see "Upload Document" opens in overLay window
    When I upload file "AttachmentTesting.pdf" into library
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Attachment saved successfully. |
    When I close "Upload Document" modal by clicking the top right x button
    #89225
    And I click on hyperlink containing value "View"
    And I click on "View" icon for "Automation test description" inside flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" with wait for record
    Then I softly see new tab is opened
    And I switch to parent tab
    And I click on top right button "Add Files" in flex table with id "---closeout:-:closeoutFilesTableId---"
    #89226
    When I upload attachment "Permanent Records.xlsx" of type "Other" from computer
    #89228
    And I click on "Download" icon for "Other" inside flex table with id "---closeout:-:closeoutFilesTableId---" with wait for record
    Then I softly verify that the file "Permanent Records.xlsx" is downloaded
    #89229
    And I click on "View" icon for "Other" inside flex table with id "---closeout:-:closeoutFilesTableId---" with wait for record
    Then I softly see "View" opens in overLay window
    Then I see field "Title" as "Permanent Records.xlsx" on modal
    Then I see field "Classification" as "Other" on modal
    When I close "View" modal by clicking the top right x button
    #89227
    And I click on top right button "Add Files" in flex table with id "---closeout:-:closeoutFilesTableId---"
    When I upload file present in the flex table "---closeout:-:closeoutAddFileTableId---" from library
    Then I softly see value "data.xlsx" for title "Title" inside table "---closeout:-:closeoutFilesTableId---"
    Then I softly can see row level action button "Download" against "data.xlsx" in flex table with id "---closeout:-:closeoutFilesTableId---"
    Then I softly can see row level action button "View" against "data.xlsx" in flex table with id "---closeout:-:closeoutFilesTableId---"
    Then I softly can see row level action button "Delete" against "data.xlsx" in flex table with id "---closeout:-:closeoutFilesTableId---"
    #88734
    When I navigate to "Checklist" sub tab
    And I enter value "Yes" into field "fieldChecklistQuestionPick7__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick8__c"
    #88735
    And I enter value "Yes" into field "fieldChecklistQuestionPick9__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick10__c"
    #88736
    And I enter value "Yes" into field "fieldChecklistQuestionPick11__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick12__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick13__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick14__c"
    #88737
    And I enter value "Yes" into field "fieldChecklistQuestionPick15__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick16__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick17__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick18__c"
    #88738
    And I enter value "Yes" into field "fieldChecklistQuestionPick19__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick20__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick21__c"
    #88739
    And I enter value "Yes" into field "fieldChecklistQuestionPick22__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick23__c"
    When I click on "Save" in the page details
    Then I softly see field "Has the subrecipient met the match requirement?" as "Yes"
    Then I softly see field "Has the subrecipient provided supporting documentation for all reported match, including third party in-kind match?" as "Yes"
    Then I softly see field "Did the subrecipient fully expend program income earned during the award period prior to the closeout of the award?" as "Yes"
    Then I softly see field "Has the subrecipient returned unexpended program income to the funding organiation, if required by program regulations?" as "Yes"
    Then I softly see field "Has the subrecipient completed the scope of work as outlined in the subaward agreement?" as "Yes"
    Then I softly see field "Has the subrecipient met all deliverable requirements?" as "Yes"
    Then I softly see field "Has the subrecipient submitted required documentation of performance completion?" as "Yes"
    Then I softly see field "Did the subrecipient request an extension to the period of performance?" as "Yes"
    Then I softly see field "Has the subrecipient submitted all programmatic or progress reports?" as "Yes"
    Then I softly see field "Has the subrecipient submitted all required site visit reports?" as "Yes"
    Then I softly see field "Has the funding organization program staff reviewed and accepted all reports?" as "Yes"
    Then I softly see field "Is the subrecipient required to provide ongoing outcome or compliance reporting after the period of performance end date?" as "Yes"
    Then I softly see field "Has the subrecipient submitted a equipment inventory?" as "Yes"
    Then I softly see field "Has the subrecipient put in place the required deed restrictions or mortgage liens for real property acquired, constructed, rehabilitated, or reconstructed with federal award funds?" as "Yes"
    Then I softly see field "Did the subrecipient make facility or infrastructure improvements that trigger change of use requirements and is the subrecipient required to provide ongoing maintenance?" as "Yes"
    Then I softly see field "Has the subrecipient completed all corrective actions for any open findings/concerns?" as "Yes"
    Then I softly see field "Has the funding organization reviewed and accepted all corrective actions?" as "Yes"

  @87353 @86713 @40071 @93106 @40644 @86714 @76488 @42103 @87351 @76487 @86716 @86712 @87346 @ValidatingSentToSubrecipientInCloseoutRequest @meenakshi
  Scenario: To validate status : Sent to Subrecipient in closeout request section when closeout request is Sent to Subrecipient by an internal user
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #87353
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "CloseoutEGMSID"
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:CloseoutEGMSID}"
    #40071
    And I save the field labeled "Grant Title" as "GrantTitle"
    And I save the field labeled "Subrecipient Organization" as "SubrecipientOrganization"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Grant Title" as "{SavedValue:GrantTitle}"
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrganization}"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    When I click on "Save" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    #93106
    Then I softly see value "{SavedValue:CloseoutEGMSID}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Early Completion" for title "Type" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Automation Test Description" for title "Reason" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Created" for title "Status" inside table "---closeout:-:closeoutTableId---"
    And I click on "View" icon for "Created" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Attachments" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    #40644
    And I navigate to "Overview" sub tab
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Actual Cash Match" as "$0.00"
    Then I softly see field "Actual Non-Cash Match" as "$0.00"
    Then I softly see field "Actual Total Match" as "$0.00"
    When I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    #76487
    Then I softly see status in Progress-bar is "Sent To Subrecipient" and is "Green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    #86714
    And I click on "View" icon for "Sent To Subrecipient" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "07/20/2023" into field "fieldCloseoutDate__c"
    And I enter value "08/12/2023" into field "fieldCloseoutDueDateGrantor__c"
    When I click on "Save" in the page details
    Then I softly see field "Closeout Effective Date" as "07/20/2023"
    Then I softly see field "Closeout Activities Due Date" as "08/12/2023"
    #76488
    Then I softly see value "FA-ST-13" for title "Funding Account" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$1,000.00" for title "Encumbrance" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$0.00" for title "Spent" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$1,000.00" for title "Encumbrance Balance" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I softly see value "$0.00" for title "Closeout Deobligation" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    #42103
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:externalHomePendingTasktableId---" panel
    Then I softly see that "{SavedValue:CloseoutEGMSID}" has been added in flextable with Id "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "Review Closeout Request" for title "Task Type" inside table "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "{Date:MM/dd/yyyy::d+7}" for title "Due Date" inside table "---closeout:-:externalHomePendingTasktableId---"
    Then I softly see value "Review Closeout Request for Grant #{SavedValue:GrantID}" for title "Subject" inside table "---closeout:-:externalHomePendingTasktableId---"
    #87351
    And I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:externalHomePendingTasktableId---"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Attachments" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "Green"
    #86716
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Acknowledgement" as "checked"
    #86712
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    Then I softly see field "Status" as "Submitted to Grantor"
    #93583
    And I save the field labeled "Acknowledgement" as "AcknowledgementCheck"
    And I save the field labeled "Acknowledgement Date" as "AcknowledgementDate"
    And I save the field labeled "Acknowledgement By" as "AcknowledgementBy"
    Then I softly see field "Acknowledgement Date" as "{SavedValue:AcknowledgementDate}"
    Then I softly see field "Acknowledgement By" as "{SavedValue:AcknowledgementBy}"
    Then I softly see field "Acknowledgement" as "{SavedValue:AcknowledgementCheck}"
    #87346
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see that "{SavedValue:CloseoutEGMSID}" has been added in flextable with Id "---closeout:-:pendingTaskTableId---"
    #93641
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    Then I softly see value "{SavedValue:CloseoutEGMSID}" for title "EGMS ID" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    And I softly see value "Early Completion" for title "Sub-Type" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    And I softly see value "Automation PM" for title "Created By" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    And I softly see value "Created" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"

  @87350 @86706 @88851 @VerifyOverriddenJustificationinCloseout  @meenakshi
  Scenario: To verify closeout owner allow to entered the Justification when Overriding the pending items in closeout phase
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    #87350
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Provide justification for overriding open items to closure and proceeding with the closeout. |
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:homePendingTaskTableId---" panel
    #86706
    Then I softly see that "{SavedValue:CloseoutID}" has been added in flextable with Id "---closeout:-:homePendingTaskTableId---"
    And I softly see value "Automation PM" for title "Assigned By" inside table "---closeout:-:homePendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:homePendingTaskTableId---"
    When I "Approve" in the approval decision
    #88851
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I softly see value "Automation PM" for title "Assigned By" inside table "---closeout:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see field "EGMS ID" as "{SavedValue:CloseoutID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Attachments" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page

  @40636 @40741 @VerifyProjectPeriodCloseoutsStatus @meenakshi
  Scenario: To verify Project Period Closeouts with status: Created, Sent to Subrecipient, Overridden , Submitted to Grantor, Rejected, Submitted For Approval, Completed should display in the Project Period Closeouts - All table in the Closeout phase
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    Then I softly see value "Created" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Sent to Subrecipient" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Overridden" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Rejected" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    Then I softly see value "Completed" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"
    #40741
    And I click toggle button to select "Project Period Closeouts - Submitted"
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"

  @93540 @VerifyDifferentTypeOfCloseoutRequestOnSameGrantInCloseout @meenakshi
  Scenario: Verify user can create different type of closeout request on the same grant though another closeout is in progress.
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID1"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID1}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID1}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID1}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID1}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:closeoutID1}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID2"
    When I click on "Save" in the page details
    When I click "{SavedValue:GrantID}" lookup link
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:closeoutID1}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Termination" for title "Type" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Overridden" for title "Status" inside table "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID1}" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see value "{SavedValue:closeoutID2}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Early Completion" for title "Type" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Automation Test Description" for title "Reason" inside table "---closeout:-:closeoutTableId---"
    And I softly see value "Created" for title "Status" inside table "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID2}" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:closeoutID2}" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:closeoutID2}" in flex table with id "---closeout:-:closeoutTableId---"

  @93254 @93255 @93256 @VerifyCloseOutRequestDetailsPage @smoke @monu
  Scenario: Validate user is able to see closeout request details page after clicking on start button under pending tasks
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
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
    Then I softly see field "EGMS ID" as "{SavedValue:closeoutID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Attachments" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    #93255 #monu
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I see status in Progress-bar is "Overridden" and is "Green"
    #93256 #monu
    When I click on "Edit" in the page details
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Reason" as "Automation Test Reason"

  @93096 @40743 @VerifyEditOfCreatedCloseoutRequest @smoke @monu
  Scenario: Validate user is able to edit fields values of created closeout
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Reason" as "Automation Test Reason"
    #40743 #monu
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:closeoutTableId---"

  @93258 @42108 @VerifyExpectedStatusOfCloseoutRequest-Overridden  @monu
  Scenario: Validate user is able to edit fields values of created closeout
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
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #42108 #monu
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Assigned By" inside table "---closeout:-:pendingTaskTableId---"

  @86708 @VerifyStatusOfCloseoutRequestInApprovalHistoryPageBlock  @monu
  Scenario: Validate user is able to see status of closeout request in chevron diagram and inside Approval history table after first approval only
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
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    And I navigate to "History" sub tab
    And I see "{SavedValue:PM Username}" against "Initial Submitter" in approval history
    And I see "{SavedValue:PM Username}" against "Program Office Approval" in approval history
    Then I softly see column "Date" inside row "2" at position "1" contains text "Step : Program Office Approval"
    Then I softly see column "Overall Status" inside row "2" at position "1" contains text "Approved"

  @40759 @VerifyExpectedValueInsideFieldHistoryPageBlockOfCloseoutRequest @monu
  Scenario: Validate expected New value and Old value inside Field History page block for closeout request
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "CloseoutEGMSID"
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:CloseoutEGMSID}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    Then I softly see status in Progress-bar is "Sent To Subrecipient" and is "Green"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Sent To Subrecipient" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "07/20/2023" into field "fieldCloseoutDate__c"
    And I enter value "08/12/2023" into field "fieldCloseoutDueDateGrantor__c"
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:externalHomePendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:externalHomePendingTasktableId---"
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Acknowledgement" as "checked"
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I see status in Progress-bar is "Overridden" and is "Green"
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    And I navigate to "History" sub tab
    And I perform quick search for "{SavedValue:CloseoutEGMSID}" in "History" panel
    Then I softly see value "Overridden" for title "New Value" inside table "History"
    Then I softly see value "Submitted To Grantor" for title "Old Value" inside table "History"

  @87355 @VerifyCloseoutRequestWithMultipleStatusInListVIew @monu
  Scenario: Validate user should be able to see Created, Send to sub-recipient, Overridden, Submitted to grantor status of closeout request inside closeout request list view
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "CloseoutEGMSID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Created" for title "Status" inside table "ProjectPeriodCloseoutGrantor"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    When I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Sent to Subrecipient" for title "Status" inside table "ProjectPeriodCloseoutGrantor"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Sent To Subrecipient" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "07/20/2023" into field "fieldCloseoutDate__c"
    And I enter value "08/12/2023" into field "fieldCloseoutDueDateGrantor__c"
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutEGMSID}" in "---closeout:-:externalHomePendingTasktableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutEGMSID}" inside flex table with id "---closeout:-:externalHomePendingTasktableId---"
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Acknowledgement" as "checked"
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Recipient Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Submitted to Grantor" for title "Status" inside table "ProjectPeriodCloseoutGrantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Draft"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    Then I softly see value "Overridden" for title "Status" inside table "ProjectPeriodCloseoutGrantor"

  @76490 @VerifyEmailNotificationForApprovedCloseoutRequest @monu
  Scenario: Validate user should receive email notification for approval of closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I checkout to yopmail with mailid "grantorinternalpm@yopmail.com"
    And I pause execution for "90" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Closeout Request {SavedValue:closeoutID} has beenapproved for grant# {SavedValue:Automation Runtime Award for closeout}
      """

  @96255 @VerifySystemErrorMessageForReason @monu
  Scenario: Validate user should get error message for blan reason while creating closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    When I enter value "" into field "Reason__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Reason is Required to save. |

  @95522 @VerifyAttachmentUploadBySubrecipientForAdhocCloseoutRequest @monu
  Scenario: Validate sub-recipient user should be able to upload attachment while creating adhoc closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" by clicking "Add" :
      | Description                 | Required  | Status |
      | Automation test description | Mandatory | Active |
    Then I softly see value "Automation test description" for title "Description" inside table "CloseoutChecklistsFlexToggle"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I navigate to "Attachments" sub tab
    And I click on "Attach" icon for "Automation test description" inside flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" with wait for record
    Then I softly see "Upload Document" opens in overLay window
    When I upload file "AttachmentTesting.pdf" into library
    And I click modal button "Save"
    Then I see the following messages in the page details contains:
      | Attachment saved successfully. |
    When I close "Upload Document" modal by clicking the top right x button
    And I click on hyperlink containing value "View"
    Then I softly see new tab is opened

  @95560 @VerifyVisibilityOfAddFilesFopTerminationCloseoutRequest @monu
  Scenario: Validate user is able to see Add files button under closeout details while creating termination closeout request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "Title" in flex table header "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "Classification" in flex table header "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "File Extension" in flex table header "---closeout:-:CloseoutDetailsTableId---"
    Then I softly see "Description" in flex table header "---closeout:-:CloseoutDetailsTableId---"

  @95671 @VerifyUserCanAcknowledgeCloseoutRequest @monu
  Scenario: Validate user can acknowledge closeout request without uploading attachment
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutSupportingDocumentChecklist---" by clicking "Add" :
      | Description                 | Required  | Status |
      | Automation test description | Mandatory | Active |
    Then I softly see value "Automation test description" for title "Description" inside table "CloseoutChecklistsFlexToggle"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter value "Checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "green"
    Then I softly see field "Status" as "Submitted to Grantor"

  @95688 @VerifyChecklistFieldsInReadModeOnly @monu
  Scenario: Verify user can is not able to edit the checklist details filled by grantor
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID1"
    When I navigate to "Checklist" sub tab
    And I enter value "Yes" into field "fieldChecklistQuestionPick1__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick7__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick8__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick9__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick10__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick11__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick12__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick13__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick14__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick15__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick16__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick17__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick18__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick19__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick20__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick21__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick22__c"
    And I enter value "Yes" into field "fieldChecklistQuestionPick23__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID1}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID1}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I navigate to "Checklist" sub tab
    Then I softly see field "Has the subrecipient submitted all payment requests?" as "Yes"
    Then I softly see field "Has the subrecipient met the match requirement?" as "Yes"
    Then I softly see field "Did the subrecipient fully expend program income earned during the award period prior to the closeout of the award?" as "Yes"
    Then I softly see field "Has the subrecipient completed the scope of work as outlined in the subaward agreement?" as "Yes"

  @96615 @VerifyAdvanceValueAtCloseoutRequest @monu
  Scenario: Verify user can see advance value at closeout request as same as on SubAward
    And I navigate to "Actuals" sub tab
    And I save the field labeled "Advance Available" as "AdvanceAmount"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Advance Available" as "{SavedValue:AdvanceAmount}"

  @96612 @VerifyAdvanceBalanceOfFundingAccountAtcloseoutRequest @monu
  Scenario: Verify user can see advance balance of funding account at closeout request as same as on SubAward
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---"
    And I navigate to "Actuals" sub tab
    And I save the field labeled "Advance Balance" as "AdvanceBalance"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see value "{SavedValue:AdvanceBalance}" for title "Advance Balance" inside table "---closeout:-:closeoutFundingAccountsTableId---"

  @96485 @93576 @93582 @VerifyOverriddenPermissionWithSubRecipientUser  @monu
  Scenario: Validate sub recipient user is not allowed to override pending item
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "CloseoutID"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    #93576 #monu
    Then I softly see value "{SavedValue:CloseoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    ##########################################################################################################################
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly cannot see top right button "Override" in page detail
    And I click on "Acknowledge" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    #93582 #monu
    Then I see status in Progress-bar is "Created" and is "Green"
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "green"
    #################################################################
    And I click on hyperlink containing value "{SavedValue:GrantID}"
    And I navigate to "Requests" sub tab
    And I click on "View" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:RecipientCloseoutRequestTableId---"
    Then I softly cannot see top right button "Override" in page detail