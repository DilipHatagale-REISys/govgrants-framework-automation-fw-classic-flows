@closeout @grantor-regression @grantor-parallel-regression
Feature: Validate all scenarios in Closeout

  Background: Navigate to award
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"

  @50971 @50973 @creationAndEditionOfAdhocCloseout
  Scenario: To create and Edit an Adhoc Closeout Request
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @50975 @50974 @assigningApproversAndsendClosoutToSubrecipient @smoke
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

  @50977 @50976 @subrecipientEntersFielsInCloseoutAndAcknowledges
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
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
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

  @50979 @50978 @86715 @overrideCloseoutAndsubmitForApproval @smoke
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
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
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
    When I perform quick search for "Record Id" in "---paymentRequest:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
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
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
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
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
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
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
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

  @40066 @40605 @40608 @40071 @NavigationAcknowledgementAutopopulatedFieldsGrantOverview @ @Keerti
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
    Then I softly see that the saved value "{SavedValue:AcknowledgementDate}" and " " are equal
    Then I softly see that the saved value "{SavedValue:AcknowledgementBy}" and " " are equal
    Then I softly see that the saved value "{SavedValue:ProjectPeriodEndDate}" and "{SavedValue:CloseoutEffectiveDate}" are equal
    Then I softly see that the saved value "{SavedValue:SubrecipientOrganization}" and "{SavedValue:CloseoutSubrecipientOrganization}" are equal
    Then I softly see that the saved value "{SavedValue:FundingOrganization}" and "{SavedValue:CloseoutFundingOrganization}" are equal

  @40636 @40747 @40743 @ChecklistSupportingDocumentNotes @Keerti
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


  @40065 @87352 @40608 @89221 @89222 @89223 @89224 @89225 @89226 @89228 @89229 @89227 @ValidatingCloseoutRequest @meenakshi
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
      | Reviewer Name  | Responsibility| Description     | Due Date |
      | Automation PM | Program Reviewer |Automation Test Description |07/24/2020 |
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
