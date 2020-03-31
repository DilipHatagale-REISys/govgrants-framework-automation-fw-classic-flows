@home @regression
Feature: Validate all scenarios in the home tab

  @35024 @internalOrganizationCreate @nonFunctional @wip
  Scenario: Verifying if the Admin has create access to Internal Organization
    Given I delete the record "Product Automation permanent Orgtn" from the object "ACCOUNT"
    Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "---home:-:organizationId---"
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status

  @35637 @internalOrganizationAdminEdit @nonFunctional @wip
  Scenario Outline: Verifying if the Admin has edit access to Internal Organization
    Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    When I click on "View" icon for "<Organization name>" inside flex table with id "---home:-:organizationId---"
    When I click on "Edit" in the page details
    When I enter value "Automation" into field "Abbreviation__c"
    And I click on "Save" in the page details
    Then I see that "Internal Organization" is in "Created" status
    Examples:
      | Organization name                     |
      | Internal Automation Organization Test |

  @56708 @56709 @56710 @internalOrganizationViewADMINEditPMView @smoke
  Scenario Outline: Validate whether all users have view access to Internal Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    Then I softly can see row level action button "View" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I softly see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
      | PM    |
      | EXE   |

  @56712 @56713 @activeINDandsubrecipientOrganizationView
  Scenario Outline: Validate whether all users have view access to Subrecipient Organization and Active Individual Subrecipients
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    Then I softly see that "Subrecipient Organization" is in "Active" status
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    And I click on "View" icon for "{user:fullName}" inside flex table with id "---home:-:indActiveAccountId---"
    Then I softly see that "{user:fullName}" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56714 @56715 @activeIndividualSubrecipientsEdit
  Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Individual Subrecipients and Subrecipient Organizations
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---home:-:subrecipientActiveAccountId---"
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    Then I softly can see row level action button "Edit" against "{user:fullName}" in flex table with id "---home:-:indActiveAccountId---"
    Examples:
      | User  |
      | ADMIN |

  @56716 @56717 @56718 @internalContactsViewCreateEdit @smoke
  Scenario Outline: Validate that Internal contacts are accessible across agencies and can be create, Edit and view access to Contacts by any Internal users
    Given I delete the record "Automation PO" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I perform quick search for "Automation PO" in "---home:-:internalContactTableId---" panel
    Then I softly can see row level action button "View" against "Automation PO" in flex table with id "flexTableRandomID"
    And I click on "View" icon for "Automation PO" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see field "Organization" as "Test Automation Organization"
    Then I softly can see row level action button "Edit" against "Automation PO" in flex table with id "---home:-:internalContactTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56720 @56721 @smeReviewersContactViewAndCreate @smoke
  Scenario Outline: Verifying all Internal Users has View access to SME Reviewers Contact
    Given I delete the record "Automation SME" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    Then I softly see values "Automation SME" and "New" inside table
    When I perform quick search for "Automation SME" in "---home:-:reviewersTableId---" panel
    Then I softly can see row level action button "View" against "Automation SME" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56722 @smeReviewersContactSendInvitation
  Scenario Outline: Verify the system allows all Internal users to Send Invitation to SME Reviewer
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on "Send Invitation" icon for "Automation SME" inside flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56723 @activeSMEReviewersContactDetailPageView
  Scenario Outline: Verify that system allows user to see the detail page of Active SME Reviewer contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation SME" in "---home:-:reviewersTableId---" panel
    Then I can see row level action button "View" against "Automation SME" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56724 @56725 @56726 @termsandConditionsViewCreateAdminEdit @bug-69291 @smoke
  Scenario Outline: Verifying all Internal Users has View, Create and Edit access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "New" modal by clicking the top right x button
    When I perform quick search for "TC-598383" in "---home:-:termsAndConditionsTableId---" panel
     Then I softly see value "Active" for title "Status" against the value "TC-598383" inside table "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "Edit" against "TC-598383" in flex table with id "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56727 @56728 @56729 @56730 @eindunsRegistrationSamgovRegistrationcontactUsView @wip
  Scenario Outline: Validate whether all users have view access to EINRegistration,DUNSRegistration,SAM.Gov and Contactview
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to "DUNS Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to "SAM.gov Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56732 @subrecipientOrganizationEdition @smoke
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Subrecipient Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    When I click on "Edit" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    And I enter "Edition" values from "SubrecipientOrganization_Field_Values"
    When I click on "Save" in the page details
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56733 @internalContactsEdition @smoke
  Scenario Outline: Validate whether all Internal Users can edit the Contacts
    Given I delete the record "Automation PO" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I perform quick search for "Automation PO" in "flexTableRandomID" panel
    When I click on "Edit" icon for "Automation PO" inside flex table with id "flexTableRandomID"
    And I enter "Edition1" values from "InternalContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I perform quick search for "Automation PO" in "flexTableRandomID" panel
    Then I see value "Active" for title "Status" inside table "flexTableRandomID"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56719 @56734 @subrecipientContactsCreateEdit @smoke
  Scenario Outline: Verifying if the Internal Users has create and Edit access to Subrecipient Contact
    Given I delete the record "Automation Manager" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I click on "View" icon for "Automation Manager" inside flex table with id "---home:-:internalContactTableId---"
    Then I softly see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    When I click on "Edit" icon for "Automation Manager" inside flex table with id "---home:-:internalContactTableId---"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see value "New" for title "Status" inside table "---home:-:internalContactTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56735 @smereviewersContactEdition
  Scenario Outline: Verifying all Internal Users has Edit access to SME ---home:-:reviewersTableId--- Contact
    Given I delete the record "Automation SME" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I click on "Edit" icon for "Automation SME" inside flex table with id "---home:-:reviewersTableId---"
    When I enter "Edition" values from "PotentialContact_Field_values.xlsx"
    And I click modal button "Save"
    Then I see value "New" for title "Status" inside table "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56736 @56737 @additionalAddressesCreationEdition
  Scenario Outline: Validate whether ADMIN can Create and Edition of Additional Addresses
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditionalAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "New" modal by clicking the top right x button
    Then I softly see that "Internal Organization" is in "Active" status
    When I perform quick search for "Billing Address" in "---home:-:additionalAddressTableId---" panel
    And I click on "Edit" icon for "Billing Address" inside flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditioanlAddressesEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see that "Test Automation Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56739 @56907 @relatedContactsCreationEdition
  Scenario Outline: The Internal Users should be able to Create and Edit Related Contacts
    Given I delete the record "Automation Contact" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I perform quick search for "Automation Contact" in "---home:-:relatedContactsTableId---" panel
    And I click on "Edit" icon for "Automation Contact" inside flex table with id "---home:-:relatedContactsTableId---"
    When I enter "RelatedContactsEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "Edit" modal by clicking the top right x button
    Then I softly see that "Internal Organization" is in "Active" status
    Examples:
      | User |
      | EXE  |
      | PM   |

  @56738 @deletionOfRelatedContact
  Scenario:  Validate whether the admin is able to Delete Related Contacts
    Given I delete the record "Automation Contact" from the object "Contact"
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I perform quick search for "Automation Contact" in "---home:-:relatedContactsTableId---" panel
    And I click on "Delete" icon for "Automation Contact" inside flex table with id "---home:-:relatedContactsTableId---"
    When I perform quick search for "Automation Contact" in "---home:-:relatedContactsTableId---" panel
    Then I see "No Records Found" inside flex table with id "---home:-:relatedContactsTableId---"

  @56740 @56741 @56742 @dunsNumberCreationEditionAndDeletion @smoke @bug-69292
  Scenario Outline: Validate whether ADMIN and DA users can Create, Edit and delete the DUNS Number
    Given I delete the record "Test Automation Organization" from the object "DUNS"
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I enter the following values into flex table with id "---home:-:dunsTableId---" by clicking "New" :
      | DUNS Number | Entity Name as Registered | Location |
      | 138047990   | Test132                   | HernNdon |
    Then I softly see values "138047990" and "HernNdon" inside table
    When I click on "Edit" icon for "138047990" inside flex table with id "---home:-:dunsTableId---"
    And I click on top right button "Save" in flex table with id "---home:-:dunsTableId---"
    Then I softly see values "138047990" and "HernNdon" inside table
    When I click on "delete" icon for "138047990" inside flex table with id "---home:-:dunsTableId---"
    Then I softly do not see values "138047990" and "DUNSNumber" inside table
    Examples:
      | User |
      | PM   |

  @56743 @deleteIndirectCostRate
  Scenario: Validate whether ADMIN and DA users can delete the Indirect Cost Rates
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I click on top right button "New" in flex table with id "---home:-:indirectRateFlextableId---"
    And I enter "New IDC" values from "InternalOrganization_Field_Values.xlsx"
    When I click modal button "Save"
    And I perform quick search for "New IDC" in "---home:-:indirectRateFlextableId---" panel
    When I click on "Delete" icon for "New IDC" inside flex table with id "---home:-:indirectRateFlextableId---"
    Then I do not see values "New IDC" and "Title" inside table

  @56883 @56912 @adminOrPMEditAccessToOwnOrgInternalOrganizationPageHeader @wip
  Scenario Outline: Users with Admin/ PM profiles can edit their own organizations and Internal organization page has Header
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56911 @foUserCannotEditOrg
  Scenario: Validate whether Fo User Can edit Internal Organizations
    Given I login to "As a Grantor" app as "FO" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    Then I cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"

  @57340 @thirdPartyVerification @nonFunctional
  Scenario Outline: Verifying if the Internal Users has Edit access to Subrecipient Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table without waiting for record
    Then I see field "SAM.Gov Expiration Date" is not editable
    Examples:
      | User  |
      | ADMIN |

  @57341 @listpageViewChildOrganizations
  Scenario Outline:: Verify system allows access to all Internal users to view the List page
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Teaching and Learning" in "---home:-:internalOrganizationId---" panel
    And I expand nested table containing column value "Teaching and Learning"
    Then I see values "Career and College Transition Division" and "Division" inside table
    Examples:
      | User  |
      | ADMIN |

  @57342 @agencyBelongsToOneParent
  Scenario Outline: Verify whether an Agency belongs to only one Parent
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    Then I see values "Test Automation Organization" and "Agency" inside table
    Examples:
      | User  |
      | ADMIN |

  @57343 @individualSubrecipientContactCreation
  Scenario Outline: Validate whether ADMIN/DA have can new address details to Ind Subrecipient org
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    When I click on "View" icon for "{user:fullName}" inside table without waiting for record
    And I click on top right button "New" in flex table with id "AdditionalAddressInternal"
    And I enter "AdditioanlAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see values "Billing Address" and "VA" inside table
    Examples:
      | User  |
      | ADMIN |

  @57344 @57345 @59015 @homePendingTaskCompletedAndTaskCount
  Scenario: Validate whether user is able to view the total count of pending Tasks assigned to user and Pending Task and Completed Task on the left Navigation shows Pending Tasks across all the Modules
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
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I softly see values "Approve Program" and "Not Started" inside table
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I "Approve" in the approval decision
    And I navigate to "Home" tab
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:completedAssignedToMe---" panel
    Then I softly see values "Approve Program" and "Completed" inside table

  @57346 @subrecipientOrganizationDUNSandEINS
  Scenario Outline: Verify whether the Organization has at least one DUNS Numbers
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    Then I see values "567890980" and "345678908" inside table
    Examples:
      | User  |
      | ADMIN |

  @73851 @73850 @73856 @57347 @57348 @viewActiveGrantsSubmittedApplicationsOnRelatedLog
  Scenario Outline: Verify all profiles users should be able to view the Submitted Applications and Active Grants.
    Given I delete the record "Automation Announcement for Application Intake" from the object "Application"
    And I delete the record "Automation Announcement for Application Intake" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "Automation Announcement for Application Intake" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I see value "Automation Announcement for Application Intake" for title "Title" inside table "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "View" icon for "Automation Announcement for Application Intake" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I softly see field "Opportunity" as "Automation Announcement for Application Intake"
    Then I softly see field "Status" as "Published"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name           | Project Role             | Is Key Contact |
      | Automation SPI | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "Automation Announcement for Application Intake" in "RecipientAppReviewList" panel
    Then I softly can see row level action button "View" against "Automation Announcement for Application Intake" in flex table with id "RecipientAppReviewList"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @57349 @viewActiveIndividualOrganizations
  Scenario Outline: The Internal Users should be able to view all the Active Individual Subrecipients that are registered in the system and may be recipients of grants
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    Then I can see row level action button "View" against "{user:fullName}" in flex table with id "---home:-:indActiveAccountId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @58245 @reassign @smoke
  Scenario: The Reassign on the left Navigation allows the reassignment of tasks.
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
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Reassign" content inside "My Tasks" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "Record Id" in "TaskReassignment" panel
    And I click "Reassign Selected" after selection of "Approve Program" in the table "TaskReassignment"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see that "Approve Program" has been added in flextable with Id "---home:-:internalHomePendingTaskTableId---"

