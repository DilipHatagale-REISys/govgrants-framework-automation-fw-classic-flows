@program @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios for program

  @109448 @VerifySelectionOfChildOrganization @monu
  Scenario: Verifying if the user is able to change or add child organization to created program
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Internal Program}"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I enter value "Test Automation Organization" into field "fieldAccount__c"
    And I click on "Save" in the page details
    Then I softly see field "Internal Organization" as "Test Automation Organization"

  @105386 @VerifyCreationOfStrategicPlanWithFOProfile @monu
  Scenario: Verifying FO user is not able to create Strategic plan
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"

  @111272 @111182 @111191 @VerifyActivationOfNGOProgram @monu @buglogged138933
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I pause execution for "5" seconds
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
    And I click toggle button to select "All NGO Programs"
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
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    #110504 #monu
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    #110501 #monu
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
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

  @111167 @VerifyDeletionOfAssociatedContactAtNGOProgram @monu @wip @buglogged138933
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    And I click on "Remove" icon for "NGO Contact" inside flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    Then I softly see "Record deleted successfully." inside flex table with id "---program:-:ExternalNGOProgramContactTableId---"

  @111264 @111183 @VerifyTaskCreationForNGOProgramActivation @monu @buglogged138933
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
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
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @111226 @VerifyProgramNotEditableAfterSubmission @monu @buglogged138933
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime Internal Program} |

  @111416 @VerifyRejectionOfNGOProgram @monu @buglogged138933
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |

  @111515 @VerifySendBackFunctionalityForNGOProgram @monu @buglogged138933
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I click on "Submit For Approval" in the page details
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
#    And I softly see the following messages in the page details contains:
#      | Successfully sent to Owner. It may take few minutes to process record. |

  @140943 @Verify1StepApprovalAtNGOProgram-RnRFunctionality @monu
  Scenario: Validate user can add step1 as an approver for created NGO Program
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    Then I softly see "Saved Successfully!" inside flex table with id "---program:-:extapproverTableId---"

  @140941 @Verify2StepApprovalForNGOProgram-RnRFunctionality @monu
  Scenario: Validate user can two step approval for NGO program and complete the approval
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @140332 @VerifyErrorMessageAtApproverSectionWhileSkippingAtNGOProgram-RnRFunctionality @monu @bugonAutoorg @needtoCheckafterorgrefresh
  Scenario: Validate user cannot skip approver step on NGO program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |

  @141801 @VerifyErrorMessageWhileSkippingStepsForNGOProgram-RnRFunctionality @monu
  Scenario: Verify the validation message is displayed when user skip the approval steps on NGO program
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 4  |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - You cannot skip an Approval Step. |

  @169882 @169884 @169886 @169897 @169896 @169898 @ValidateusershouldabletoseenewGrantorPreapplicationformunderthesetuptabinInternalPrograms @sprint-7 @vaibhav
  Scenario Outline: Validate user should able to see new Grantor Pre application form under the setup tab in Internal Programs
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation2" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:ProgramEGMSID}"
    And I click on "Edit" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    When I perform quick search for "Grantor Pre-application Form" in "---program:-:businessFormTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---program:-:businessFormTableId---"
     #169884
    Then I softly can see row level action button "Preview" against "Grantor Pre-application Form" in flex table with id "---program:-:businessFormTableId---"
     #169886
    And I click on "Preview" icon for "Grantor Pre-application Form" inside flex table with id "---program:-:businessFormTableId---" without waiting for record
    Then I softly see "Preview Package" opens in overLay window
     #169897
    Then I softly can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---program:-:previewPackageTableId---"
     #169896
    And I pause execution for "10" seconds
    When I hovering mouse on page block help text icon inside table "---program:-:previewPackageTableId---" with tooltip id "PreviewPackageFormstooltip"
    Then I softly see "<new_helpText>" shown as help text
     #169898
    And I click on "Preview" icon for "Standard Pre-Application form" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    Then I see new tab is opened
    Examples:
      | User | new_helpText                                                 |
      | PM   | Section Displays List of Forms Associated with this Package. |
      | EXE  | Section Displays List of Forms Associated with this Package. |

  @174411 @ValidateusershouldabletoseeGrantorPreApplicationforminPackages @sprint-7 @vaibhav
  Scenario: Validate user should able to see Grantor Pre Application form in Packages
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Pre-Application" in "---program:-:packagesTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---program:-:packagesTableId---"
    And I expand nested table containing column value "Grantor Pre-application Form"
    Then I softly see value "Standard Pre-Application form" for title "Display Name" inside table "---program:-:packagesTableId---"

  @197300 @ValidatePMuserisabletotransferhisowntaskofthetasktypeActivatetheProgramstatusasInprogresstoanotherPMuserforinternalprogram @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate PM user is able to transfer his own task of the task type Activate the Program status as In progress to another PM user for internal program
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "In Progress" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I save the value from row "1" for column name "Created By" as "created" from flex table "---program:-:programsTableId---"
    Then I softly see value "{SavedValue:created}" for title "Created By" inside table "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName1" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName1}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I cannot see top right button "Activate" in page detail

  @197309 @ValidateEXEuserisabletotransferhisowntaskofthetasktypeActivateNGOProgramstatusaInprogresstoanotherEXEuserforexternalprogram @sprint-4 @vaibhav @reassignment @taskreassign
  Scenario: Validate EXE user is able to transfer his own task of the task type Activate NGO Program status as In progress to another EXE user for external program
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "In Progress" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I save the value from row "1" for column name "Created By" as "created" from flex table "---program:-:ExternalNGOProgramTableId---"
    Then I softly see value "{SavedValue:created}" for title "Created By" inside table "---program:-:ExternalNGOProgramTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName1" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName1}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I cannot see top right button "Activate" in page detail

  @197312 @ValidatereassignedtaskownerPMuserisabletoactivatetheinternalprogramifanothePMtransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskasNotstarted @sprint-4 @vaibhav @reassignment
  Scenario: Validate reassigned task owner PM user is able to activate the internal program if another PM transfers task of the task type Activate the Program when status of task as Not started
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly can see row level action button "Start" against "Record Id" in flex table with id "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly see fields "s2id_autogen1" is in edit mode
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I can see top right button "Amend Program" in page detail

  @199391 @ValidatereassignedtaskownerEXEuserisabletoactivattheinternalprogramifadmintransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskisInProgress @sprint-4 @vaibhav @reassignment
  Scenario: Validate  reassigned task owner EXE user is able to activate the internal program if admin transfers task of the task type Activate the Program when status of task is In Progress
    When I login to "As a Grantor" app as "EXE1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE1" into field "s2id_autogen1"
    And I select value "Automation EXE" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "In Progress" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName1" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName1}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I can see top right button "Amend Program" in page detail

  @195200 @195206 @195208 @195211 @ValidateAdminusershouldabletoseethenewoptionofownershipunderreassignsectiononleftnavigationbarofAsaGrantorApp @sprint-4 @vaibhav @reassignment
  Scenario: Validate Admin user should able to see the new option of ownership under reassign section on left navigation bar of As a Grantor App
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
     #195206
    Then I see "Reassign" inside "Tasks" is displayed
     #195208
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    Then I softly see fields "s2id_autogen1" is in edit mode
    Then I softly see fields "s2id_autogen3" is in edit mode
     #195211
    And I enter value "Automation FO" into field "s2id_autogen1"
    And I pause execution for "4" seconds
    Then I softly see "Automation FO" inside auto search result
    Then I softly see "Automation FO1" inside auto search result
    And I enter value "Automation FO" into field "s2id_autogen3"
    And I pause execution for "4" seconds
    Then I softly see "Automation FO" inside auto search result
    Then I softly see "Automation FO1" inside auto search result
    And I refresh the page
    And I enter value "Undertaker FO" into field "s2id_autogen3"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result

  @195212 @Validateusershouldabletoreassigntheownershiptaskbetweensameprofileandthesameorganization @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate user should able to re-assign the ownership task between same profile and the same organization
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I save the value from row "1" for column name "OwnerI" as "OwnerName1" from flex table "---program:-:adminTargetOwnerReplaceTableId---"
    Then I see value "{SavedValue:OwnerName1}" for title "OwnerI" inside table "---program:-:adminTargetOwnerReplaceTableId---"

  @195222 @ValidateuserselectsourceuserasPMuser&targetuserasEXEuserthenusershouldgetanerrorafterclickingontheStarticon @sprint-4 @vaibhav @reassignment
  Scenario: Validate user select source user  as PM user & target user as EXE user then user should get an error after clicking on the Start icon
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation EXE" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    Then I softly see the following messages in the page details contains:
      | Ownership cannot be transferred across profiles and organizations. |

  @195223 @ValidateuserselectsourceuserasPMuser&targetuserasFDuserthenusershouldgeterrormessageafterclickingontheplayicon @sprint-4 @vaibhav @reassignment
  Scenario: Validate user select source user  as PM user & target user as FD user then user should get error message after clicking on the play icon
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Pratiksha PM" into field "s2id_autogen1"
    And I select value "Automation FD" into field "s2id_autogen3"
    And I Click on "Start" icon for "Pratiksha PM" without tableid
    Then I softly see the following messages in the page details contains:
      | Ownership cannot be transferred across profiles and organizations. |

  @195227 @ValidateusershouldgettheerrorwhenSourceUserandTargetUsercannotbesame @sprint-4 @vaibhav @reassignment
  Scenario: Validate user should get the error when Source User and Target User cannot be same
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    Then I softly see the following messages in the page details contains:
      | Select different Source and Target Users |

  @195228 @195232 @Validateusershouldabletoclickonplaybuttonafterselectingthesource&targetuserwiththesameprofilePM @sprint-4 @vaibhav @reassignment
  Scenario: Validate user should able to click on play button after selecting the source & target user with the same profile PM
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
   #195232
    Then I see the text containing "Program"
    Then I softly see the image "Reassign Records" in page detail

  @195234 @Validateusershouldnavigatedtothesepagewhereusershouldabletoseelistofalltheprogramsafterclickonreassignbutton/icon @sprint-4 @vaibhav @reassignment
  Scenario: Validate user should navigated to these page where user should able to see list of all the programs after click on reassign button/icon
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    Then I softly see "Programs Available for Reassignment " page block displayed

  @195251 @195254 @ValidateProgramSourceusershouldshowalltheprogramsInternalProgramNGOexternalprogramsofthesourceuser @sprint-4 @vaibhav @reassignment
  Scenario: Validate Program -Source user should show all the programs(Internal Program/NGO external programs of the source user
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
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "Program ID" inside table "---program:-:adminOwnerReplaceTableId---"
    #195254
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID1}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"

  @195259 @ValidateUserisenforcedtoselectonrecordbyusingcheckboxpostclickonthetransferownershipbutton  @sprint-4 @vaibhav @reassignment
  Scenario: Validate User is enforced to select on record by using check box post click on the transfer ownership button
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
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see the following messages in the page details contains:
      | Please select atleast one record |

  @195268 @Validatetherecordistransferredthenusershouldabletoseethesamerecordinthetargetuserstable @sprint-4 @vaibhav @reassignment
  Scenario: Validate the record is transferred then user should able to see the same record in the target user's table
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"

  @195273 @195278 @195277 @Validateuserclickontransferbuttonusershouldgetfollowingwarningmessage @sprint-4 @vaibhav @reassignment
  Scenario: Validate user click on transfer button user should  get following warning message
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    #195278
    And I click "No" on modal confirmation box
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminOwnerReplaceTableId---"
    #195277
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click "Yes" on modal confirmation box
    Then I softly see the following messages in the page details contains:
      | Transfer is in progress, kindly wait for email confirmation. |

  @195317 @195347 @ValidateownershipistransferredforaProgramincreatedstateValidateallthevisibilityofallthebuttonsoftheprogramisavailabletothenewowner @sprint-4 @vaibhav @reassignment
  Scenario: Validate ownership is transferred for a Program in created state Validate all the visibility of all the buttons of the program is available to the new owner
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then  I can see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    Then  I can see top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    Then  I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:approverTableId---"
    When I navigate to "Files" sub tab
    Then  I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then  I can see top right button "Add" in flex table with id "---program:-:internalProgramNotesTableId---"
    #195347
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM" for title "New Value" inside table "---program:-:historyTableId---"
    Then I softly see value "Automation PM1" for title "Old Value" inside table "---program:-:historyTableId---"

  @195340 @Validatenameoftheownershouldgetupdatedinresponsibilitytab @sprint-1 @vaibhav @reassignment
  Scenario: Validate name of the owner should  get updated in responsibility tab
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"

  @196652 @ValidateownershipistransferredforaProgramSubmittedforapprovalValidateapprovercanapprovetheprogram&newprogramownergetstheActivaterelatedtaskandhasbuttonsonUI @sprint-4 @vaibhav @reassignment
  Scenario: Validate ownership is transferred for a Program Submitted for approval Validate approver can approve the program  & new program owner gets the Activate related task and has buttons on UI
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 2  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Approved"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "green"
    Then I can see top right button "Amend Program" in page detail
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:completedTaskTableId---"

  @196688 @ValidateownershipistransferredforaPrograminSubmittedforReviewstateValidateallthevisibilityofallthebuttonsoftheprogramisavailabletothenewowner @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate ownership is transferred for a Program in Submitted for Review state Validate all the visibility of all the buttons of the program is available to the new owner
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---program:-:peerReviewTableId---"
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly can see top right button "Complete Review" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Submit for Approval" in page detail

  @196706 @Validatepeerreviewtasksnotstartedremainwithassignedreviewer&arenotautomaticallyassignedtonewownerofprogramwhenownershipofsuchinternalsprogramistransferred @sprint-4 @vaibhav @reassignment
  Scenario: Validate peer review tasks (not started) remain with assigned reviewer & are not automatically assigned to new owner of program when ownership of such internals program is transferred
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I see value "Review Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @196764 @ValidatethevisibilityofallthebuttonsoftheprogramisnotavailablefortheinitialownerwhenownershipistransferredtonewuserforaPrograminSubmittedforReviewstate @sprint-4 @vaibhav @reassignment
  Scenario: Validate the visibility of all the buttons of the program is not available for the initial owner when ownership is transferred to a new user for a Program in Submitted for Review state
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly cannot see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then  I cannot see top right button "New" in flex table with id "---program:-:peerReviewTableId---"

  @196693 @Validatetasksareremovedforoldowner&newprogramownergetstheActivaterelatedtaskandhasbuttonsonUIwhenownershipistransferredforaProgramofapprovedstatus @sprint-4 @vaibhav @reassignment
  Scenario: Validate tasks are removed for old owner & new program owner gets the Activate related task and has buttons on UI when ownership is transferred for a Program of approved status
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Approved"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:completedTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail

  @196699 @Validateapprovercanapprovetheexternalprogram&newownergetstheActivaterelatedtasksandhasbuttonsonUIwhenownershipistransferredforaExternalProgramSubmittedforapproval  @sprint-4 @vaibhav @reassignment
  Scenario: Validate  approver can approve the external program & new owner gets the Activate related tasks and has buttons on UI when ownership is transferred for a External Program Submitted for approval
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 2  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Approved"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "green"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:completedTaskTableId---"

  @197125 @Validateownershiptasksareroutedtoappropriateuserwhentransferofownershipisdonesimultaneouslyfor4internalprogramsindifferentstateshasrelatedtasksonthem @sprint-4 @vaibhav @reassignment
  Scenario: Validate ownership & tasks are routed to appropriate user when transfer of ownership is done simultaneously for 4 internal programs in different states & has related tasks on them
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID3"
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID4"
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID4}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID1}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID2}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID2}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID3}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID3}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID4}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID4}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID2}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID3}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID3}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID4}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID4}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID2}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Approve Program {SavedValue:ProgramEGMSID2}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Review Program {SavedValue:ProgramEGMSID1}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @197246 @Validateuserselectprogramthenreassignmenthistoryshouldtrackedinthefieldhistorytableinhistorytabforexternalprogram @sprint-4 @vaibhav @reassignment
  Scenario: Validate user select program then reassignment history should tracked in the field history table in history tab for external program
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM" for title "New Value" inside table "---program:-:historyTableId---"
    Then I softly see value "Automation PM1" for title "Old Value" inside table "---program:-:historyTableId---"

  @198789 @ValidateapprovaltaskassignedtoinitialownerofprogramEXEisnottransferredtonewownerwhenaexternalprograminsubmitforapprovalstatusistransferredtonewownerEXE&emailissenttocorrectowneruponrejecting @sprint-4 @vaibhav @reassignment
  Scenario: Validate approval task assigned to initial owner of program <EXE> is not transferred to new owner when a external program in submit for approval status is transferred to new owner (EXE) & email is sent to correct owner upon rejecting
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    Then I softly see value "Automation EXE1" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Program #{SavedValue:ProgramEGMSID} has been Rejected
      """
    Then I see the mail text is as follows :
      """
       Hello,
       This email is to notify you that Program #{SavedValue:ProgramEGMSID} has been rejected.
       Log in to EGMS and click here to see details.
       Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.
       Thank you.
       The EGMS Team
      """

  @198790 @ValidatenewlyassignedownerPMreceivesanemailafterinternalprogramissenttoownerduringapprovalswhenownershipistransferredbeforepostprogramisReviewed @sprint-4 @vaibhav @reassignment
  Scenario: Validate newly assigned owner PM receives an email after internal program is sent to owner during approvals when ownership is transferred before post program is Reviewed
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Announcement | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Step 1       | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Program | Announcement | Announcement | FDM    | Award | Post Award / Monitoring | Closeout |
      | Step 1  | Step 1       | Step 1       | Step 1 | NA    | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Award  |
      | Automation EXE1 | Step 1 |
    Then I softly can see top right button "Submit for Approval" in page detail
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I "Send to Owner" in the approval decision
    And I logout
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox:Notification: Request to Approve {SavedValue:ProgramEGMSID}
      """
    Then I see the mail text is as follows :
      """
       Hello Automation EXE,

       This email is to notify you that Program #{SavedValue:ProgramEGMSID} has been created and is waiting for your approval.

       Program Details:
       Program ID: {SavedValue:ProgramEGMSID}
       Program Name: {SavedValue:Automation Runtime Internal Program}

       Log in to EGMS and click here to start reviewing the Program.

       Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

       Thank you.
       The EGMS Team
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then  I can see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    Then  I can see top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    Then  I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:approverTableId---"
    When I navigate to "Files" sub tab
    Then  I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then  I can see top right button "Add" in flex table with id "---program:-:internalProgramNotesTableId---"

  @199612 @validateownershipreassignmentissuccessfulforainternalprogramonRejectedstatus @sprint-4 @vaibhav @reassignment
  Scenario: Validate ownership reassignment is successful for a internal program on Rejected status
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Reject" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    And I refresh the page
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" inside row "1" at position "1" contains text "Rejected"

  @197314 @ValidatereassignedtaskownerEXEuserisabletoactivatetheexternalprogramifanotherEXEtransferstaskofthetasktypeActivateNGOProgramwhenstatusoftaskasNotstarted @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate reassigned task owner EXE user is able to activate the external program if another EXE transfers task of the task type Activate NGO Program when status of task as Not started
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @197549 @ValidateownershiptasksareroutedtoretainedbyappropriateuserwhentaskshavingdifferentpurposearereassignedsimultaneouslytoanotherPMuserfor3differentexternalprograms @sprint-4 @vaibhav @reassignment @taskreassign
  Scenario: Validate ownership & tasks are routed to retained by appropriate user when tasks having different purpose are reassigned simultaneously to another PM user for 3 different external programs
    When I login to "As a Grantor" app as "PM" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 1  |
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 1  |
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 1  |
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I click on advance filter "#advfGrantorTaskReassignment" of table id "---program:-:grantorTaskReassignTableId---"
    When I enter advance filter values inside id "advfGrantorTaskReassignment"
      | EGMS ID | Contains | {SavedValue:ProgramEGMSID} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I click on advance filter "#advfGrantorTaskReassignment" of table id "---program:-:grantorTaskReassignTableId---"
    When I enter advance filter values inside id "advfGrantorTaskReassignment"
      | EGMS ID | Contains | {SavedValue:ProgramEGMSID1} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID1}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID1}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I click on advance filter "#advfGrantorTaskReassignment" of table id "---program:-:grantorTaskReassignTableId---"
    When I enter advance filter values inside id "advfGrantorTaskReassignment"
      | EGMS ID | Contains | {SavedValue:ProgramEGMSID2} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:ProgramEGMSID2}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID2}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID2}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID1}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID1}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation EXE" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID2}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID2}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "green"

  @199388 @ValidatereassignedtaskownerPMuserisabletoactivatetheexternalprogramifadmintransferstaskofthetasktypeActivateNGOProgramwhenstatusoftaskisNotStarted @sprint-4 @vaibhav @reassignment
  Scenario: Validate reassigned task owner PM user is able to activate the external program if admin transfers task of the task type Activate NGO Program when status of task is Not Started
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @199398 @ValidatereassignedtaskownerADMINuserisabletoactivatetheexternalprogramwhenheshetransferstaskofthetasktypeActivateNGOProgramtoanotheruserhavingprofileasADMIN @sprint-4 @vaibhav @reassignment
  Scenario: Validate reassigned task owner ADMIN user is able to activate the external program when he she transfers task of the task type Activate NGO Program to another user having profile as ADMIN
    When I login to "As a Grantor" app as "ADMIN" user
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
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name              | Program |
      | Automation ADMIN1 | Step 1  |
    Then I softly see value "Automation ADMIN1" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation ADMIN" into field "s2id_autogen1"
    And I select value "Automation ADMIN1" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    And I pause execution for "5" seconds
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @199405 @ValidatereassignedtaskownerADMINuserisabletoactivatetheinternalprogramifanotherADMINtransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskasNotstarted @sprint-4 @vaibhav @reassignment
  Scenario: Validate reassigned task owner ADMIN user is able to activate the internal program if another ADMIN transfers task of the task type Activate the Program when status of task as Not started
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation ADMIN" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "SYSTEM" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "SYSTEM" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "KPI-0085" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "KPI-0085" in the table "---program:-:associateKPITableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name              | Program |
      | Automation ADMIN1 | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation ADMIN" into field "s2id_autogen1"
    And I select value "Automation ADMIN1" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Amend Program" in page detail

  @199393 @ValidatereassignedtaskownerPOuserisabletoactivatetheexternalprogramwhentransferstaskofthetasktypeActivateNGOProgramtoanotheruserhavingprofileasPO @sprint-4 @vaibhav @reassignment
  Scenario: Validate reassigned task owner PO user is able to activate the external program when transfers task of the task type Activate NGO Program to another user having profile as PO
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Completed" for title "Status" inside table "---program:-:completedTaskTableId---"

  @204027 @ValidateTheinternaluserPMcanadddescriptionandotherdetailsinSupportingDocumentChecklist @sprint-7-US-202724 @vaibhav
  Scenario: Validate The internal user<PM> can add description and other details in Supporting Document Checklist
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
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I softly see value "Automation test description" for title "Description" inside table "---program:-:checklistTableId---"
    Then I softly see value "Mandatory" for title "Required" inside table "---program:-:checklistTableId---"
    Then I softly see value "Application" for title "Applies To" inside table "---program:-:checklistTableId---"
    Then I softly see value "Active" for title "Status" inside table "---program:-:checklistTableId---"

  @204031 @ValidateUserAdminclickonUploadTemplateiconamodalwillopenanditwillbereplacedbynewmodalnamedasAddFile @sprint-7-US-202724 @vaibhav
  Scenario: Validate  User <Admin> click on "Upload Template" icon  a modal will open and it will be replaced by new modal named as Add File
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
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I softly see "Add Files" opens in overLay window

  @204033 @ValidatenewmodalofaddfilesopenitwillhaveoneoptionUploadFilefromComputer @sprint-7-US-202724 @vaibhav
  Scenario: Validate new modal of add files open it will have one option Upload File from Computer
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I switch to iframe with id "---program:-:supportDocIframeId---"
    Then I see "Upload File from Computer" page block displayed

  @204034 @ValidateUploadFIlesfromComputerwillhavesectionslikeClassificationUploadFileChooseaFileORDragithereDescription @sprint-7-US-202724 @vaibhav
  Scenario: Validate Upload FIles from Computer will have sections like: Classification, Upload File (Choose a File OR Drag it here), Description
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I switch to iframe with id "---program:-:supportDocIframeId---"
    Then I see field "Classification" as "Select file classification" on modal
    Then I see field "Upload File" as " " on modal
    Then I see field "Description" as " " on modal

  @204037 @ValidateUserPMcanseetwobuttonsatthebottomofUploadFilesfromComputerUploadItwillenableonlyafterwechooseafiletouploadelseitwillbedisabled @sprint-7-US-202724 @vaibhav
  Scenario: Validate User PM can see two buttons at the bottom of Upload Files from Computer Upload It will enable only after we choose a file to upload else it will be disabled
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I switch to iframe with id "---program:-:supportDocIframeId---"
    Then I see "Upload" button is disabled at modal under library
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library

  @204036 @ValidateUserPMcanseetwobuttonsatthebottomofUploadFilesfromComputerupload&Cancel @sprint-7-US-202724 @vaibhav
  Scenario: Validate User PM can see two buttons at the bottom of Upload Files from Computer upload & Cancel
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I see "Upload" button is disabled at modal under library
    Then I see "Cancel" button is displayed On Modal

  @204038 @ValidateCancelbuttonIfclickonCancelthanthemodalwillcloseanddetailsfilledwillbelost @sprint-7-US-202724 @vaibhav
  Scenario: Validate Cancel button If click on Cancel than the modal will close and details filled will be lost
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
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I click modal button "Cancel"
    Then I see value "Not Applicable" for title "Template Link" against the value "Active" inside table "---program:-:checklistTableId---"

  @204046 @ValidateCancelbuttonwillalwaysbeenabled @sprint-7-US-202724 @vaibhav
  Scenario: Validate Cancel button will always be enabled
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I do not see "Cancel" button is disabled at modal under library

  @198791 @ValidateemailnotificationregardingReviewcompletionoftheinternalprogramissenttothenewowneruponreviewcompletionwhenownershipistransferredforPrograminSubmittedforReviewstate @sprint-5-US-195182 @vaibhav @reassignment @buglogged-199105
  Scenario: Validate email notification regarding Review completion of the internal program is sent to the new owner upon review completion when ownership is transferred for a Program in Submitted for Review state
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then  I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---program:-:peerReviewTableId---"
    When I click on "Delete" icon for "Automation EXE" inside flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see top right button "Complete Review" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I logout
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Program {SavedValue:ProgramEGMSID} has been PeerReviewed
      """
    Then I see the mail text is as follows :
      """
      Hello Automation,
      This email is to notify you that Program {SavedValue:ProgramEGMSID} has been peer reviewed.
      Program Details:
      Program ID: {SavedValue:ProgramEGMSID}
      Program Name: {SavedValue:Automation Runtime Internal Program}
      Log in to EGMS and click here to start reviewing the details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I can see top right button "Submit for Approval" in page detail

  @197527 @ValidatereassignedtaskownerPMuserisabletoactivatetheexternalprogramifadmintransferstaskofthetasktypeActivateNGOProgramwhenstatusoftaskisNotStarted @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate reassigned task owner PM user is able to activate the external program if admin transfers task of the task type Activate NGO Program when status of task is Not Started
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    And I pause execution for "5" seconds
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:adminTaskReassignmentTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @197530 @ValidatereassignedtaskownerEXEuserisabletocompletetheworkflowoninternalprogramifanotherEXEtransferstaskoftypeActivatetheProgramwhenprogramisamendedafteractivation @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate reassigned task owner EXE user is able to complete the workflow on internal program if another EXE transfers task of type Activate the Program when program is amended after activation
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "GrantorPlanning" for title "Phase Name" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Amend Program" in page detail

  @162651 @ValidateSystemAdminSAuserscannotreassignpendingtasksforAuditorprofileuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate System Admin SA users cannot reassign pending tasks for Auditor profile user
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation ADMIN" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "SYSTEM" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "SYSTEM" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "KPI-0085" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "KPI-0085" in the table "---program:-:associateKPITableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name              | Program |
      | Automation ADMIN1 | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation AUDITOR"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result

  @217607 @ValidateInternalProgapproveandownerofprogramaresamevalidateafterreassigningtheapprovaltaskownershipofrecordisnotchanged @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Internal Prog approver and owner of a program are same validate after reassigning the approval task ownership of record is not changed
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 2  |
    And I pause execution for "4" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"

  @217752 @ValidateInternalProgadditionalentriesmadeduetoreassignmentforR&Rincontexttonextmodulearecarriedahead @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Internal Prog additional entries made due to reassignment for R&R in context to next module are carried ahead
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Post Award / Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 2  | Step 1                  | Step 1   |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation PM" inside table "---program:-:approverTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"

  @217759 @ValidateInternalProgstepshouldgetupdatedifVictorEXEstep1approverreassignapprovertaskofsamerecordtoScottEXEwhosestepisNAforprogram @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Internal Prog_ Verify step should get updated if Victor EXE step 1 approver reassign approver task of same record to Scott EXE whose step is NA for program
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Post Award / Monitoring | Closeout |
      | Automation EXE1 | NA      | Step 1                  | Step 1   |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation EXE1" inside table "---program:-:approverTableId---"

  @217602 @ValidateInternalProgtaskreassignmentdoesnothappenwhenusertriestoreassignhistasktoanotheruserisresponsiblefordifferentstepofsamemodule @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Internal Prog_ Validate task reassignment does not happen when a user tries to reassign his task to another user is responsible for different step of same module
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1  | Step 2       | Step 2 | Step 2 | Step 2                  | Step 2   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation EXE1 | Step 2  | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program | Announcement | FDM    |
      | Automation FO | Step 3  | Step 3       | Step 3 |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "FDM" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Award" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Post Award / Monitoring" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Closeout" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "FDM" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Award" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation EXE1" inside table "---program:-:approverTableId---"

  @223421 @ValidatetransferofpeerreviewtasksisfailedincaseofanyreasonthenR&RonInternalprogramshouldnotgetupdated @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate transfer of peer review tasks is failed in case of any reason then R&R on Internal program should not get updated
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | FDM    | Closeout |
      | {SavedValue:PM Username} | Step 1  | Step 1 | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation PM1 | Step 2  | Step 2       | Step 2 | Step 2 | Step 2                  | Step 2   |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name   | Responsibility   | Description                 | Due Date |
      | Automation EXE1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I click on "Send for Review" icon for "Automation EXE1" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly see field "Created by" as "Automation PM"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "FDM" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Closeout" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "FDM" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Award" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Post Award / Monitoring" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Automation EXE" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    Then I softly see value "Automation EXE1" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" inside table "---program:-:historyTableId---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---program:-:historyTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @195757 @ValidateEmailistriggeredtoreassigneduserontheclickofReassignAll @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Email is triggered to the reassigned user on the click of Reassign All
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description                 | Due Date |
      | {SavedValue:PM Username} | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @217621 @ValidateInternalProgIapeerreviewerisalreadyaddedforsimilarroleandreviewertriestoreassignsuchtasktootherreviewerwithsameresponsibilityprogramreviewervalidatereassignmentfails @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Internal Prog If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (program reviewer)validate reassignment fails
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation FO | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation FO1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I click on "Send for Review" icon for "Automation FO1" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation FO] to [Automation FO1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation FO Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @161994 @ValidateForpeerreviewtasksifausertriestoreassignareviewtasktoauserwhowasalreadyassignedasreviewerontherecordandforthesametypeprogramorfiscalthetasksdogetreassigned @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate For peer review tasks, if a user tries to reassign a review task to a user who was already assigned as a reviewer on the record, and for the same type (program or fiscal), the tasks do not get reassigned
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation PM" inside table
    And I click on "Send for Review" icon for "Automation PM1" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation PM Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @224662 @ValidateInternalProgramfailureemailshouldgeneratedforapproversandsuccessemailgeneratedforpeerreviewers @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Internal Program failure email should generated for approvers and success email generated for peer reviewers
    When I login to "As a Grantor" app as "EXE" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement |
      | {SavedValue:PM Username} | Step 1  | Step 1       |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 2  |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation PM" inside table
    And I refresh the page
    And I click on "Send for Review" icon for "Automation PM" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:ProgramEGMSID} Approve Program Not Started Approve Program {SavedValue:ProgramEGMSID} Automation PM You cannot specify the same user for multiple steps for Program


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID1} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID1} Automation PM {Date:yyyy-MM-dd 00:00:00::d+10}
      {SavedValue:ProgramEGMSID1} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID1} Automation PM {Date:yyyy-MM-dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "PM1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgramEGMSID1}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Reviewer Name" against the value "Program Reviewer" inside table "---program:-:peerReviewTableId---"
    Then I softly see value "Automation PM1" for title "Reviewer Name" against the value "Fiscal Reviewer" inside table "---program:-:peerReviewTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "{SavedValue:PM Username}" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"

  @195749 @Validateuserseevalidationmessageifuserhasalreadyre-assignedthetasksandheistryingtore-assigntasksagainandbatchjobisalreadyrunning @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate user see validation message if user has already re-assigned the tasks and he is trying to re-assign tasks again and batch job is already running
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    Then I softly see the following messages in the page details :
      | Reassignment is still in progress, kindly wait for few minutes. |

  @195279 @ValidateProgramwhentheownershipofrecordischangedthenemailnotificationshouldsenttotheSAuserpreviousowner @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate Program when the ownership of a record is changed then email notification should sent to the SA user(previous owner)
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
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
      {SavedValue:ProgramEGMSID} Automation ADMIN Program

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @195280 @ValidateProgramwhentheownershipofrecordischangedthenemailnotificationshouldsenttothenewuser @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate Program when the ownership of a record is changed then email notification should sent to the new user
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "100" seconds
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
      {SavedValue:ProgramEGMSID} Automation ADMIN Program

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @162073 @ValidateEmailistriggeredtothereassigneduserontheclickofReassignselected @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate Email is triggered to the reassigned user on the click of Reassign selected
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description                 | Due Date |
      | {SavedValue:PM Username} | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @191032 @ValidatePlanningPMasrecordownercanseenewlyreassignApprovernameinapproversection @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate Planning PM as record owner can see newly reassign Approver name in approver section
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
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
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @195753 @ValidateEmailistriggeredtothereassigneduserontheclickofReassignselected @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Email is triggered to the reassigned user on the click of Reassign selected
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Responsibility   | Description                 | Due Date |
      | {SavedValue:EXE Username} | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation EXE {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation EXE {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @217601 @ValidateInternalProgstep2approverisinsertedforprogramcolumnwhenapprovaltaskisreassigned @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Internal Prog step2 approver is inserted for program column when approval task is reassigned
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Post Award / Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 2  | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement | Program |
      | {SavedValue:FO Username} | Step 3       | Step 3  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"

  @217603 @validateInternalProgtaskreassignmentissuccessfulwhenusertriestoreassignhistasktoanotheruserisresponsibleforsamestepofdifferentmodules @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Internal Prog task reassignment is successful when a user tries to reassign his task to another user is responsible for same step of different modules
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1  | Step 2       | Step 2 | Step 2 | Step 2                  | Step 2   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation EXE1 | Step 2  | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement | FDM | Award | Post Award / Monitoring | Closeout |
      | {SavedValue:FO Username} | Step 3  | NA           | NA  | NA    | NA                      | Step 3   |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 3" for title "Program" against the value "Automation FO1" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Post Award / Monitoring" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 3" for title "Closeout" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "FDM" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Award" against the value "Automation FO" inside table "---program:-:approverTableId---"

  @217609 @ValidateInternalProgIfapproverandownerofprogramaresameafterreassigningtheownershipofrecordapprovernameshouldnotchanged @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Internal Prog If approver and owner of a program are same validate after reassigning the ownership of record approver name should not changed
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Program" without tableid
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "Step 3" for title "Program" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"

  @217655 @ValidateInternalProgapproverdefinitionisnotmodifiedoninitialrecordifapproversarechangedatruntime @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Internal Prog approver definition is not modified on initial record if approvers are changed at runtime
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement |
      | {SavedValue:PM Username} | Step 1  | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM" inside table "---program:-:approverTableId---"

  @217745 @ValidateInternalProgIfpeerreviewerisalreadyaddedforsimilarroleandreviewertriestoreassignsuchtasktootherreviewerwithsameresponsibilityfiscalreviewervalidatereassignmentfails @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Internal Prog If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (fiscal reviewer) reassignment fails
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation FO1 | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I click on "Send for Review" icon for "Automation FO1" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "fo1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation FO] to [Automation FO1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation FO Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @217761 @ValidateInternalProgusershouldgetfailureemailifusertriestoreassignsameuserformultipleapprovalsteps @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Internal Prog user should get failure email if user tries to reassign same user for multiple approval steps
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program |
      | Automation EXE1 | Step 2  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:ProgramEGMSID} Approve Program Not Started Approve Program {SavedValue:ProgramEGMSID} Automation EXE You cannot specify the same user for multiple steps for Program


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @217762 @ValidateInternalProgadditionalentriesmadeduetoreassignmentforR&Rincontexttonextmodulearenotcarriedahead @sprint-7-US-191250 @vaibhav @reassignment
  Scenario: Validate Internal Prog additional entries made due to reassignment for R&R in context to next module are not carried ahead
    When I login to "As a Grantor" app as "PM1" user
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
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Announcement |
      | Automation EXE1 | Step 1  | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:ProgramEGMSID} | Program__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation EXE1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"

  @234010 @ValidateExternalProgramstep2approverisinsertedforprogramcolumnwhenapprovaltaskisreassigned @sprint-13-US-231194 @vaibhav @reassignment
  Scenario: Validate External Program step2 approver is inserted for program column when approval task is reassigned
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 2  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation PM1" inside table "---program:-:extapproverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM" inside table "---program:-:extapproverTableId---"