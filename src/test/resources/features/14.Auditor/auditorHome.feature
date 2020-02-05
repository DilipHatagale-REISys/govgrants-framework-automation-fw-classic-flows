@auditorHome @auditor
Feature: Validate all scenarios for Auditor Profile in Home Module

  @69181 @auditorCannotCreateEditInternalOrganizations
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

  @69119 @auditorCanViewInternalOrganizations
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

  @69120 @auditorPendingTask
  Scenario: Verify Auditor do not have any pending tasks by any phase and by any due date filter.
    When I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I softly see "No Records Found" inside flex table with id "HomePendingTasks"

  @69121 @auditorCanViewSubrecipientOrganization
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

  @69122 @auditorCannotEditSubrecipientOrganization
  Scenario Outline:  Auditor should not be  able to  Edit subrecipient organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    Then I cannot see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---home:-:subrecipientActiveAccountId---"
    Examples:
      | User    |
      | AUDITOR |

  @69123 @auditorCanViewIndividualOrganization
  Scenario Outline: Validate Auditor should have view / read  only access to record for Individual organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    And I click on "View" icon for "{user:fullName}" inside flex table with id "---home:-:indActiveAccountId---"
    Then I see that "{user:fullName}" is in "Active" status
    Examples:
      | User    |
      | AUDITOR |

  @69124 @auditorCannotEditSubrecipientOrganization
  Scenario Outline:  Auditor should not be  able to  Edit Individual organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    Then I cannot see row level action button "Edit" against "{user:fullName}{user:fullName}" in flex table with id "---home:-:indActiveAccountId---"
    Examples:
      | User    |
      | AUDITOR |

  @69125 @auditorCannotCreateEDitContact
  Scenario Outline: Validate Auditor should not be  able to Create/Edit any Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:internalContactTableId---"
    Then I see the following rows under the following headers in table with id "---home:-:internalContactTableId---" :
      | Full Name     | Actions |
      | Automation PO | View    |
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69126 @auditorCanViewCreatedContact
  Scenario Outline: Validate Auditor should have view / read  only access to record.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation PO" in "---home:-:internalContactTableId---" panel
    Then I softly can see row level action button "View" against "Automation PO" in flex table with id "---home:-:internalContactTableId---"
    And I click on "View" icon for "Automation PO" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see field "Organization" as "Test Automation Organization"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69128 @69132 @69144 @auditorCannotSendInvitationCanViewSMEReviewersContactDetails
  Scenario Outline: Verify Auditor  Cannot create SME conatct and do not have access to send invitation (Bulk or single clicking paper aeroplane icon)/ Verify Auditor can view / read  only access to SME Reviewers Contact details
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:reviewersTableId---"
    When I perform quick search for "Automation SME" in "---home:-:reviewersTableId---" panel
    Then I softly can see row level action button "View" against "Automation SME" in flex table with id "---home:-:reviewersTableId---"
    Then I softly cannot see row level action button "Send Invitation" against "Automation SME" in flex table with id "---home:-:reviewersTableId---"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69129 @auditorReassign
  Scenario: Verify Auditor profile would not have tasks assigned,  Re assign will populate no tasks to reassign
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "Reassign" content inside "My Tasks" subheader on left panel
    Then I cannot see user "AUDITOR" in the reassign box

  @69130 @auditorTaskSummaryPhase
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

  @69131 @auditorCompletedTask
  Scenario: Verify Auditor does not have any completed tasks
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I softly see "No Records Found" inside flex table with id "---home:-:completedAssignedToMe---"
    Then I softly see "No Records Found" inside flex table with id "---home:-:completedAssignedByMe---"
    Then I collect all the soft asserts

  @69142 @auditorCannotCreateEditSubrecipientContact
  Scenario Outline: Validate Auditor cannot Create/Edit any subrecipient contact user
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:subrecipientcontactTableId---"
    When I perform quick search for "Automation Manager" in "---home:-:subrecipientcontactTableId---" panel
    Then I softly cannot see row level action button "Edit" against "Automation Manager" in flex table with id "---home:-:subrecipientcontactTableId---"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69143 @auditorViewSubrecipientContacts
  Scenario Outline: Validate Auditor should have view / read  only access to subrecipient contacts
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation Manager" in "---home:-:subrecipientcontactTableId---" panel
    Then I see the following rows under the following headers in table with id "---home:-:subrecipientcontactTableId---" :
      | Full Name          | Actions |
      | Automation Manager | View    |
    And I click on "View" icon for "Automation Manager" inside flex table with id "---home:-:subrecipientcontactTableId---"
    Then I softly see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |
