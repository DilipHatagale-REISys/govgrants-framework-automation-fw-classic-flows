@program @grantor-regression @grantor-parallel-regression @planning
Feature: Validate all scenarios for program

  @109448 @VerifySelectionOfChildOrganization @monu
  Scenario: Verifying if the user is able to change or add child organization to created program
    Given I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccount__c"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Internal Program}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I enter value "Children’s Health Insurance Program" into field "fieldAccount__c"
    And I click on "Save" in the page details
    Then I softly see field "Internal Organization" as "Children’s Health Insurance Program"

  @105386 @VerifyCreationOfStrategicPlanWithFOProfile @monu
  Scenario: Verifying FO user is not able to create Strategic plan
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"

  @111272 @111182 @111191 @VerifyActivationOfNGOProgram @monu
  Scenario Outline: Verifying record owner is able to activate NGO program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Add" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:PM Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:EXE Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    #111182 #monu
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    #111191 #monu
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "green"

    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime Internal Program} |

  @110502 @110501 @VerifyEditOfCreatedNGOProgram @monu
  Scenario Outline: Verifying record owner is able to activate NGO program
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    #110504 #monu
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    #110501 #monu
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    Then I softly can see row level action button "View" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"

    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime Internal Program} |

  @110352 @VerifyAccessOfNGOProgramCreationForFOUser @monu
  Scenario: Verifying FO user do not have access to create NGO program
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"

  @111167 @VerifyDeletionOfAssociatedContactAtNGOProgram @monu @wip
  Scenario: Verifying user is able to delete associated contacts from NGO program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Add" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    And I click on "Remove" icon for "NGO Contact" inside flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    Then I softly see "Record deleted successfully." inside flex table with id "---program:-:ExternalNGOProgramContactTableId---"

  @111264 @111183 @VerifyTaskCreationForNGOProgramActivation @monu
  Scenario: Verifying record owner should receive generated task inside pending for Program activation after approval of program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Add" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Responsibilities" sub tab
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:PM Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:EXE Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    #111183 #monu
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @111226 @VerifyProgramNotEditableAfterSubmission @monu
  Scenario Outline: Verifying NGO Program record is not editable once program is submitted for approval
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Add" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I navigate to "Responsibilities" sub tab
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:PM Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:EXE Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime Internal Program} |

  @111416 @VerifyRejectionOfNGOProgram @monu
  Scenario: Verifying Executive approver is able to reject NGO Program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Add" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I navigate to "Responsibilities" sub tab
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:PM Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:EXE Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Disapprove" in the approval decision
    Then I can see the message "Successfully disapproved" in the approval decision
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @111514 @VerifyForwardOfNGOProgram @monu
  Scenario: Verifying user is able to forward NGO Program to another user during Approval process
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Add" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I navigate to "Responsibilities" sub tab
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:PM Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:EXE Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |

  @111515 @VerifySendBackFunctionalityForNGOProgram @monu
  Scenario: Verifying user is able to send back NGO Program to owner
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Add" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I navigate to "Responsibilities" sub tab
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:PM Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    When I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    When I enter value "{SavedValue:EXE Username}" into field "Name__c"
    When I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    And I softly see the following messages in the page details contains:
      | Successfully sent to Owner. It may take few minutes to process record. |