@auditorHome @auditor @parallel-regression @regression
Feature: Validate all scenarios for Auditor Profile in Home Module

  @68181 @auditorCannotCreateEditInternalOrganizations @smoke
  Scenario Outline: Validate Auditor should not be  able to Create/Edit internal organization.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:internalOrganizationId---"
    #When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    Then I softly cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    Examples:
      | User    |
      | AUDITOR |

  @69119 @auditorCanViewInternalOrganizations
  Scenario Outline: Validate Auditor should have view / read  only access to record.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    #When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I softly see that "Internal Organization" is in "Active" status
    Examples:
      | User    |
      | AUDITOR |

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

  @69124 @auditorCannotEditSubrecipientOrganization @smoke
  Scenario Outline:  Auditor should not be  able to  Edit Individual organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    Then I see the following rows under the following headers in table with id "---home:-:indActiveAccountId---" :
      | Full Name       | Actions |
      | {user:fullName} | View    |
    Examples:
      | User    |
      | AUDITOR |

  @69125 @auditorCannotCreateEditContact
  Scenario Outline: Validate Auditor should not be  able to Create/Edit any Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:internalContactTableId---"
    When I perform quick search for "Automation FO" in "---home:-:internalContactTableId---" panel
    Then I softly cannot see row level action button "Edit" against "True" in flex table with id "---home:-:internalContactTableId---"
    Then I softly see "Name" in flex table header "---home:-:internalContactTableId---"
    Then I softly see "Organization" in flex table header "---home:-:internalContactTableId---"
    Then I softly see "Email" in flex table header "---home:-:internalContactTableId---"
    Then I softly see "Phone" in flex table header "---home:-:internalContactTableId---"
    Then I softly see "Is User" in flex table header "---home:-:internalContactTableId---"

    Examples:
      | User    |
      | AUDITOR |

  @69126 @auditorCanViewCreatedContact
  Scenario: Validate Auditor should have view / read  only access to record.
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldEmail"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:internalContactTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see field "Organization" as "Test Automation Organization"

  @69144 @69132 @69128 @auditorCannotSendInvitationCanViewSMEReviewersContactDetails
  Scenario Outline: Verify Auditor Cannot create SME conatct and do not have access to send invitation (Bulk or single clicking paper aeroplane icon)/ Verify Auditor can view / read  only access to SME Reviewers Contact details
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---home:-:reviewersTableId---"
    When I perform quick search for "Test User A" in "---home:-:reviewersTableId---" panel
    Then I softly can see row level action button "View" against "Test User A" in flex table with id "---home:-:reviewersTableId---"
    Then I softly cannot see row level action button "Send Invitation" against "Test User A" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User    |
      | AUDITOR |

  @69129 @auditorReassign
  Scenario: Verify Auditor profile would not have tasks assigned,  Re assign will populate no tasks to reassign
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly cannot see user "AUDITOR" in the reassign box

  @69120 @69130 @auditorPendingTaskSummaryPhase
  Scenario: Validate Auditor should have no pending task in any of the filter.| Verify Auditor do not have any pending tasks by any phase and by any due date filter.
    Given I login to "As a Grantor" app as "AUDITOR" user
    When I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    Then I softly see "No records found" inside flex table with id "---home:-:planningPendingTaskTableId---"
    When I navigate to "Home" tab
    Then I softly see task count for "Planning" phase with the total records of flex table id "PhasePendingTasks"

  @69131 @auditorCompletedTask
  Scenario: Verify Auditor does not have any completed tasks
    Given I login to "As a Grantor" app as "AUDITOR" user
    And I navigate to "Home" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I softly see "No Records Found" inside flex table with id "---home:-:completedAssignedToMe---"
    Then I softly see "No Records Found" inside flex table with id "---home:-:completedAssignedByMe---"

  @69142 @auditorCannotCreateEditSubrecipientContact @smoke
  Scenario: Validate Auditor cannot Create/Edit any subrecipient contact user
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:uniqueEmailID} | fieldEmail |
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I close modal by clicking the top right x button
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    Then I softly do not see top right button "New" inside flex table "---home:-:internalContactTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:internalContactTableId---"

  @69143 @auditorViewSubrecipientContacts
  Scenario: Validate Auditor should have view / read  only access to subrecipient contacts
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter values into fields
      | Value                      | Field      |
      | {SavedValue:uniqueEmailID} | fieldEmail |
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:subrecipientcontactTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:subrecipientcontactTableId---"
    Then I softly see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"

  @69129 @validateAuditorReassign @meenakshi
  Scenario: Verify Auditor profile would not have tasks assigned  Re assign will populate no tasks to reassign
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly cannot see user "AUDITOR" in the reassign box