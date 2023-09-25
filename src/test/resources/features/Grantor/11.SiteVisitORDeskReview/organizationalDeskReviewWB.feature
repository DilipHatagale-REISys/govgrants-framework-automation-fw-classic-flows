@organizationalDeskReviewWB @grantor-regression @grantor-parallel-regression @siteVisit @regression
Feature: Validate all scenarios in Organizational Desk Review Without Background

  @235434 @ValidateDeskReviewPOusercanbletoreassigndeskreviewownershipfromPOtootherPOuserCreatedstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review PO user can able to reassign desk review ownership from PO to other PO user in 'Created' state of desk review
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "automationpo@yopmail.com"
    Then I refresh the page
    And I pause execution for "80" seconds
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PO] to [Automation PO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "80" seconds
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
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PO1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly can see top right button "Notify" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @235438 @ValidateDeskReviewEXEusercanabletoreassigndeskreviewownershipfromEXEtootherEXEuserinNotifiedstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment @wip
  Scenario: Validate Desk Review EXE user can able to reassign desk review ownership from EXE to other EXE user in 'Notified' state of desk review
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    And I click on "Notify" in the page details
    Then I softly see status in Progress-bar is "Notified" and is "Green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly can see top right button "Conduct" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @235444 @ValidateDeskReviewFOusercanabletoreassigndeskreviewownershipfromFOtootherFOuserInProgressstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review FO user can able to reassign desk review ownership from FO to other FO user 'In Progress' state of desk review
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FO" into field "s2id_autogen1"
    And I select value "Automation FO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FO" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FO1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation FO" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236022 @ValidateDeskReviewPMusercanabletoreassigndeskreviewownershipfromPMtootherPMuserInProgressstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review PM user can able to reassign desk review ownership from PM to other PM user 'In Progress' state of desk review
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "80" seconds
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
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "80" seconds
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
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236039 @ValidateDeskreviewEXEusercanabletochangeownershipinApprovedstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk review EXE user can able to change ownership in 'Approved' state of desk review
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236049 @ValidateDeskReviewPOusercanabletochangeownershipinsenttosubrecipientstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review PO user can able to change ownership in 'sent to subrecipient' state of desk review
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PO Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236065 @ValidateDeskReviewFOusercanabletochangetheownershipSubmittoGrantorstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review FO user can able to change the ownership in 'Submit to Grantor'state of desk review
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FO Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FO" into field "s2id_autogen1"
    And I select value "Automation FO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FO" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    Then I softly can see top right button "Accept and Close" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FO1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation FO" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236076 @ValidateDeskReviewPMusercanabletoseetochangeownershipinClosedstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review PM user can able to see to change ownership in 'Closed' state of desk review
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "80" seconds
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
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "80" seconds
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
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I see status in Progress-bar is "Closed" and is "Green"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236172 @236184 @ValidateDeskReviewPOusecanabletoreassignownershipofdeskreviewfromPOtootherPOuserinSentforreviewstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review PO user can able to reassign ownership of desk review from PO to other PO user in 'Sent for review' state of desk review
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:orgDeskReviewPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Program Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---orgLevelDeskReview:-:orgDeskReviewPeerReviewTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "s2id_autogen1"
    And I select value "Automation PO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PO" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I navigate to "Related log" sub tab
    And I save the value from row "1" for column name "Title" as "Automation Desk Review Org level" from flex table "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewPeerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    #236184
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---orgLevelDeskReview:-:orgDeskReviewPeerReviewTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
#    When I close "Site Visit Reviewers" modal by clicking the top right x button
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: The Peer Review for {SavedValue:Automation Desk Review Org level} for has been completed.
      """
    Then I see the mail text is as follows :

      """
      Hello Automation PO1,

      This email is to notify you that Desk Review "{SavedValue:Automation Desk Review Org level}". and {SavedValue:DeskReviewID} has been peer reviewed.

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,
      The EGMS Team
      """

  @236174 @ValidateDeskReviewFOusercanabletoreassignownershipofdeskreviewfromFOtootheFOuserinReviewedstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review FO user can able to reassign ownership of desk review from FO to other FO user in 'Reviewed' state of desk review
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:orgDeskReviewPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Program Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---orgLevelDeskReview:-:orgDeskReviewPeerReviewTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---orgLevelDeskReview:-:orgDeskReviewPeerReviewTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
#    When I close "Site Visit Reviewers" modal by clicking the top right x button
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FO" into field "s2id_autogen1"
    And I select value "Automation FO1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FO" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "fo.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation FO] to [Automation FO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation FO] to [Automation FO1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "FO1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Submit For Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FO1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation FO" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236178 @ValidateDeskReviewEXEusercanabletodobusinessflowafterreassignownershipofdeskreviewfromEXEtootherEXEuserinINprogressstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review EXE user can able to do business flow after reassign ownership of desk review from EXE to other EXE user in 'IN progress' state of desk review
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name            | Desk Review |
      | Automation EXE1 | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"

  @236185 @ValidateDeskReviewSubmittedGrantoremailisgeneratedfornewownerofSVwhenS\RuserSubmitDRtograntorafterchangeownershipofDR @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review 'Submitted Grantor' email is generated for new owner of SV when S\R user submit DR to grantor after change ownership of DR
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "green"
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I save the value from row "1" for column name "Title" as "Automation Desk Review Org level" from flex table "---orgLevelDeskReview:-:deskreviewPanelId---"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Desk Review Report Submitted by Subrecipient
      """
    Then I see the mail text is as follows :

      """
      Hello Automation EXE1,
      The desk review report for {SavedValue:Automation Desk Review Org level} and {SavedValue:DeskReviewID} has been submitted by the Subrecipient.
      Log in to EGMS and click here to see the details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you,
      The EGMS Team
      """

  @236190 @ValidateDeskReviewReviewApproverSentBackemailshoulddisplayfornewownerifapproversendbackdeskreviewafterownershipgetchangeofDR @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review 'Review Approver Sent Back' email should display for new owner if approver send back desk review after ownership get change of DR
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "80" seconds
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
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "80" seconds
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
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Send Back" in the approval decision
    Then I softly see field "Status" as "In Progress"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Site Visit/Desk Review Report for {SavedValue:DeskReviewID}has been Sent Back
      """

    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that the Site Visit/Desk Review {SavedValue:DeskReviewID} has been sent back.

      Log in to EGMS and click here to revise the report and then resubmit for approval.

      Site Visit Details:
      Reporting Period Start Date: {Date:MM/dd/yyyy::d+10}
      Reporting Period End Date: {Date:MM/dd/yyyy::d+20}

      Reason for Visit: Routine based on monitoring responsibilities

      Attendees:
      SPI3

      Comments provided by Approving Personnel are as follows:
      Automation Testing

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @235442 @VallidateDeskReviewFDusercanabletoreassignownershipfromFDtootherFDuserinNotifiedstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment @Wip
  Scenario: Validate Desk Review FD user can able to reassign ownership from FD to other FD user in 'Notified' state of desk review
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    And I click on "Notify" in the page details
    Then I softly see status in Progress-bar is "Notified" and is "Green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FD" into field "s2id_autogen1"
    And I select value "Automation FD1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FD" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "automationfd@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation FD] to [Automation FD1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationfd1@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation FD] to [Automation FD1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "FD1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly can see top right button "Conduct" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FD1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation FD" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

 @236027 @ValidateDeskReviewFDusercanabletochangeownershipinSubmittedforApprovalstateofdeskreview @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review FD user can able to change ownership in 'Submitted for Approval' state of desk review
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:FD Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FD" into field "s2id_autogen1"
    And I select value "Automation FD1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FD" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FD1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation FD" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"

  @236192 @ValidateDeskReviewifDR1ownerFD1changehisownershiptoFD2thenFD1againcreateDR2thentheownerofSV2isFD1onlynotnewownerincreatedstateofDR @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Desk Review if DR1 owner FD1 change his ownership to FD2 and then FD1 again create DR2 then then owner of SV2 is FD1 only not new owner in created state of DR
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FD" into field "s2id_autogen1"
    And I select value "Automation FD1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FD" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReviewID}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReviewID}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "automationfd@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation FD] to [Automation FD1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationfd1@yopmail.com"
    And I pause execution for "80" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation FD] to [Automation FD1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:DeskReviewID} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "FD1" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:DeskReviewID}" in "---orgLevelDeskReview:-:deskreviewPanelId---" panel
    And I click on "View" icon for "{SavedValue:DeskReviewID}" inside flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    Then I softly can see top right button "Notify" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---deskreview:-:approverDeskReviewTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---orgLevelDeskReview:-:orgDeskReviewNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FD1" for title "New Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    Then I softly see value "Automation FD" for title "Old Value" inside table "---deskreview:-:deskReviewHistoryTableId---"
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "green"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---deskreview:-:deskReviewOwnerTableId---"