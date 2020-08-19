@home @grantor-regression @grantor-parallel-regression
Feature: Validate all scenarios in the home tab

  @56710 @56708 @internalOrganizationViewADMINEditPMView @smoke
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
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---" without waiting for record
    Then I softly see that "Subrecipient Organization" is in "Active" status
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "{user:fullName}" in "---home:-:indActiveAccountId---" panel
    And I click on "View" icon for "{user:fullName}" inside flex table with id "---home:-:indActiveAccountId---" without waiting for record
    Then I softly see that "{user:fullName}" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56715 @56714 @activeIndividualSubrecipientsEdit
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

  @56717 @56716 @56718 @internalContactsViewCreateEdit @smoke
  Scenario Outline: Validate that Internal contacts are accessible across agencies and can be create, Edit and view access to Contacts by any Internal users
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Contact}" in flex table with id "flexTableRandomID"
    And I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---" without waiting for record
    Then I softly see field "Organization" as "Test Automation Organization"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:internalContactTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56721 @56720 @smeReviewersContactViewAndCreate @smoke
  Scenario Outline: Verifying all Internal Users has View access to SME Reviewers Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    Then I softly see values "{SavedValue:Automation Runtime Contact}" and "New" inside table
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:reviewersTableId---"
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
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
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
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56725 @56724 @56726 @termsandConditionsViewCreateAdminEdit @bug-69291 @smoke
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
    Then I softly can see row level action button "View" against "TC-598383" in flex table with id "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "Edit" against "TC-598383" in flex table with id "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56727 @einRegistration
  Scenario Outline: Validate whether all users have view access to EINRegistration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to url "https://www.irs.gov/businesses/small-businesses-self-employed/apply-for-an-employer-identification-number-ein-online"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56728 @dunsRegistration
  Scenario Outline: Validate whether ADMIN have view access to DUNSRegistration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "DUNS Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to url "https://www.dnb.com/duns-number/view-update-company-credit-file.html"
    Examples:
      | User  |
      | ADMIN |

  @56729 @samgovRegistration
  Scenario Outline: Validate whether all users have view access to SAM.Gov Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SAM.gov Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to url "https://www.sam.gov/SAM/"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56730 @contactUs
  Scenario Outline: Validate whether all users have view access to Contactview
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    Then I softly can see page block "Contact GovGrants"
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
    When I click on "Edit" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---" without waiting for record
    And I enter "Edition" values from "SubrecipientOrganization_Field_Values"
    When I click on "Save" in the page details
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56733 @internalContactsEdition @smoke
  Scenario Outline: Validate whether all Internal Users can edit the Contacts
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "flexTableRandomID" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "flexTableRandomID" without waiting for record
    And I enter "Edition1" values from "InternalContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "flexTableRandomID" panel
    Then I see value "Active" for title "Status" inside table "flexTableRandomID"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56719 @56734 @subrecipientContactsCreateEdit @smoke
  Scenario Outline: Verifying if the Internal Users has create and Edit access to Subrecipient Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---" without waiting for record
    Then I softly see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I click modal button "Edit"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see value "New" for title "Status" inside table "---home:-:internalContactTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56735 @smereviewersContactEdition
  Scenario Outline: Verifying all Internal Users has Edit access to SME Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    When I enter "Edition" values from "PotentialContact_Field_values.xlsx"
    And I click modal button "Save"
    Then I see value "New" for title "Status" inside table "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56736 @56737 @additionalAddressesCreationEdition
  Scenario: Validate whether ADMIN can Create and Edition of Additional Addresses
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
    And I click on "Edit" icon for "Billing Address" inside flex table with id "---home:-:additionalAddressTableId---" without waiting for record
    And I enter "AdditioanlAddressesEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    Then I softly see that "Test Automation Organization" is in "Active" status

  @56739 @56907 @relatedContactsCreationEdition
  Scenario Outline: The Internal Users should be able to Create and Edit Related Contacts
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:relatedContactsTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:relatedContactsTableId---"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:relatedContactsTableId---" without waiting for record
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
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:relatedContactsTableId---" panel
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:relatedContactsTableId---" without waiting for record
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:relatedContactsTableId---" panel
    Then I see "No Records Found" inside flex table with id "---home:-:relatedContactsTableId---"

  @56740 @56741 @56742 @dunsNumberCreationEditionAndDeletion @smoke @bug-69292
  Scenario Outline: Validate whether ADMIN and DA users can Create, Edit and delete the DUNS Number
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I enter the following values into flex table with id "---home:-:dunsTableId---" by clicking "New" :
      | DUNS Number | Entity Name as Registered       | Location |
      | 138047990   | Automation Runtime Contact Name | HernNdon |
    Then I softly see values "138047990" and "HernNdon" inside table
    When I click on "Edit" icon for "138047990" inside flex table with id "---home:-:dunsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---home:-:dunsTableId---"
    Then I softly see values "138047990" and "HernNdon" inside table
    When I click on "delete" icon for "138047990" inside flex table with id "---home:-:dunsTableId---" without waiting for record
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
    When I click on "Delete" icon for "New IDC" inside flex table with id "---home:-:indirectRateFlextableId---" without waiting for record
    Then I do not see values "New IDC" and "Title" inside table

  @56883 @56912 @adminOrPMEditAccessToOwnOrgInternalOrganizationPageHeader @bug-77017
  Scenario Outline: Validate whether Users with Admin/ PM profiles can edit their own organizations and Internal organization page has Header
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    Then I softly can see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I softly see that "Internal Organization" is in "Active" status
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

  @57344 @57345 @homePendingTaskCompletedAndTaskCount
  Scenario: Validate whether user is able to view the total count of pending Tasks assigned to user and Pending Task and Completed Task on the left Navigation shows Pending Tasks across all the Modules
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
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---home:-:associateContactsTableId---"
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
      | Responsibility     | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I softly see values "Approve Program" and "Not Started" inside table
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---" without waiting for record
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
    Then I see values "234567891" and "123456788" inside table
    Examples:
      | User  |
      | ADMIN |

  @73851 @73856 @73850 @57347 @57348 @viewActiveGrantsSubmittedApplicationsOnRelatedLog
  Scenario Outline: Verify all profiles users should be able to view the Submitted Applications and Active Grants.
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - Open"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Application}" for title "Title" inside table "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    Then I softly see field "Opportunity" as "{SavedValue:Automation Runtime Announcement for Application}"
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
    When I click on "Edit" icon for "{SavedValue:SPI Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---" without waiting for record
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---" without waiting for record
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---" without waiting for record
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name                      | Project Role             | Is Key Contact |
      | {SavedValue:SPI Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Application}" in "---home:-:SubmittedApplicationTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement for Application}" in flex table with id "---home:-:SubmittedApplicationTableId---"
    When I perform quick search for "{SavedValue:Automation Runtime Award Record}" in "---home:-:RelatedLogGrantsTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Award Record}" in flex table with id "---home:-:RelatedLogGrantsTableId---"
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

  @58245 @verifyReassignFunctionality @reassign @smoke
  Scenario: The Reassign on the left Navigation allows the reassignment of tasks.
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
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
      | Responsibility     | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Reassign" content inside "My Tasks" subheader on left panel
    When I reassign task to "{SavedValue:EXE Username}"
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
    When I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "{SavedValue:EXE Username}cution Focus Area" into field "Title__c"
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
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name                      | Description                 |
      | Program Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver  | {SavedValue:FO Username}  | Automation Test Description |
    And I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I refresh the page
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---home:-:externalPendingTasktableId---"

  @62106 @indUserEditProfile @deepika
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
    And I perform quick search for "{SavedValue:ProgramID}" in "Program__c" panel
    Then I see value "{SavedValue:ProgramID}" for title "EGMS ID" inside table "Program__c"

  @62912 @VerifyrecentlyViewedRecordAndDetailsOnMiniPageLayoutAndHoverLink @keerti @wip
  Scenario: The Internal User should be able to view the recently viewed record and details on the Mini pagelayout and the hover link  will take to the record
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I navigate to "Planning" tab
    And I mouse hover to link contains "Test Automation Organization"
    Then I softly see page title contains as "Test Automation Organization"

  @62911 @VerifyStatusIsNewForInvitation/BulkInvitationISentStatusChanges @keerti
  Scenario Outline: Validate once Contact has registered the status will be New , when the Invitation/Bulk Invitation is sent, the status changes from Invitation Sent
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I click "Send" button in modal
    When I close "Send Invitation" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    Then I see value "Invitation Sent" for title "Status" inside table "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @33882 @34674 @validatingcreateSMEReviewer @meenakshi
  Scenario: To verify internal user able to Create new SME reviewer
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    #33882
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Contact}" for title "Full Name" inside table "---home:-:reviewersTableId---"
    Then I softly see value "automation.sme@yopmail.com" for title "Email" inside table "---home:-:reviewersTableId---"
    Then I softly see value "New" for title "Status" inside table "---home:-:reviewersTableId---"
    Then I softly see value "Test Automation Organization" for title "Sponsoring Agency" inside table "---home:-:reviewersTableId---"
    #34674
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I wait for "2" seconds
    And I enter value "Test Automation Description" in email body
    And I click "Send" button in modal
    Then I see the following messages in the page details :
      | Email Sent Successfully |