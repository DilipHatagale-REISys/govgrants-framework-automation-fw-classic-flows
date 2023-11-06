@program @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios for program with add file

  @222077 @VerifyPMusershouldabletoaddfilewhenInternalProgramisinCreatedStatusprovidedifuserhavingthemaineditaccess @sprint-10-US-199430 @Notes
  Scenario: Verify PM user should able to add file when Internal Program is in Created Status provided if user having the main edit access
    When I login to "As a Grantor" app as "PM" user
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
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table

  @222078 @VerifyadmnusershouldnotabletoaddfileifuserdonothavetheeditaccesstoInternalPrograminsubmitforapprovalstatus @sprint-10-US-199430 @Notes
  Scenario: Verify admn user should not able to add file if user do not have the edit access to Internal Program in submit for approval status
    When I login to "As a Grantor" app as "ADMIN" user
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
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I cannot see top right button "Undo" in page detail
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                        | Program |
      | {SavedValue:ADMIN Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
