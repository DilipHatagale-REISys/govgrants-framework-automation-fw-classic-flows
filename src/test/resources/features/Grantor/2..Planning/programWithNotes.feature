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
    And I click on "Edit" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
