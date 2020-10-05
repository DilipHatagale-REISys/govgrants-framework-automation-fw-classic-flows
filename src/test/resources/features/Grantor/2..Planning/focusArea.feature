@focusArea @grantor-regression @grantor-parallel-regression @planning
Feature: Validate all scenarios in Focus Area

  @34512 @creationOfFocusArea @smoke
  Scenario: Creation of Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    Then I see status in Progress-bar is "Created" and is "Green"

  @50963 @editionOfFocusArea
  Scenario: Edition of Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @50961 @addAttachmentToFocusArea
  Scenario Outline: Addition of Attachment to Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    And I click on top right button "Add Files" in flex table with id "---focusarea:-:FocusAreaFilesTableId---"
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    Then I see "Other" has been added in "Attachment" flex table
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @34729 @activateFocusArea @smoke
  Scenario: Activate Focus Area by User - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @52455 @creationOFFocusAreaFOUser
  Scenario: Negative Scenario-Verify that FO is not able to create focus area
    Given I login to "As a Grantor" app as "FO" user
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"

  @53219 @userFOEditfocusArea
  Scenario: Negative Case-Verfiy that FO user cannot Edit  the record
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Area - Draft" in "---focusarea:-:focusAreaTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "---focusarea:-:focusAreaTableId---"

  @52620 @userFODeletefocusArea @aa
  Scenario: Negative Case-Verfiy that FO user cannot Delete the record
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Area - Draft" in "---focusarea:-:focusAreaTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime Focus Area}" in flex table with id "---focusarea:-:focusAreaTableId---"

  @53220 @deactivatingfocusArea
  Scenario: Verfiy deactivating focus area by user - Admin/EXE/PM
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Closed" and is "Green"

  @53221 @foUserdeactivatingfocusArea
  Scenario: Negative Case- Verfiy that other users (other than Admin, EXE, PM) can not deactivate focus area
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Area - Active" in "---focusarea:-:focusAreaTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I cannot see top right button "Deactivate" in page detail

  @52476 @closedfocusAreaListView
  Scenario: Verfiy that user can see Closed Focus Area under Inactive Focus Area list view (Admin/EXE/PM)
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    When I navigate to "Planning" tab
    And I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Area - Inactive" in "---focusarea:-:focusAreaTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    Then I see status in Progress-bar is "Closed" and is "Green"
