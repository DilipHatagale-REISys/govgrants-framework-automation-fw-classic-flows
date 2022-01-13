@program @grantor-regression @grantor-parallel-regression @planning
Feature: Validate all scenarios for program

  @109448 @VerifySelectionOfChildOrganization @monu
  Scenario: Verifying if the user is able to change or add child organization to created program
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    When I enter in modal value "Department of Health" into field "fieldAccount__c"
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
    Then I softly see field "Internal Organization" as "Department of Health"

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
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
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
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
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
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
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
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
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

  @111514 @VerifyForwardOfNGOProgram @monu @buglogged138933
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
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I click on "Submit For Approval" in the page details
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I softly see the following messages in the page details contains:
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
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
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