# Files tab and Collab are rendered if the Chatter setting is enabled.Both are dependant on each other and if the chatter is disabled, the files and collab are not rendered. We are disabling the chatter on Automation to avoid conenct API's issues.
  @59016 @validateFilesOnHome @deepika @bug-66960 @wip
  Scenario: Addition of Attachment to Focus Area by User - Admin/EXE/PM
    Given I delete the record "Automation Execution Focus Area" from the object "Focus Area"
    When I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Execution Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents"
    When I navigate to "Home" tab
    And I click on "My_Workspace_File"
    Then I see "Record Id" has been added in My Workspace Files

  @62102 @pageBlockSections @deepika
  Scenario Outline: Verify whether the Overview Tab has the sections: Related Contacts and Indirect rates
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---" with wait for record
    And I navigate to "Overview" sub tab
    Then I softly can see page block "Related Contacts"
    And I softly can see page block "Indirect Cost Rates"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @62103 @pageBlockSectionsRelatedLog @deepika
  Scenario Outline:  Validate whether the Related Log displays Active Federal/NGO Applications (Grantee) and Active Federal/NGO Grants (Grantee).
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---" with wait for record
    And I navigate to "Related Log" sub tab
    Then I can see page block "Internal Programs"
    Then I can see page block "Announcements"
    Then I can see page block "Active Applications"
    Then I can see page block "Active Grants"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @62104 @indProfileEditAccess @deepika
  Scenario: Verify other than Admin and Ind Profile Users, other users cannot edit the Ind subrecipient profile Information
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    Then I cannot see row level action button "Edit" against "{user:fullName}" in flex table with id "---home:-:indActiveAccountId---"

  @62105 @externalUserhomePendingTask @deepika
  Scenario: The Pending Task on the left Navigation shows Pending Tasks that are created for Subrecipient Users
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name           | Description                 |
      | Program Approver | Automation EXE | Automation Test Description |
      | Fiscal Approver  | Automation FO  | Automation Test Description |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation EXE" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    Then I see value "Record id" for title "EGMS ID" inside table "---home:-:externalPendingTasktableId---"

  @indUserEditProfile @deepika
  Scenario: Verify whether the Individual Sub Profile Users can view their own contact information under Overview Tab
    Given I am on "SUBPORTAL" portal
    When I login as "IND" user
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    When I navigate to "Overview" sub tab
    When I perform quick search for "{user:fullName}" in "---home:-:indContactTableId---" panel
    Then I see that "{user:fullName}" has been added in flextable with Id "---home:-:indContactTableId---"

  @62255 @CreatedNotes @keerti
  Scenario: Verify created notes on Home Tab
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I click on "My_Workspace_Notes"
    And I click on user notes content with icon name "plus"
    When I enter notes with title "Automation Title" and description "Automation Description"
    And I click modal button "Save and Close"
    Then I see the text containing "title"

  @62254 @PerformGlobalSearchOnHomeTab @keerti @bug-72220
  Scenario: Verify Global search on Home Tab
    Given I delete the record "Automation Execution Internal Program" from the object "Program"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I save the field labeled "EGMS ID" as "ProgramID"
    And I click on "Save" in the page details
    And I navigate to "Home" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramID}"
    And I click toggle button to select "Internal Programs"
    Then I see value "{SavedValue:ProgramID}" for title "EGMS ID" inside table "Program__c"

  @62912 @VerifyrecentlyViewedRecordAndDetailsOnMiniPageLayoutAndHoverLink @keerti @wip
  Scenario: The Internal User should be able to view the recently viewed record and details on the Mini pagelayout and the hover link  will take to the record
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I navigate to "Planning" tab
    And I click on recently viewed record of "Sme Reviewers"
    Then I click on the hover link  will take to the record on Minipagelayout
    Then I see "Sme Reviewers" page

  @62911 @VerifyStatusIsNewForInvitation/BulkInvitationISentStatusChanges @keerti
  Scenario Outline: Validate once Contact has registered the status will be New , when the Invitation/Bulk Invitation is sent, the status changes from Invitation Sent
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on "Send Invitation" icon for "Automation SME" inside flex table with id "---home:-:reviewersTableId---"
    And I click "Send" button in modal
    When I close "Send Invitation" modal by clicking the top right x button
    And I perform quick search for "Automation SME" in "---home:-:reviewersTableId---" panel
    Then I see value "Invitation Sent" for title "Status" inside table "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |