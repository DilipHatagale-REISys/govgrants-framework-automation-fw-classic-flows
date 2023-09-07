@organizationalSiteVisitWB @grantor-regression @grantor-parallel-regression @siteVisit @regression
Feature: Validate all scenarios in Organizational Site Visit Without Background

  @235375 @ValidateSiteVisitEXEusercanabletoreassignsitevisitownershipfromEXEtootherEXEuserinNotifiedstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit EXE user can able to reassign site visit ownership from EXE to other EXE user in 'Notified' state of site visit
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly can see top right button "Conduct" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @235408 @ValidateSiteVisitFOusercanablereassignownershipofsitevisitfromFOtootherFOuserinInProgressstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit FO user can able to reassign ownership of site visit from FO to other FO user in 'In Progress' state of site visit
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "fo.automation@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---sitevisits:-:siteVisitAddFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FO1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation FO" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @235413 @ValidateSiteVisitPMusercanabletoreassignsitevisitownershipfromPMtootherPMuserinApprovedstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit PM user can able to reassign site visit ownership from PM to other PM user in 'Approved' state of site visit
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @235414 @ValidateSiteVisitPMusercanabletoreassignsitevisitownershipfromPMtootherPMuserinCreatedstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit PM user can able to reassign site visit ownership from PM to other PM user in 'Created' state of site visit
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Then I softly see status in Progress-bar is "Created" and is "Green"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly can see top right button "Notify" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---sitevisits:-:siteVisitAddFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @235427 @ValidateSiteVisitPOusercanabletoreassignownershipofsitevisitfromPOtootherPOuserinSendtosubrecipientstateofsitevisit
  Scenario: Validate Site Visit PO user can able to reassign ownership of site visit from PO to other PO user in 'Send to subrecipient' state of site visit
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PO Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PO1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @235432 @ValidateSiteVisitPMusercanabletoreassignownershipofsitevisitfromPMtootherPMinClosedstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit PM user can able to reassign ownership of site visit from PM to other PM in 'Closed' state of site visit
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I see status in Progress-bar is "Closed" and is "Green"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @235433 @ValidateSiteVisitFOusercanabletoreassignownershipofsitevisitfromFOtootherFOinClosedstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit FO user can able to reassign ownership of site visit from FO to other FO in 'Closed' state of site visit
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "fo.automation@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I see status in Progress-bar is "Closed" and is "Green"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FO1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation FO" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @236108 @ValidateSiteVisitFOusercanabletoreassignownershipofsitevisitfromFOtootherFOuserinSentforreviewstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit FO user can able to reassign ownership of site visit from FO to other FO user in 'Sent for review' state of site visit
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    Then I softly see field "Status" as "Submitted for Review"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "fo.automation@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FO1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---sitevisits:-:siteVisitAddFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FO1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation FO" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @236111 @ValidateSiteVisitEXEusercanabletodobusinessflowafterreassignownershiofsitevisitfromEXEtootherEXEuserinINprogressstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit EXE user can able to do business flow after reassign ownership of site visit from EXE to other EXE user in 'IN progress' state of site visit
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name            | Site Visit |
      | Automation EXE1 | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept And Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"

  @236135 @ValidateSiteVisitReviewOwnerNotifyPeerReviewCompletionemailshoulddisplayfornewownerifreviewersubmitreviewofsitevisitafterownershipgetchange @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit 'Review Owner Notify Peer Review Completion' email should display for new owner if reviewer submit review of site visit after ownership get change
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I save the value from row "1" for column name "Title" as "Automation Site Visit Org level" from flex table "---orgLevelSiteVisits:-:siteVisitsPanelId---"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
#    When I close "Site Visit Reviewers" modal by clicking the top right x button
    Then I softly see value "Submitted" for title "Status" inside table "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Complete Review" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Reviewed"
    And I checkout to yopmail with mailid "automationpo1@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: The Peer Review for {SavedValue:Automation Site Visit Org level} for has been completed.
      """
    Then I see the mail text is as follows :

      """
      Hello Automation PO1,

      This email is to notify you that Site Visit "{SavedValue:Automation Site Visit Org level}". and {SavedValue:SitevVisitId} has been peer reviewed.

      Log in to EGMS and click here for more details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,
      The EGMS Team
      """

  @236145 @ValidateSiteVisitSubmittedGrantoremailisgeneratedfornewownerofSVwhenS\RusersubmitSVtograntorafterchangeownershipofSV @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit 'Submitted Grantor' email is generated for new owner of SV when S\R user submit SV to grantor after change ownership of SV
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I save the value from row "1" for column name "Title" as "Automation Site Visit Org level" from flex table "---orgLevelSiteVisits:-:siteVisitsPanelId---"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Site Visit Report Submitted by Subrecipient
      """
    Then I see the mail text is as follows :

      """
      Hello Automation EXE1,
      The site visit report for {SavedValue:Automation Site Visit Org level} and {SavedValue:SitevVisitId} has been submitted by the Subrecipient.
      Log in to EGMS and click here to see the details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you,
      The EGMS Team
      """

  @236152 @ValidateSiteVisitifSV1ownerFD1changehisownershiptoFD2andthenFD1againcreateSV2thenthenownerofSV2isFD1onlynotnewownerincreatedstateofSV @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit if SV1 owner FD1 change his ownership to FD2 and then FD1 again create SV2 then then owner of SV2 is FD1 only not new owner in created state of SV
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Then I softly see status in Progress-bar is "Created" and is "Green"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "automationfd@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationfd1@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"

  @235370 @ValidateSiteVisitPOusercanabletoreassignsitevisitownershipfromPOtootherPOinCreatedstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit PO user can able to reassign site visit ownership from PO to other PO in 'Created' state of site visit
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Then I softly see status in Progress-bar is "Created" and is "Green"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly can see top right button "Notify" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation PO1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---sitevisits:-:siteVisitAddFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PO1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation PO" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @236149 @ValidateSiteVisitReviewApproverSenBackemailshoulddisplayfornewownerifapproversendbacksitevisitafterownershipgetchangeofSV @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit 'Review Approver Sent Back' email should display for new owner if approver send back site visit after ownership get change of SV
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Send Back" in the approval decision
    Then I softly see field "Status" as "In Progress"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Site Visit/Desk Review Report for {SavedValue:SitevVisitId} has beenSent Back
      """

    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that the {SavedValue:SitevVisitId} has been sent back.

      Log in to EGMS and click here to revise the report and then resubmit for approval.

      Site Visit Details:
      Reporting Period Start Date: {Date:MM/dd/yyyy::d+10}
      Reporting Period End Date: {Date:MM/dd/yyyy::d+20}

      Location Details:
      Location: asf asf Arlington WI
      City: asf
      State: WI
      Reason for Visit: Routine based on monitoring responsibilities

      Attendees:
      SPI3

      Comments provided by Approving Personnel are as follows:
      Automation Testing

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrants@support.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @235409 @ValidateSiteVisitFDusercanabletoreassignsitevisitownershipfromFDtootherFDuserinSubmitforApprovalstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit FD user can able to reassign site visit ownership from FD to other FD user in 'Submit for Approval' state of site visit
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "automationfd@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationfd1@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FD1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation FD" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @235428 @ValidateSiteVisitFDusercanabletoreassignsitevisitownershipfromFDtootherFDuserinSubmittoGrantorstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit FD user can able to reassign site visit ownership from FD to other FD user in 'Submit to Grantor' state of site visit
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FD Username} | Step 1     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:orgCorrectiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I save the value from row "1" for column name "Title" as "Automation Site Visit Org level" from flex table "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
#    And I collapse nested table containing column value "Automation Finding"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FD" into field "s2id_autogen1"
    And I select value "Automation FD1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation FD1" without tableid
    And I pause execution for "3" seconds
    Then I see the text containing "Site Visit/Desk Review"
    And I Click on "Reassign Records" icon for "Site Visit/Desk Review" without tableid
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    And I close the tab
    And I logout
    And I checkout to yopmail with mailid "automationfd@yopmail.com"
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "automationfd1@yopmail.com"
    And I pause execution for "10" seconds
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
      {SavedValue:SitevVisitId} Automation ADMIN Site Visit /Desk Review

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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly can see top right button "Accept and Close" in page detail
    Then I softly can see top right button "Send Back to Subrecipient" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FD1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation FD" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"

  @236110 @ValidateSiteVisitFDusercanabletoreassignownershipofsitevisitfromFDtootherFDuserinReviewedstateofsitevisit @sprint-14-US-234219 @vaibhav @reassignment
  Scenario: Validate Site Visit FD user can able to reassign ownership of site visit from FD to other FD user in 'Reviewed' state of site visit
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    And I navigate to "Related log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "green"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
#    When I close "Site Visit Reviewers" modal by clicking the top right x button
    Then I softly see value "Submitted" for title "Status" inside table "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
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
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Submit For Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---sitevisits:-:siteVisitAddFilesTableId---"
    Then I can see top right button "Add" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation FD1" for title "New Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"
    Then I softly see value "Automation FD" for title "Old Value" inside table "---sitevisits:-:siteVisitHistoryTableId---"