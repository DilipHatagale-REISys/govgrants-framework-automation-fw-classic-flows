@closeoutExecution @closeout @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios in Closeout

  @96615 @VerifyAdvanceValueAtCloseoutRequest @monu
  Scenario: Verify user can see advance value at closeout request as same as on SubAward
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I navigate to "Actuals" sub tab
    Then I softly see field "Advance Available" as "$0.00"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Advance Available" as "$0.00"

  @87347 @87354 @ValidatingCloseoutRequestForEXEUser @meenakshi
  Scenario: To verify the PM user should be able to create the  Closeout Request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
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
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
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
    Then I softly see that "{SavedValue:SiteVisitID}" has been added in flextable with Id "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  @93795 @76492 @76493 @86710 @validateEmailNotificationReceivedForCloseoutsForEXEUser @meenakshi
  Scenario: To verify Email notification should be received to Closeout Owner when Closeout has created for closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
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
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    And I wait for "3" seconds
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
    #76492
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout # {SavedValue:closeoutID} Acknowledgedby Subrecipient
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    #76493
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Submission.pdf" for title "File Name" inside table "---closeout:-:snapshotHistoryTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Taken By" inside table "---closeout:-:snapshotHistoryTableId---"
    Then I softly see value "Acknowledge.pdf" for title "File Name" inside table "---closeout:-:snapshotHistoryTableId---"
    Then I softly see value "{SavedValue:SPI3 Username}" for title "Taken By" inside table "---closeout:-:snapshotHistoryTableId---"
    Then I softly see value "Overriden.pdf" for title "File Name" inside table "---closeout:-:snapshotHistoryTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Taken By" inside table "---closeout:-:snapshotHistoryTableId---"
  #  Then I softly see value "Submission.pdf" for title "File Name" against the value "Submission.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
  #  Then I softly see value "{SavedValue:PM Username}" for title "Taken By" against the value "Submission.pdf" inside table "---subAwardStandAlone:-:snapshotHistoryTableId---"
    And I click on hyperlink containing value "Overriden.pdf"
    Then I softly verify that the file "Overriden.pdf" is downloaded
    And I switch to parent tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Completed" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - Completed"
    Then I softly see value "Completed" for title "Status" inside table "---closeout:-:ProjectPeriodCloseoutTableId---"

  @87358 @86711 @86707 @86709 @VerifyEmailNoificationRecievedBySPIUserForCloseout @meenakshi @buglogged-234888
  Scenario: To verify Email notification should be received to SPI user when closeout Request has Sent to Subrecipient in Closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I pause execution for "180" seconds
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
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:CloseoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    When I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    When I click on "Edit" in the page details
    And I enter "Override" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    #86707
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSubmitted for your Approval
      """
    #86709
    And I checkout to yopmail with mailid "fo.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSubmitted for your Approval
      """

  @94022 @94019 @94021 @94040 @94042 @validateSendCloseoutRequestForSendReviewForEXEUser @meenakshi
  Scenario: To verify Closeout owner able to send the Closeout request for Send for review in closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    And I softly do not see value "Automation PM" for title "Reviewer Name" inside table "---closeout:-:closeoutPeerReviewTableId---"
    And I softly see value "Automation FO" for title "Reviewer Name" inside table "---closeout:-:closeoutPeerReviewTableId---"
    #94040
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:homePendingTaskTableId---" panel
    Then I softly see that "{SavedValue:closeoutID}" has been added in flextable with Id "---closeout:-:homePendingTaskTableId---"
    Then I softly see value "Review Grantor closeout" for title "Task Type" inside table "---closeout:-:homePendingTaskTableId---"
    Then I softly see value "Review Closeout Request for Grant #{SavedValue:GrantID}" for title "Subject" inside table "---closeout:-:homePendingTaskTableId---"
    #94042
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:homePendingTaskTableId---"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Open Items" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---closeout:-:closeoutPeerReviewTableId---"

  @93808 @validateSendBackProgramApproverInCloseoutPhase @meenakshi
  Scenario: To verify status changed as : created when Program Approver send Back the closeout Request in Closeout phase
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
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
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "fieldReason__c"
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
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "NO_ADVANCE_PERMISSION" of type "Competitive"
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
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Cumulative Obligation" as "AwardedAmount"
    And I save the field labeled "Balance" as "BalanceAmount"
    Then I softly see field "Cumulative Obligation" as "{SavedValue:AwardedAmount}"
    Then I softly see field "Balance" as "{SavedValue:BalanceAmount}"
    #93581
    When I click on "Edit" in the page details
    And I enter value "checked" into field "fieldAggreement__c"
    When I click on "Save" in the page details
    When I click on "Acknowledge" in the page details without processing
    Then I softly see confirmation box with body "You are agreeing to complete any Open Items by the Closeout Due Date. Are you sure you are ready to acknowledge the Closeout Request?" is displayed
    When I click modal button "No"
    Then I softly see field "Status" as "Sent to Subrecipient"

  @76489 @ValidateApprovedCloseoutInsideApprovalHistory-TerminationCloseoutRequest-EXEUser @monu @buglogged140761
  Scenario: Validate user is able to see Approved status of closeout request in chevron diagram and inside Approval history table with EXE user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
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
    And I see "{SavedValue:PM Username}" against "Step 1" in approval history
    Then I softly see column "Date" inside row "1" at position "1" contains text "Step : Step 2"
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Approved"

  @95571 @VerifyVisibilityOfAddFilesFopTerminationCloseoutRequest-EXEUser @monu
  Scenario: Validate Exe user is not able to see Add files button under closeout details while creating termination closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "ProjectPeriodCloseoutGrantor"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"

  @95599 @95609 @95607 @VerifySubrecipientAbleToAddAttachmentForTerminationCloseoutRequest-EXEUser @monu
  Scenario: Validate subrecipient user is able to see Add files button on under closeout details while creating termination closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Then I softly see that "{SavedValue:FO Username}" has been added in flextable with Id "---closeout:-:closeoutApproverTableId---"
    When I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I click on top right button "Add Files" in flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    And I upload attachment "Attachment.pdf" of type "Federal Closeout Document" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "---closeout:-:ExternalCloseoutDetailsTableId---"
    Then I softly see value "{SavedValue:AttachedFile}" for title "Title" inside table "---closeout:-:ExternalCloseoutDetailsTableId---"
    #95609 #monu
    And I click on "Edit" icon for "{SavedValue:AttachedFile}" inside flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    When I select Classification as "Other" at upload file modal
    When I enter value as "Test Automation" in field "Description" at Library Files
    When I click on "Save" button in send email modal
    Then I softly see value "Other" for title "Classification" inside table "---closeout:-:ExternalCloseoutDetailsTableId---"
    #95607 #monu
    And I click on "Delete" icon for "{SavedValue:AttachedFile}" inside flex table with id "---closeout:-:ExternalCloseoutDetailsTableId---"
    Then I see the following messages in the page details :
      | File {SavedValue:AttachedFile} deleted successfully. |

  @96201 @96202 @VerifyCloseoutDeobligatedAmountForCloseout-Scheduled @monu @buglogged140762
  Scenario: Validate user can see closeout deobligated amount for created scheduled closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    Then I softly can see row level action button "View" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    And I pause execution for "3" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send To Subrecipient" in page detail
    ####################################################################
    And I save the field labeled "EGMS ID" as "closeoutID1"
    When I click on "Edit" in the page details
    Then I softly see value "$0.00" for title "Closeout Deobligation" inside table "---closeout:-:closeoutFundingAccountsTableId---"
    And I click on hyperlink containing value "---AUTOEnvData:-:fundingAccount---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:CloseoutRelatedSubAwardsTableId---" panel
    Then I softly see value "$0.00" for title "Closeout Deobligation" inside table "---closeout:-:CloseoutRelatedSubAwardsTableId---"

  @96671 @96734 @VerifyUpdatedDetailsInHistorySectionForCloseout-Scheduled @monu
  Scenario: Validate user can see updated details in hiostory section after created scheduled closeout request is sent to sub recipient
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
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
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Justification for overriding open items to closure and proceed with the closeout. |

  @96511 @validateVisibilityOfEditAndOverrideButtonWithNonAwardOwner @monu @buglogged141297
  Scenario: Verify non award owner cannot override or edit pending items of closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
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
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "DynamicUser" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "ProjectPeriodCloseoutGrantor"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Override" in page detail

  @96514 @validateAcknowledgeFieldIsNonEditable @monu @wip
  Scenario: Verify closeout owner is not able to edit after closeout request is submitted to grantor
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
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
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    Given I click on "Send To Subrecipient" in the page details
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "ProjectPeriodCloseoutGrantor"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    When I click on "Edit" in the page details

  @96735 @VerifyApprovalDecisionFieldsAndButtons-Scheduled @monu @buglogged141587
  Scenario: Validate user can see approval decision fields and button at approval decision box
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Send To Subrecipient" in the page details
    And I save the field labeled "EGMS ID" as "closeoutID"
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
    When I click on "Override" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "ProjectPeriodCloseoutGrantor" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "ProjectPeriodCloseoutGrantor"
    And I select radio button "Forward" in the approval decision
    Then I can see the comment box in the approval decision
    Then I can see user "{SavedValue:EXE Username}" in the user lookup in the approval decision

  @96200 @VerifyEditDeleteActionIconsAtAdhocCloseout @buglogged141617
  Scenario: Validate user other than owner is not able to see Edit and delete row level icon
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "closeoutRequestNo"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I softly can see row level action button "View" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"

  @141925 @141947 @154057 @Verify1StepApprovalForScheduleCloseoutRequest-RnRFuntionality @monu
  Scenario: Verify user is able to add one step approver for schedule closeout request
  |Verify user is able to add step 2 approver for schedule closeout request|
  |Verify user is able to add four step approver on schedule closeout request|
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Closeout"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "Closeout"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Requests" sub tab
    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    Then I softly see "Saved Successfully!" inside flex table with id "---closeout:-:closeoutApproverTableId---"
    And I refresh the page
    #141947 #monu
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 2   |
    Then I softly see "Saved Successfully!" inside flex table with id "---closeout:-:closeoutApproverTableId---"
    #154057
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 3   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FD Username} | Step 4   |
    Then I softly see "Saved Successfully!" inside flex table with id "---closeout:-:closeoutApproverTableId---"

  @141949 @VerifyErrorMessageWhileSkippingStepsForScheduleCloseoutRequest-RnRFuntionality @monu
  Scenario: Verify the user is not able to skip approver step on schedule closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
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
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I navigate to "Checklist" sub tab
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 4   |
    And I refresh the page
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - You cannot skip an Approval Step. |

  @153657 @verifyUserNotAbleToSkipApproverAtScheduleCloseoutRequest-RnRFunctionality @monu
  Scenario: Verify the validation message when approval step has <NA>  on schedule closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
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
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I navigate to "Checklist" sub tab
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Override" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | NA       |
    And I refresh the page
    And I click on "Submit for Approval" in the page details
    And I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |

  @153659 @VerifyUserShouldNotBeAbleToAddSameStepForMultipleUserAtScheduleCloseoutRequest-RnRFunctionality @monu
  Scenario: Verify validation displayed when same step is added for different approver for schedule closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    Then I softly see "You cannot specify the same step for multiple users for Closeout." inside flex table with id "---closeout:-:closeoutApproverTableId---"

  @153658 @VerifyUserShouldNotBeAbleToAddSameUserForMultipleStepAtScheduleCloseoutRequest-RnRFunctionality @monu
  Scenario: Verify validation displayed when same approver is added on different  step for schedule closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 2   |
    Then I softly see "You cannot specify the same user for multiple steps for Closeout" inside flex table with id "---closeout:-:closeoutApproverTableId---"

  @153656 @Verify2StepApprovalForScheduleCloseoutRequest-RnRFuntionality @monu
  Scenario: Verify user is able approve the schedule closeout request in two step approver
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
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
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "Green"

  @154050 @Verify3StepApprovalFor-ScheduleCloseoutRequest-RnRFunctionality @monu
  Scenario: Verify user is able to add three step approver for schedule closeout and reject it on step three
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 3   |
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
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"

  @154049 @Verify2StepApprovalFor-ScheduleCloseoutRequest-RnRFunctionality @monu @buglogged171129
  Scenario: Verify user can add two step approver on schedule closeout and forward
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
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
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PM Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"

  @154027 @Verify2StepApprovalFor-ScheduleCloseoutRequest-RnRFunctionality @monu @buglogged171129
  Scenario: Validate Approvers are getting inherited from award record to schedule closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 2   |
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
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PM Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"

  @154027 @VerifyApproverGettingInheritedToScheduledCloseoutRequestFromAward-RnRFunctnality @monu
  Scenario: Validate Approvers are getting inherited from award record to schedule closeout request
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---closeout:-:closeoutApproverTableId---"

  @153597 @Verify1StepApprovalFor-ScheduleCloseoutRequest-RnRFunctionality @monu
  Scenario: Verify user is able to add step 1 approver for schedule closeout request and approve it
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    When I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "fieldReason__c"
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Override Justification" as "Automation Test justification"
    When I click on "Override" in the page details
    And I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeouts - All"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:ProjectPeriodCloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:ProjectPeriodCloseoutTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "Green"

  @199767 @ValidateEXEuseroldownershouldnotabletoseebuttonssectionallevel&pagelevelwhenownershiprelatedtaskisreassigntonewEXEuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate EXE user(old owner) should not able to see buttons sectional level & page level when ownership related task is reassign to new EXE user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Override" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---closeout:-:closeoutFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---closeout:-:closeoutNotesTableId---"

  @199844 @ValidatPMuserasAwardownershouldnotgetaffectedevenifownershiprelatedtaskofcloseoutisreassignfromonePOusertootherPOuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate  PM user as Award owner should not get affected even if ownership related task of closeout is reassign from one PO user to other PO user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PO" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"

  @199847 @ValidatePMuserinternalownershouldbegrantownerwillgetupdatedunderownersectionwhenwearedoingschedulecloseout @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user internal owner should be grant owner will get updated under owner section when we are doing schedule closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
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
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I see status in Progress-bar is "Created" and is "green"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---closeout:-:closeoutOwnerTableId---"

  @200132 @ValidatePMuserAwardownerwillremainsameevenafterownershipofcloseoutischangedfromonePOtootherPOinAcknowledgebyS/rstate @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user (Award owner) will remain same even after ownership of closeout is changed from one PO to other PO in 'Acknowledge by S/r' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO1" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PO" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"

  @200146 @ValidatePOusercloseoutownerfieldhistorytableshouldbeupdatedwhenownershipofcloseoutistransfertonewuserinSubmittedforapprovalstate @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PO user(closeout owner) field history table should be updated when ownership of closeout is transfer to new user in 'Submitted for approval' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---closeout:-:closeoutHistoryTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---closeout:-:closeoutHistoryTableId---"

  @200169 @ValidatePOuserCloseoutApproverRejectedNotifyemailshoulbegeneratedinyopmailtonewcloseoutownerwhenownershipistransferfromonePOtootherPOisinSubmitforapprovalstate @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PO user 'Closeout Approver Rejected Notify' email should be generated in yopmail to new closeout owner when ownership is transfer from one PO to other PO is in 'Submit for approval' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has been Rejected
      """

    Then I see the mail text is as follows :

      """
      Hello ,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been rejected by the Approver.
      Log in to EGMS and click here for further details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200170 @ValidateEXEuserCloseoutSubmittedbyPeerRevieweremailshouldbegeneratedinyopmailtonewcloseoutownerwhenownershipistransferfromoneEXEtootherEXEisinReviewedstate @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate EXE user 'Closeout Submitted by Peer Reviewer' email should be generated in yopmail to new closeout owner when ownership is transfer from one EXE to other EXE is in 'Reviewed' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:homePendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:CloseoutID}" inside flex table with id "---closeout:-:homePendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly can see top right button "Complete Review" in page detail
    When I click on "Complete Review" in the page details
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Review completed for {SavedValue:closeoutID}
      """

  @200244 @Validateinitiatorofcloseout2shouldbeanyuserexeppmevenifownershipofcloseou1istransferredfromonePOusertootherPOuserandrejectthefirstcloseout @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate initiator of closeout 2 should be any user<exe,po,pm> even if ownership of closeout 1 is transferred from one PO user to other PO user and reject the first close out
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
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
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---closeout:-:closeoutOwnerTableId---"

  @200262 @ValidatePMuseroldownershouldnothavetheeditaccesspagelayout&sectionallevelbuttonsisinSubmittedforreviewstateafterownershipofcloseoutistransferfromonePMusertootherPMuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user (old owner) should not have the edit access (page layout & sectional level buttons) is in 'Submitted for review' state after ownership of closeout is transfer from one PM user to other PM user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM1" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly can see top right button "Complete Review" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I can see top right button "Add" in flex table with id "---closeout:-:closeoutNotesTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly cannot see top right button "Complete Review" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I cannot see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I can see top right button "Add" in flex table with id "---closeout:-:closeoutNotesTableId---"

  @199756 @199758 @ValidatePMusercloseoutownerOwnershipbasedtaskAcknowledgeCloseoutRequestreassigntonewPMuserinSendtosubrecipientstatethennewPMuserwillownerofthattask @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user (closeout owner)Ownership based task 'Acknowledge Closeout Request' reassign to new PM user in 'Send to subrecipient state' then new PM user will owner of that task
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---closeout:-:closeoutOwnerTableId---"
    #199758
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---closeout:-:CloseoutTableId---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I cannot see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I can see top right button "Add" in flex table with id "---closeout:-:closeoutNotesTableId---"

  @199771 @ValidatenewcloseoutownerasPOusershouldhavethesameeditaccesspagelayou&sectionallevelbuttonstonewuseoldownerofcloseouthadAcknowledgebysubrecipientstatewhenownershipbasedtaskisreassigntonewuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate new closeout owner as PO user should have the same edit access (page layout & sectional level buttons) to new user as old owner of closeout had in 'Acknowledge by subrecipient' state when ownership based task is reassign to new user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I can see top right button "Add" in flex table with id "---closeout:-:closeoutNotesTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:closeoutID}" in flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:closeoutID}" in flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:closeoutID}" in flex table with id "---closeout:-:CloseoutTableId---"
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly cannot see top right button "Submit for Approval" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I cannot see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I can see top right button "Add" in flex table with id "---closeout:-:closeoutNotesTableId---"

  @199774 @ValidatePMuserEmailCloseoutApproverSentBackNotifyshouldtriggertonewownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user Email 'Closeout Approver Sent Back Notify' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 1   |
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
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenSent Back
      """

    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been sent back by the Approver.
      Log in to EGMS and follow the link here for further details, and resubmit for approvals.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @199762 @ValidatePOusernewownerpendingtaskshouldbecreatedfortaskownershipofAcknowledgeCloseoutRequestwhenoldPOuserreassigntheownershiprelatedtasktonewPOuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PO user (new owner) pending task should be created for task ownership of Acknowledge Closeout Request when old PO user reassign the ownership related task to new PO user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation PO user" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"

  @199795 @ValidatePOuserEmailCloseoutApproverApprovedshouldtriggertonewownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PO user Email 'Closeout Approver Approved' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Completed" and is "green"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Closeout Request {SavedValue:closeoutID} has beenapproved
      """

    Then I see the mail text is as follows :

      """
      Hello ,

     This email is to notify you that the Closeout Request {SavedValue:closeoutID} for the Grant # {SavedValue:GrantEGMSID} has been approved.

      Closeout Details:
      Grant Number: {SavedValue:GrantEGMSID}
      Project Period Start Date: {Date:M/d/yyyy}
      Project Period End Date: {Date:M/d/yyyy::d+3650}
      Closeout Type: Early Completion

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com, if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @200525 @ValidatePMuserGrantownerfieldhistorytableundeGrantphaseshouldbeupdateifweselectcloseoutindropdownwhenownershipofcloseoutistransfertonewuserinApprovedstate @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user(Grant owner) field history table under Grant phase should be updated if we select closeout in dropdown when ownership of closeout is transfer to new user in 'Approved' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name           | Closeout |
      | Automation PM1 | Step 1   |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO1" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "History" sub tab
    And I select "Closeout" from dropdown present on top right of flex table id "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "Automation PO1" for title "New Value" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---subAwardStandAlone:-:historyTableId---"

  @200259 @ValidatePMuserasownerofcloseoutshouldnotaffectedevenifownershipofAwardistransferfromonePMusertootherPMuserisinSubmittedforapprovalstate @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user as owner of closeout should not affected even if ownership of Award is transfer from one PM user to other PM user is in 'Submitted for approval' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name          | Closeout |
      | Automation FO | Step 1   |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    And I Click on "Reassign Records" icon for "Grant" without tableid
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
    When I check "{SavedValue:GrantEGMSID}" boxes in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---subAwardStandAlone:-:grantSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:grantTargetOwnerTableId---" panel
    Then I softly see value "{SavedValue:GrantEGMSID}" for title "Grant ID" inside table "---subAwardStandAlone:-:grantTargetOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---closeout:-:closeoutOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see that "Automation PM" has been added in flextable with Id "---closeout:-:closeoutHistoryTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---subAwardStandAlone:-:historyTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"

  @229477 @ValidateusershouldnotabletoseeclosegrantrecordonownershiplookupforAdminuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate user should not able to see close grant record on ownership lookup for Admin user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
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
    When I re-login to "As a Grantor" app as "DynamicUser" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Completed"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    And I Click on "Reassign Records" icon for "Grant" without tableid
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:grantSourceOwnerTableId---" panel
    Then I softly do not see value "{SavedValue:GrantEGMSID}" for title "EGMS ID" inside table "---subAwardStandAlone:-:grantSourceOwnerTableId---"

  @227801 @ValidatePMuserifownersomerecordsaresame&somearedifferentthanownerofcloseoutthenweshouldgetvalidationonoverriddenbuttonbutsomerecordsareforceclosedifownerofrecordsissameasownerofcloseoutafterownershiptransfer @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user if owner of some records are same & some are different than owner of closeout then we should get validation on overridden button but some records are force closed if owner of records is same as owner of closeout after ownership transfer
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    # Desk Review
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "DeskReview"
    #Site Visit
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    #Amendment Request
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
#    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
#    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
#    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
#    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 2            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #Progress Report
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name          | Progress Report |
      | Automation PM | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #payment request 1
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
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
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                     | Reimbursement |
      | {SavedValue:PM Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #payment request 2
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Payment Request"
    And I Click on "Reassign Records" icon for "Payment Request" without tableid
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentRequestSourceOwnerTableId---" panel
    Then I see value "{SavedValue:PayreqId}" for title "Payment Request ID" inside table "---paymentRequest:-:paymentRequestSourceOwnerTableId---"
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentRequestSourceOwnerTableId---" panel
    When I check "{SavedValue:PayreqId}" boxes in flex table with id "---paymentRequest:-:paymentRequestSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---paymentRequest:-:paymentRequestSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentRequestSourceOwnerTableId---" panel
    Then I do not see value "{SavedValue:PayreqId}" for title "Payment Request ID" inside table "---paymentRequest:-:paymentRequestSourceOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    #Closeout
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    Then I see the following messages in the page details contains:
      | Open Items - Some records on the grant selected for closeout are Submitted for Approval, to proceed with the business process of Override you may have to either send the record to owner or approve/reject the record.|
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:PayreqId1}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"

  @199819 @199765 @ValidatePOuserEmailshouldgeneratedinyopmailtonewownerofcloseoutwhenonceownershiprelatedtaskreassigntonewuserofcloseout @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PO user Email should generated in yopmail to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation PO Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @199768 @ValidatePMuserEmailshouldgeneratedinyopmailtoold&newownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user Email should  generated in yopmail to old & new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
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
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation PM Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation PM Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200126 @ValidatePOusercloseoutowneremailshouldbegeneratedfosystemadminpreviousownerandnewownerofcloseoutafterownershipofcloseoutischangedinCreatedstate @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PO user(closeout owner)email should be generated for system admin, previous owner and new owner of closeout after ownership of closeout is changed in 'Created' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO1" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I checkout to yopmail with mailid "automationpo@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation ADMIN Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation ADMIN Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
     Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:closeoutID} Automation ADMIN Closeout

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @200171 @ValidatePMuserCloseoutApproverSentBackemailshouldbegeneratedinyopmailtonewcloseoutownerwheownershipistransferfromonePMtootherPMisinSubmittedforApprovalstate @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate PM user Email 'Closeout Approver Sent Back Notify' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 1   |
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
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Closeout Request {SavedValue:closeoutID} has beenSent Back
      """

    Then I see the mail text is as follows :
      """
      Hello,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been sent back by the Approver.
      Log in to EGMS and follow the link here for further details, and resubmit for approvals.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @200135 @ValidatePOusernewownerwillhavethesameaccesspagelayout&sectionallevelbuttonsasoldownerhadinAcknowledgebyS/rstateafterownershipofcloseoutistransferfromonePOusertootherPOuser @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate PO user (new owner) will have the same access (page layout & sectional level buttons) as old owner had in 'Acknowledge by S/r' state after ownership of closeout is transfer from one PO user to other PO user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    Then I softly see status in Progress-bar is "Acknowledged by Subrecipient" and is "Green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO1" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---closeout:-:closeoutApproverTableId---"
    And I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---closeout:-:CloseoutDetailsTableId---"
    Then I can see top right button "Add" in flex table with id "---closeout:-:closeoutNotesTableId---"

  @162149 @ValidateProjectPeriodcloseoutrequestPMusercanreassignApprovaltasktootherPMuser @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate Project Period closeout request PM user can reassign Approval task to other PM user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name          | Closeout |
      | Automation FO | Step 1   |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @200153 @ValidatePMuserCloseoutRequestAwardownernotifyemailshouldbegeneratedinyopmailtoawardownerwhencloseoutisinCreatedstate @sprint-5-US-197578 @vaibhav @reassignment
  Scenario: Validate PM user Closeout Request Award owner notify email should be generated in yopmail to award owner when closeout is in 'Created' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: New Closeout has been Created.
      """

    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that the Early Completion Closeout request - {SavedValue:closeoutID} has been created for the Grant #{SavedValue:GrantEGMSID}.

     Closeout Details:
      Grant Number: {SavedValue:GrantEGMSID}
      Project Period Start Date: {Date:M/d/yyyy}
      Project Period End Date: {Date:M/d/yyyy::d+3650}
      Closeout Type: Early Completion

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @232344 @ValidatePMuserAwardownerwillremainsameevenafterownershipofcloseoutischangedfromonePOtootherPOinCompletedstate @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate PM user Award owner will remain same even after ownership of closeout is changed from one PO to other PO in 'Completed' state
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside table
    When I navigate to "History" sub tab
    And I select "Closeout" from dropdown present on top right of flex table id "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "Automation PO1" for title "New Value" inside table "---subAwardStandAlone:-:historyTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---subAwardStandAlone:-:historyTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---subAwardStandAlone:-:subawardOwnerTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---closeout:-:closeoutHistoryTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---closeout:-:closeoutHistoryTableId---"

  @224656 @ValidateCloseoutnewownerofpeerreviewershouldabletosubmitthereviewcommentforcloseout @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Closeout new owner of peer reviewer should able to submit the review comments for closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
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
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description                 | Due Date |
      | {SavedValue:FO Username} | Program Reviewer | Automation Test Description | 5        |
    When I enter the following values into flex table with id "---closeout:-:closeoutPeerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Responsibility   | Description                 | Due Date |
      | {SavedValue:EXE Username} | Program Reviewer | Automation Test Description | 5        |
    When I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    When I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation EXE1" inside flex table with id "---closeout:-:closeoutPeerReviewTableId---"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Review completed for {SavedValue:closeoutID}
      """
    Then I see the mail text is as follows :
      """
      Hello Automation EXE,

      A review has been completed for Closeout {SavedValue:closeoutID} as per the details provided below:.

     Closeout Details:
      Grant Number: {SavedValue:GrantEGMSID}
      Project Period Start Date: {Date:M/d/yyyy}
      Project Period End Date: {Date:M/d/yyyy::d+3650}
      Closeout Type: Early Completion

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @227789 @ValidatePMuserwhenrecordsunderopenitemsisonlyinsubmitforapprovalstate&ownerofthatrecordisdifferentfromcloseoutownerthenshouldgeterrormessageonoverriddenbuttonafterownershiptransfer @sprint-12-US-226976 @vaibhav @reassignment
  Scenario: Validate PM user when records under open items is only in submit for approval state & owner of that record is different from closeout owner then should get error message on overridden button after ownership transfer
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    # Desk Review
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "DeskReview"
    #Site Visit
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    #Amendment Request
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
#    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
#    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
#    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
#    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 2            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #Progress Report
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name           | Progress Report |
      | Automation EXE | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #payment request 1
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
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
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name           | Reimbursement |
      | Automation PM1 | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #payment request 2
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                      | Advance |
      | {SavedValue:EXE Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #Closeout
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    Then I see the following messages in the page details contains:
      | Open Items - Some records on the grant selected for closeout are Submitted for Approval, to proceed with the business process of Override you may have to either send the record to owner or approve/reject the record. |
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:PayreqId1}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"

  @227798 @ValidatePMuserwhenrecordsunderopenitemsisinanystateexceptsubmitforapprovalstatethenweshouldoverrideopenitems&forceclosethatopenitems&proceedfurtherevenafterownershiptransfer @sprint-12-US-226976 @vaibhav @reassignment
  Scenario: Validate PM user when records under open items is in any state except submit for approval state then we should override open items & force close that open items & proceed further even after ownership transfer
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
      # Desk Review
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "DeskReview"
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Then I softly see field "Status" as "Notified"
    #Site Visit
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    Then I softly see field "Status" as "In Progress"
    #Amendment Request
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
     #Progress Report
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    #payment request
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    #Closeout
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Notified" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "In Progress" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"

  @227799 @ValidatePMusecanshowtheownerorinterceptorcolumnforrespectivemoduleswhichisinopenitemssectiontovalidatetheownerofrecordsunderopenitems&ownerofcloseoutshouldgetsame @sprint-12-US-226976 @vaibhav @reassignment
  Scenario: Validate PM user can show the owner or interceptor column for respective modules which is in open items section to validate the owner of records under open items & owner of closeout should get same
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    # Desk Review
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "DeskReview"
    #Site Visit
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    #Amendment Request
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 2            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #Progress Report
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Progress Report" without tableid
    And I pause execution for "3" seconds
    When I perform quick search for "{SavedValue:progID}" in "---progressreport:-:progressSourceTableId---" panel
    When I check "{SavedValue:progID}" boxes in flex table with id "---progressreport:-:progressSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---progressreport:-:progressSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:progID}" in "---progressreport:-:progressTargetTableId---" panel
    Then I see value "{SavedValue:progID}" for title "Progress Report ID" inside table "---progressreport:-:progressTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name           | Progress Report |
      | Automation PM1 | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #payment request 1
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
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
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    And I Click on "Reassign Records" icon for "Payment Request" without tableid
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentRequestSourceOwnerTableId---" panel
    When I check "{SavedValue:PayreqId}" boxes in flex table with id "---paymentRequest:-:paymentRequestSourceOwnerTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---paymentRequest:-:paymentRequestSourceOwnerTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentRequestSourceOwnerTableId---" panel
    Then I do not see value "{SavedValue:PayreqId}" for title "Payment Request ID" inside table "---paymentRequest:-:paymentRequestSourceOwnerTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name           | Reimbursement |
      | Automation PM1 | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #Closeout
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    When I click on "Override" in the page details
    Then I softly see the following messages in the page details contains:
      | Open Items - Some records on the grant selected for closeout are Submitted for Approval, to proceed with the business process of Override you may have to either send the record to owner or approve/reject the record. |
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"

  @228156 @ValidatePMuserwecanoverridethependingitemswhenstateofrecordsareApprovedeventhoughownerofsomerecordsaredifferentthanownerofcloseoutincaseofownershiptransfer @sprint-12-US-226976 @vaibhav @reassignment
  Scenario: Valdate PM user we can override the pending items when state of records are Approved even though owner of some records are different than owner of closeout in case of ownership transfer
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    # Desk Review
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "DeskReview"
    #Site Visit
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    #Amendment Request
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
#    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
#    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
#    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
#    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 2            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #Progress Report
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name           | Progress Report |
      | Automation EXE | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #payment request 1
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
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
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name           | Reimbursement |
      | Automation EXE | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #payment request 2
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Forms and Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    #Closeout
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:PayreqId1}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:progID}" for title "EGMS ID" inside table "---progressReport:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    When I navigate to "Open Items" sub tab
    Then I see "No Records Found" inside flex table with id "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I see "No Records Found" inside flex table with id "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Submitted to Grantor" for title "Status" against the value "{SavedValue:PayreqId1}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I see "No Records Found" inside flex table with id "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I see "No Records Found" inside flex table with id "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId1}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"

  @227791 @ValidatePMuserwhenrecordsunderopenitemsisinsubmitforapprovalstate&ownerofthatrecordissameascloseoutownerthenusershouldoverrideopenitems&forceclosethatopenitem&proceedfurtherevenafterownershiptransfer @sprint-12-US-226976 @vaibhav @reassignment
  Scenario: Validate PM user when records under open items is in submit for approval state & owner of that record is same as closeout owner then user should override open items & force close that open items & proceed further even after ownership transfer
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    # Desk Review
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "DeskReview"
    #Site Visit
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter values into fields
      | Value                 | Field                     |
      | Automation Site Visit | fieldTitle__c             |
      | Automation SPI3       | fieldGranteePOCContact__c |
      | Program & Fiscal      | fieldMonitoringType__c    |
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    #Amendment Request
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
#    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
#    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
#    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
#    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 2            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #Progress Report
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name           | Progress Report |
      | Automation PM1 | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #payment request 1
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
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
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name           | Reimbursement |
      | Automation PM1 | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
     #payment request 2
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    #Closeout
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Closeout"
    And I Click on "Reassign Records" icon for "Closeout" without tableid
    Then I softly see "Closeouts Available for Reassignment " page block displayed
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:PayreqId1}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    When I click on "Override" in the page details
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SOWAMENDMENTREQUEST}" inside table "---closeout:-:closeoutPendingAmendmentRequestsTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId1}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:PayreqId}" inside table "---closeout:-:closeoutPaymentRequestTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:DeskReview}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:SitevVisitId}" inside table "---closeout:-:PendingSiteVisitDeskReviewTableId---"

  @199794 @ValidateEXEuserEmailCloseoutApproverRejectNotifyshouldtriggertonewownerofcloseoutwhenonceownershiprelatedtaskisreassigntonewuserofcloseout @sprint-5-US-192940 @vaibhav @reassignment
  Scenario: Validate EXE user Email 'Closeout Approver Reject Notify' should trigger to new owner of closeout when once ownership related task is reassign to new user of closeout
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 1   |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "20" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Closeout Request {SavedValue:closeoutID} has beenRejected
      """

    Then I see the mail text is as follows :

      """
      Hello ,
      This email is to notify you that the Closeout Request {SavedValue:closeoutID} has been rejected by the Approver.
      Log in to EGMS and click here for further details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """

  @199846 @Validatefieldhistorytableshouldbeupdateoncownershiprelatedtaskreassignfromoneusertootheruser @sprint-5-US-192940 @vaibhav @reassignment
  Scenario: Validate field history table should be update once ownership related task reassign from one user to other user
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation EXE user" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
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
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:FO Username} | Step 1   |
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---closeout:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:closeoutID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:closeoutID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---closeout:-:closeoutHistoryTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---closeout:-:closeoutHistoryTableId---"