@auditorHome
Feature: Validate all scenarios for Auditor Profile in Home Module

  @auditorCannotCreateEditInternalOrganizations
  Scenario Outline: Validate Auditor should not be  able to Create/Edit internal organization.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:internalOrganizationId---"
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    Then I softly cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @auditorCanViewInternalOrganizations
  Scenario Outline: Validate Auditor should have view / read  only access to record.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I softly see that "Internal Organization" is in "Active" status
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @auditorPendingTask
  Scenario: Verify Auditor do not have any pending tasks by any phase and by any due date filter.
    When I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I softly see "No Records Found" inside flex table with id "HomePendingTasks"

  @auditorCanViewSubrecipientOrganization
  Scenario Outline: Validate Auditor should have view / read  only access to record for subrecipient organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User    |
      | AUDITOR |

  @auditorCannotEditSubrecipientOrganization
  Scenario Outline:  Auditor should not be  able to  Edit subrecipient organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    Then I cannot see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---home:-:subrecipientActiveAccountId---"
    Examples:
      | User    |
      | AUDITOR |

  @auditorCanViewIndividualOrganization
  Scenario Outline: Validate Auditor should have view / read  only access to record for Individual organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation ind23" in "---home:-:indActiveAccountId---" panel
    And I click on "View" icon for "Automation ind23" inside flex table with id "---home:-:indActiveAccountId---"
    Then I see that "Automation ind23" is in "Active" status
    Examples:
      | User    |
      | AUDITOR |

  @auditorCannotEditSubrecipientOrganization
  Scenario Outline:  Auditor should not be  able to  Edit Individual organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation ind23" in "---home:-:indActiveAccountId---" panel
    Then I cannot see row level action button "Edit" against "Automation ind23" in flex table with id "---home:-:indActiveAccountId---"
    Examples:
      | User    |
      | AUDITOR |

  @auditorCannotCreateEDitContact
  Scenario Outline: Validate Auditor should not be  able to Create/Edit any Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:internalContactTableId---"
    When I perform quick search for "Automation PO" in "---home:-:internalContactTableId---" panel
    Then I softly can see row level action button "Edit" against "Automation PO" in flex table with id "flexTableRandomID"
    Examples:
      | User    |
      | AUDITOR |

  @auditorCanViewCreatedContact
  Scenario Outline: Validate Auditor should have view / read  only access to record.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation PO" in "---home:-:internalContactTableId---" panel
    Then I softly can see row level action button "View" against "Automation PO" in flex table with id "flexTableRandomID"
    And I click on "View" icon for "Automation PO" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see field "Organization" as "Test Automation Organization"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @auditorCannotSendInvitation
  Scenario Outline: Verify Auditor do not have access to send invitation (Bulk or single clicking paper aeroplane icon)
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    Then I softly can see row level action button "Send Invitation" against "Automation SME" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User    |
      | AUDITOR |

  @auditorReassign
  Scenario: Verify Auditor profile would not have tasks assigned,  Re assign will populate no tasks to reassign
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---home:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---home:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Reassign" content inside "My Tasks" subheader on left panel
    When I reassign task to "Automation Auditor"
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Program" in "HomePendingTasks" panel
    Then I see "No Records Found" inside flex table with id "HomePendingTasks"

  @auditorTaskSummaryPhase
  Scenario: Validate Auditor should have no pending task in any of the filter.
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---home:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---home:-:associateContactsTableId---"
    When I close "Contacts" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Reassign" content inside "My Tasks" subheader on left panel
    When I reassign task to "Automation Auditor"
    When I re-login to "As a Grantor" app as "Auditor" user on "INTERNAL" portal
    When I navigate to "Home" tab
    Then I see task count for "Planning" phase with the total records of flex table id "PhasePendingTasks"


