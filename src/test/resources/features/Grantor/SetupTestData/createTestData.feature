@createTestData
Feature: Validate creation of data in new Org

  @automationPermanentFocusArea
  Scenario: Validate the creation and Activation of Permanent Focus Area
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Permanent Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @automationPermanentFocusArea2
  Scenario: Validate the creation and Activation of Permanent Focus Area 2
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Permanent Focus Area2" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @automationPermanentFundingAccount
  Scenario: Validate the creation and Activation of Permanent Funding Account
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter "CreationFundingSource" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter "Funding Account Creation" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @automationPermanentKPIForRegression
  Scenario: Validate the creation and Activation of Permanent KPI
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "CreationKPI" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @automationPermanentKPIForRegression2
  Scenario: Validate the creation and Activation of Permanent KPI 2
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "CreationKPI1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @automationPermanentStrategicPlan
  Scenario: Validate the creation and Activation of Permanent Strategic Plan Activation
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter "StrategicPlanCreation" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Permanent Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter value "Automation Permanent Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Close"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I enter in modal value "Automation Permanent Objective" into field "StrategyDescription__c"
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - All"
    When I click on "View" icon for "Automation Permanent Strategic Plan" inside flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter value "Automation Permanent Strategic Goal2" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Close"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter value "Automation Permanent Objetives 2" into field "StrategyTitle__c"
    When I click modal button "Save and Close"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I enter in modal value "Automation Permanent Objetives 2" into field "StrategyDescription__c"
    When I navigate to "Related Logs" sub tab
    And I click on top right button "Associate" in flex table with id "---strategicplan:-:ObjectivesKPITableId---"
    When I perform quick search for "Automation Permanent KPI" in "---strategicplan:-:ListOfActiveKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---strategicplan:-:ListOfActiveKPITableId---"
    Then I see that "Automation Permanent KPI" has been added in flextable with Id "---strategicplan:-:ObjectivesKPITableId---"

  @automationPermanentInternalProgram
  Scenario: Validate the activation of Internal Program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "CreationProgram" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "EditionProgram" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I close "Associate Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    And I navigate to "Files" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @competitiveAnnouncementActivationAnnouncementforFDM
  Scenario: Validate the activation of permanent record of Competitive Announcement for FDM
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "EditionAnn" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @automationAnnouncementforApplicationReview
  Scenario: Validate the activation of permanent record of Competitive Announcement for Application Review 
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "EditionAnn1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @automationAnnouncementforApplicationIntake
  Scenario: Validate the activation of permanent record of Competitive Announcement for Application Intake 
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement2" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal2" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "EditionAnn2" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @automationAnnouncementforPre-Application
  Scenario: Validate the activation of permanent record of Competitive Automation Announcement for Pre-Application   
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement3" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    And I enter "EditionAnn3" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Add" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 20000           |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    When I navigate to "Overview" sub tab
    When I pause execution for "1" seconds
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Add" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @applicationSubmissionForAnnouncementApplicationIntake
  Scenario: Validate the creation of Application
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Intake" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Intake" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    When I enter value "Automation Announcement for Site Visit" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I see status in Progress-bar is "Submitted" and is "Green"

  @applicationSubmissionAutomationAnnouncementforApplicationReview
  Scenario: Validate the submission of application of Announcement for Application Review record
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Review" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Review" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    When I enter value "Automation Application" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "AppEdition" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI  | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I see status in Progress-bar is "Submitted" and is "Green"

  @applicationSubmissionAutomationAnnouncementforFDM
  Scenario Outline: Validate the submission of application and complete review process for an application
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for FDM" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    When I enter value "Automation Announcement for FDM" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "AppEdition" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI  | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    Given I am on "Internal" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    Examples:
      | Announcement Name               | Application Name                |
      | Automation Announcement for FDM | Automation Announcement for FDM |

  @automationGrant/AwardforRiskAssessment
  Scenario Outline: Validate Creation and Activation of Automation Grant/Award for Risk Assessment Award
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account1" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I refresh the page
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI  | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                                 | Grant Name                                 |
      | Automation Grant/Award for Risk Assessment | Automation Grant/Award for Risk Assessment |

  @automationAwardforAmendmentRequest
  Scenario Outline: Validate Creation and Activation of Automation Award for Amendment Request
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone1" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I refresh the page
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI  | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                             | Grant Name                             |
      | Automation Award for Amendment Request | Automation Award for Amendment Request |

  @automationPermanentAward 
  Scenario Outline: Validate the creation and Activation of Automation Permanent Award 
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation2" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition2" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I refresh the page
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 1000           | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "PermanentRecordSetup_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit Progress Report Schedule" modal by clicking the top right x button
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "PermanentRecordSetup_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:PM Username} | Step 1          |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 2          |
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                  | Grant Name                  |
      | Automation Permanent Award  | Automation Permanent Award  |

  @competitiveAnnouncementCreatedPastDate
  Scenario: Validate the create of permanent record of Competitive Announcement with past application date
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitivePastAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "1" into field "fieldApplicationDueDate__c"
    And I click on "Save" in the page details