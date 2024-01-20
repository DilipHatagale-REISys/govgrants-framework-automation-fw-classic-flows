@program @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios for program with add file

  @222077 @222087 @VerifyPMusershouldabletoaddfilewhenInternalProgramisinCreatedStatusprovidedifuserhavingthemaineditaccess @sprint-10-US-199430 @addFiles
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
    #222087
    And I click on "Edit" icon for "Program Artifacts" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I select Classification as "Other Artifacts" at upload file modal
    When I click modal button "Save"
    Then I softly see value "Other Artifacts" for title "Classification" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Delete" icon for "Other Artifacts" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    Then I softly do not see value "Program Artifacts" for title "Title" inside table "---program:-:GrantorInternalProgramFilesTableId---"

  @222255 @VerifyifEXEuserisnotOwneroffilethenusercannotEditDeletefile @sprint-10-US-199430 @addFiles
  Scenario: Verify if <EXE> user is not Owner of file then user can not Edit/Delete file
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then  I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @222078 @VerifyadmnusershouldnotabletoaddfileifuserdonothavetheeditaccesstoInternalPrograminsubmitforapprovalstatus @sprint-10-US-199430 @addFiles
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
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:ADMIN Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Strategic Objectives Admin" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
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

  @222079 @VerifyexeusershouldablenottoaddeditdeletefilewhenInternalProgramisinsubmitforApprovalapprovedActiveStatus @sprint-10-US-199430 @addFiles
  Scenario: Verify <exe> user should able not to add/edit/delete file when Internal Program is in submit for Approval ,approved, Active Status.
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
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
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
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @222080 @VerifyPMusershouldnotabletoaddfileaftersubmitforapprovalstatus @sprint-10-US-199430 @addFiles
  Scenario:Verify PM user should not able to add file after submit for approval status
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
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @223487 @VerifyPMusershouldabletoaddfilewhenInternalProgramisinsubmittedforreviewandreviewstateprovidedifuserhavingthemaineditaccess @sprint-25-US-295138 @hitesh @addFiles
  Scenario:  Verify PM user should able to add file when Internal Program is in submitted for review and review state provided if user having the main edit access
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation PO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "green"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Other Artifacts" from computer
    Then I softly see "Other Artifacts" has been added in "Program Files" flex table

   @222081 @223555 @VVerifyifpeerreviewercanaddfilewhenthepeerreviewrecordisinsentforreviewinprogressstatusprovidedallowrecordeditingisyes @sprint-25-US-295138 @hitesh @addFiles
  Scenario: Verify if peer reviewer can add file when the peer review record is in sent for review/ in progress status provided  allow record editing is yes
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    Then I can see top right button "Edit" in page detail
    #223555
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
    And I click on "Edit" icon for "Program Artifacts" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I select Classification as "Other Artifacts" at upload file modal
    When I click modal button "Save"
    Then I softly see value "Other Artifacts" for title "Classification" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Delete" icon for "Other Artifacts" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table

  @222084 @Verifyifpeerreviewersubmitsthereviewafterthatwetakeawaytheeditaccesssoreviewerwillnotbeabletoaddfileafterthat @sprint-25-US-295138 @hitesh @addFiles
  Scenario:Verify if peer reviewer submits the review after that we take away the edit access so reviewer will not be able to add file after that
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
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
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @222085 @VerifyifinternaluserVictorEXEclicksoncompletereviewbuttonwetakeawaytheeditaccesssoreviewerwillnotbeabletoaddfileafterthat @sprint-25-US-295138 @hitesh @addFiles
  Scenario:Verify if internal user <Victor EXE> clicks on 'complete review' button we take away the edit access so reviewer will not be able to add file after that.
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
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Reviewed" and is "green"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @222088 @VerifyUsercannotEditdeletefileiftheyareowneroffilewhenprogramisinsubmitforapprovalstatus @sprint-10-US-199430 @addFiles
  Scenario: Verify User can not  Edit/delete file if they are owner of file when program  is in submit for approval status
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
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @222090 @VerifyifpeerreviewercaneditDeletefilewhenthepeerreviewrecordisinsentforreviewinprogressstatusprovidedallowrecordeditingisyes @sprint-25-US-295138 @hitesh @addFiles
  Scenario: Verify if peer reviewer can edit/Delete file when the peer review record is in sent for review/ in progress status provided  allow record editing is yes
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
    Then I softly see status in Progress-bar is "Created" and is "green"
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
    And I click on "Edit" icon for "Program Artifacts" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I select Classification as "Other Artifacts" at upload file modal
    When I click modal button "Save"
    Then I softly see value "Other Artifacts" for title "Classification" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Delete" icon for "Other Artifacts" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---program:-:GrantorInternalProgramFilesTableId---"

  @222092 @222093 @222096 @Verifyifpeerreviewersubmitsthereviewafterthatwetakeawaytheeditaccesssoreviewerwillnotbeabletoeditdeletefileafterthat @sprint-25-US-295138 @hitesh @addFiles
  Scenario: Verify if peer reviewer submits the review after that we take away the edit access so reviewer will not be able to edit/delete file after that
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
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    Then I softly see "Program Artifacts" has been added in "Program Files" flex table
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    And I navigate to "Files" sub tab
    #222096
    Then I softly can see row level action button "Download" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Files" sub tab
    #222096
    Then I softly can see row level action button "Download" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    #222092
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Reviewed" and is "green"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    #222093
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Edit" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I cannot see row level action button "Delete" against "Program Artifacts" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @222086 @VerifyIfallowrecordeditingisnoreviewerwillnotbeabletoaddfileatall @sprint-25-US-295138 @hitesh @addFiles
  Scenario: Verify If allow record editing is no, reviewer will not be able to add file at all
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I softly see status in Progress-bar is "Submitted for Review" and is "green"
    Then I cannot see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"



