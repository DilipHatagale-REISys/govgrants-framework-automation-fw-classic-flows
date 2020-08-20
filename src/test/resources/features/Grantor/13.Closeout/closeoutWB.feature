@closeout @grantor-regression @grantor-parallel-regression
Feature: Validate all scenarios in Closeout

  @87347 @87354 @ValidatingCloseoutRequestForEXEUser @meenakshi
  Scenario: To verify the PM user should be able to create the  Closeout Request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    #87347
    Then I softly see "Create Closeout Request" opens in overLay window
    And I save the field labeled "Closeout" as "CloseoutName"
    And I save the field labeled "Closeout Effective Date" as "CloseoutEffectiveDate"
    Then I softly see field "Closeout" as "{SavedValue:CloseoutName}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"
    Then I softly see field "EGMS ID" as "{SavedValue:GrantID}"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Closeout Activities Due Date" as "CloseoutActivitiesDueDate"
    Then I softly see field "Closeout Activities Due Date" as "{SavedValue:CloseoutActivitiesDueDate}"
    Then I softly see field "Closeout Effective Date" as "{SavedValue:CloseoutEffectiveDate}"

  @93457 @ValidatePendingAmendmentRequestInOpenItemsForCloseout @meenakshi
  Scenario Outline: Verify user can view pending amendment requests in Open Items for Closeout request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:AmendmentEGMSID}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    When I click on "Save" in the page details
    When I navigate to "Open Items" sub tab
    #93451 #monu
    Then I softly see "Pending Amendment Requests" page block displayed
    Then I softly see "Pending Progress Reports" page block displayed
    Then I softly see "Pending Payment Requests" page block displayed
    Then I softly see "Pending Site Visits / Desk Reviews" page block displayed
    Then I softly see that "{SavedValue:AmendmentEGMSID}" has been added in flextable with Id "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @93524 @ValidateSiteVisitInOpenItemsForCloseout @meenakshi
  Scenario Outline: Verify user can view pending site visits/ desk reviews in Open Items for closeout Request
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    Then I softly see field "EGMS ID" as "{SavedValue:SiteVisitID}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    Then I softly see "Create Closeout Request" opens in overLay window
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    When I click on "Save" in the page details
    When I navigate to "Open Items" sub tab
    Then I softly see that "{SavedValue:SiteVisitID}" has been added in flextable with Id "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @93795 @76492 @76493 @86710 @validateEmailNotificationReceivedForCloseoutsForEXEUser @meenakshi
  Scenario: To verify Email notification should be received to Closeout Owner when Closeout has created for closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    #93795
    And I checkout to yopmail with mailid "grantorinternalpm@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: New Closeout has been Created.
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---closeout:-:closeoutTableId---" without waiting for record
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
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    And I pause execution for "10" seconds
    And I click on "Acknowledge" in the page details
    #76492
    And I checkout to yopmail with mailid "grantorinternalpm@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout # {SavedValue:closeoutID} Acknowledgedby Subrecipient
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    #76493
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Completed"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "SentToSubrecipient.pdf" for title "File Name" against the value "SentToSubrecipient.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Taken By" against the value "SentToSubrecipient.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    Then I softly see value "Acknowledge.pdf" for title "File Name" against the value "Acknowledge.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    Then I softly see value "{SavedValue:SPI Username}" for title "Taken By" against the value "Acknowledge.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    Then I softly see value "Overriden.pdf" for title "File Name" against the value "Overriden.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Taken By" against the value "Overriden.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    Then I softly see value "Submission.pdf" for title "File Name" against the value "Submission.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Taken By" against the value "Submission.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    And I click on hyperlink containing value "Overriden.pdf"
    And I switch to parent tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I softly see value "Automation PM" for title "Assigned By" inside table "---closeout:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I softly see value "Automation PM" for title "Assigned By" inside table "---closeout:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Completed" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Completed"
    Then I softly see value "Completed" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"

  @87358 @86711 @86707 @86709 @VerifyEmailNoificationRecievedBySPIUserForCloseout @meenakshi
  Scenario: To verify Email notification should be received to SPI user when closeout Request has Sent to Subrecipient in Closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    Given I click on "Send To Subrecipient" in the page details
    And I checkout to yopmail with mailid "automation.spi@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification of Closeout Request for {SavedValue:Automation Runtime Award for closeout}
      """
    #86711
    And I checkout to yopmail with mailid "automation.spa@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification of Closeout Request for {SavedValue:Automation Runtime Award for closeout}
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "Edit" :
      | Responsibility   | Name                     | Description                 |
      | Program Approver | {SavedValue:PM Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username} | Automation Test Description |
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    #86707
    And I checkout to yopmail with mailid "grantorinternalpm@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSubmitted for your Approval.
      """
    #86709
    And I checkout to yopmail with mailid "grantorinternalpm@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSubmitted for your Approval.
      """

  @94022 @94019 @94021 @94040 @94042 @validateSendCloseoutRequestForSendReviewForEXEUser @meenakshi
  Scenario: To verify Closeout owner able to send the Closeout request for Send for review in closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 5        |
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description                 | Due Date |
      | {SavedValue:PM Username} | Program Reviewer | Automation Test Description | 5        |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly see that "{SavedValue:PM Username}" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"
    When I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Edit" against "Sent for Review" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Send for Review" against "Sent for Review" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly cannot see row level action button "Delete" against "Sent for Review" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    #94019
    And I edit the following rows inline in flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "Edit" :
      | Reviewer Name            | Description            | Due Date |
      | {SavedValue:PM Username} | Automation Description | 7        |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I softly see value "Automation Description" for title "Description" inside table "---closeout:-:closeoutPeerReviewTableId---"
    And I softly see value "{Date:MM/dd/yyyy::d+7}" for title "Due Date" inside table "---closeout:-:closeoutPeerReviewTableId---"
    #94021
    And I click on "Delete" icon for "Automation PM" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I softly do not see value "Automation PM" for title "Reviewer Name" inside table "---closeout:-:closeoutPeerReviewTableId---"
    And I softly see value "Automation FO" for title "Reviewer Name" inside table "---closeout:-:closeoutPeerReviewTableId---"
    #94040
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:homePendingTaskTableId---" panel
    Then I softly see that "{SavedValue:closeoutID}" has been added in flextable with Id "---closeout:-:homePendingTaskTableId---"
    Then I softly see value "Automation EXE" for title "Assigned By" inside table "---closeout:-:homePendingTaskTableId---"
    Then I softly see value "Review Grantor closeout" for title "Type" inside table "---closeout:-:homePendingTaskTableId---"
    Then I softly see value "Review Closeout Request for Grant #{SavedValue:GrantID}" for title "Subject" inside table "---closeout:-:homePendingTaskTableId---"
    #94042
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:homePendingTaskTableId---"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Attachments" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see the following messages in the page details :
      | Review has been submitted successfully. |
    When I close "Closeout Review" modal by clicking the top right x button
    Then I softly see that "Submitted" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"

  @93808 @validateSendBackProgramApproverInCloseoutPhase @meenakshi
  Scenario: To verify status changed as : created when Program Approver send Back the closeout Request in Closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
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
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    And I "Send Back" in the approval decision
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "Green"

  @93696 @93581 @validateAwardAmountAndBalanceInOverviewCloseout @meenakshi
  Scenario: Verify the values on fields Awarded amount and Balance on closeout view page if the payment request is not processed
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "NO_ADVANCE_PERMISSION"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
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
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Awarded Amount" as "AwardedAmount"
    And I save the field labeled "Balance" as "BalanceAmount"
    Then I softly see field "Awarded Amount" as "{SavedValue:AwardedAmount}"
    Then I softly see field "Balance" as "{SavedValue:BalanceAmount}"
    #93581
    When I click on "Edit" in the page details
    And I enter value "checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    When I click on "Acknowledge" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you are ready to acknowledge the Closeout Request? You are agreeing to complete any Open Items by the Closeout Due Date." is displayed
    When I click modal button "No"
    Then I softly see field "Status" as "Sent to Subrecipient"

  @76489 @ValidateApprovedCloseoutInsideApprovalHistory-TerminationCloseoutRequest-EXEUser @monu
  Scenario: Validate user is able to see Approved status of closeout request in chevron diagram and inside Approval history table with EXE user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
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
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
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
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    And I navigate to "History" sub tab
    And I perform quick search for "{SavedValue:closeoutID}" in "History" panel
    Then I softly see value "Completed" for title "New Value" inside table "History"
    Then I softly see value "Approved" for title "Old Value" inside table "History"
    And I refresh the page
    #40747 #monu
    And I see "{SavedValue:EXE Username}" against "Initial Submitter" in approval history
    And I see "{SavedValue:PM Username}" against "Program Office Approval" in approval history
    Then I softly see column "Date" inside row "1" at position "1" contains text "Step : Fiscal Office Approval"
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Approved"

  @95571 @VerifyVisibilityOfAddFilesFopTerminationCloseoutRequest-EXEUser @monu
  Scenario: Validate Exe user is not able to see Add files button under closeout details while creating termination closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"

  @95599 @95609 @95607 @VerifySubrecipientAbleToAddAttachmentForTerminationCloseoutRequest-EXEUser @monu
  Scenario: Validate subrecipient user is able to see Add files button on under closeout details while creating termination closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "TerminationValues" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "TerminationEdition" values from "Closeout_Field_Values.xlsx"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
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
    When I navigate to "Attachments" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    And I click on top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    And I upload attachment "Attachment.pdf" of type "Federal Closeout Document" from computer
    Then I softly see "closeout files.png" has been added in "Closeout Files" flex table
    #95609 #monu
    And I click on "Edit" icon for "closeout files.png" inside flex table with id "---closeout:-:CloseoutDetailsTableId---"
    When I select Classification as "Other" at upload file modal
    When I enter value as "Test Automation" in field "Description" at Library Files
    When I click on "Save" button in send email modal
    Then I softly see value "Other" for title "Classification" inside table "---closeout:-:CloseoutDetailsTableId---"
    #95607 #monu
    And I click on "Delete" icon for "closeout files.png" inside flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I see the following messages in the page details :
      | File closeout files.png deleted successfully. |

  @96201 @96202 @VerifyCloseoutDeobligatedAmountForCloseout-Scheduled @monu
  Scenario: Validate user can see closeout deobligated amount for created scheduled closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Closeout"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "Closeout"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantID"
    When I navigate to "Requests" sub tab
    #96202 #monu
    Then I softly see value "Created" for title "Status" inside table "---closeout:-:RequestTabCloseoutRequestTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    Then I can see row level action button "View" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    And I pause execution for "10" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send To Subrecipient" in page detail
    Then I softly can see top right button "Override" in page detail
    ####################################################################
    And I save the field labeled "EGMS ID" as "closeoutID1"
    When I click on "Edit" in the page details
    Then I softly see value "$0.00" for title "Closeout Deobligation" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I click on hyperlink containing value "FA-ST-13"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:CloseoutRelatedSubAwardsTableId---" panel
    Then I softly see value "$0.00" for title "Closeout Deobligation" inside table "---closeout:-:CloseoutRelatedSubAwardsTableId---"

  @96671 @96734 @VerifyUpdatedDetailsInHistorySectionForCloseout-Scheduled @monu
  Scenario: Validate user can see updated details in hiostory section after created scheduled closeout request is sent to sub recipient
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Closeout"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "Closeout"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    Then I softly can see top right button "Send To Subrecipient" in page detail
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Send To Subrecipient" in the page details
    And I navigate to "History" sub tab
    And I perform quick search for "{SavedValue:closeoutID}" in "History" panel
    Then I softly see value "Sent to Subrecipient" for title "New Value" inside table "History"
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "History"
    #96734 #monu
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Requests" sub tab
    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    And I navigate to "History" sub tab
    And I perform quick search for "{SavedValue:closeoutID}" in "History" panel
    Then I softly see value "true" for title "New Value" inside table "History"
    Then I softly see value "false" for title "Old Value" inside table "History"
    Then I softly see value "Acknowledgement" for title "Changed Field" inside table "History"
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "History"

  @93539 @verifyValidationMessageForOverrideJustification @monu
  Scenario: Validate error message for Override justification
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---closeout:-:grantsTableId---"
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
    When I navigate to "Open Items" sub tab
    Then I softly see value "{SavedValue:SiteVisitID}" for title "EGMS ID" inside table "---siteVisits:-:PendingSiteVisitDeskReviewTableId---"
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide justification for overriding open items to closure and proceeding with the closeout.|

