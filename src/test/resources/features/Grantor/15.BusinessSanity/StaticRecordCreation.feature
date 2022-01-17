@staticRecordCreation
Feature: Validate all scenarios for static data creation

  @creationAndActivationOfFocusArea @smoke
  Scenario: Creation and Activation of Focus Area
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see status in Progress-bar is "Created" and is "Green"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @creationAndActivationOfFundingSource
  Scenario: Creation and activation of Funding Source
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    And I save the field labeled "Title" as "FundingSourceTitle"
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "fieldStartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "fieldEndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @creationAndActivateFundingAccount
  Scenario: Activation of Funding Source
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

  @creationAndActivationOfkpi
  Scenario Outline: Creation And activation of kpi
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---keyperformanceindicator:-:GrantorKPIFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"
    Examples:
      | User  |
      | ADMIN |

  @creationAndActivationOfProgram
  Scenario Outline: Creation and activation of program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "green"

    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @creationOfStrategicPlanAndGoalsAndObjective
  Scenario: Creation of Strategic plan and goals and objective
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Strategic ID"
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "Strategic Goals ID"
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Execution Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see field "Strategic Plan Status" as "Draft"