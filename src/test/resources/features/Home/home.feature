@home @regression
Feature: Validate all scenarios in the home tab

  @35024 @internalOrganizationCreate @smoke @nonFunctional
  Scenario: Verifying if the Admin has create access to Internal Organization
    Given I delete the record "Product Automation permanent Orgtn" from the object "ACCOUNT"
    Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "---home:-:organizationId---"
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status

  @35637 @internalOrganizationAdminEdit @nonFunctional
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

  @56708 @internalOrganizationView
  Scenario Outline: Validate whether all users have view access to Internal Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56709 @internalOrganizationADMINEdit
  Scenario: Validate system allows Edit access to Internal Organizations to the ADMIN/DA
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    Then I see that "Internal Organization" is in "Active" status

  @56710 @internalOrganizationPMView
  Scenario: Verify whether the PM profiles can Edit their own Organizations
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Department of Health" in "---home:-:internalOrganizationId---" panel
    Then I can see row level action button "View" against "Department of Health" in flex table with id "---home:-:internalOrganizationId---"

  @56712 @subrecipientOrganizationView
  Scenario Outline: Validate whether all users have view access to Subrecipient Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56713 @activeSubrecipientOrganizationsView
  Scenario Outline: Validate whether all users have view access to Active Individual Subrecipients
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Ind" in "ActiveAccountIndApplicant" panel
    And I click on "View" icon for "Automation Ind" inside flex table with id "ActiveAccountIndApplicant"
    Then I see that "Automation Ind" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56714 @activeIndividualSubrecipientsEdit
  Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Individual Subrecipients
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Ind" in "ActiveAccountIndApplicant" panel
    Then I can see row level action button "Edit" against "Automation Ind" in flex table with id "ActiveAccountIndApplicant"
    Examples:
      | User  |
      | ADMIN |

  @56715 @activeSubrecipientOrganizationsEdit
  Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Subrecipient Organizations
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    Then I can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---home:-:subrecipientActiveAccountId---"
    Examples:
      | User  |
      | ADMIN |

  @56716 @internalContactsView
  Scenario Outline: Validate whether all users have view access to Contacts
    Given I delete the record "Automation PO" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I perform quick search for "Automation PO" in "---home:-:subrecipientContactTableId---" panel
    And I click on "View" icon for "Automation PO" inside flex table with id "---home:-:subrecipientContactTableId---"
    Then I see field "Organization" as "Test Automation Organization"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56717 @internalContactsCreate @smoke
  Scenario Outline: Verify that Internal contacts are accessible across agencies and can be created by any Internal user
    Given I delete the record "Automation PO" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I perform quick search for "Automation PO" in "flexTableRandomID" panel
    Then I can see row level action button "View" against "Automation PO" in flex table with id "flexTableRandomID"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56718 @internalContactsEdit
  Scenario Outline: Validate system allows edit access to Contacts to all Internal Users
    Given I delete the record "Automation PO" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I perform quick search for "Automation PO" in "---home:-:subrecipientContactTableId---" panel
    Then I can see row level action button "Edit" against "Automation PO" in flex table with id "---home:-:subrecipientContactTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56719 @subrecipientContactsCreate @smoke
  Scenario Outline: Verifying if the Internal Users has create access to Subrecipient Contact
    Given I delete the record "Automation Manager" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I click on "View" icon for "Automation Manager" inside flex table with id "---home:-:subrecipientContactTableId---"
    Then I see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56720 @smeReviewersContactView
  Scenario Outline: Verifying all Internal Users has View access to SME Reviewers Contact
    Given I delete the record "Automation SME" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I perform quick search for "Automation SME" in "---home:-:reviewersTableId---" panel
    Then I can see row level action button "View" against "Automation SME" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56721 @smeReviewersContactCreate
  Scenario Outline: Verifying all Internal Users has Create access to reviewers contact
    Given I delete the record "Automation SME" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    Then I see values "Automation SME" and "New" inside table
    Examples:
      | User  |
      | ADMIN |

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
    And I navigate to "SME ---home:-:reviewersTableId---" content inside "Contacts" subheader on left panel
    Then I can see row level action button "View" against "Automation SME" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56724 @termsandConditionsView
  Scenario Outline: Verifying all Internal Users has View access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "New" modal by clicking the top right x button
    When I perform quick search for "TC-5885" in "---home:-:termsAndConditionsTableId---" panel
    Then I can see row level action button "View" against "TC-5885" in flex table with id "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56725 @termsAndConditionsCreate @smoke
  Scenario Outline: Verifying if the ADMIN/DA has create access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "New" modal by clicking the top right x button
    When I perform quick search for "AutomationT&C" in "---home:-:termsAndConditionsTableId---" panel
    Then I see value "Active" for title "Status" against the value "AutomationT&C" inside table "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56726 @termsAndConditionsADMINedit
  Scenario Outline: Verifying if the ADMIN has Edit access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "New" modal by clicking the top right x button
    When I perform quick search for "TC-5885" in "---home:-:termsAndConditionsTableId---" panel
    Then I can see row level action button "Edit" against "TC-5885" in flex table with id "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56727 @einRegistrationView
  Scenario Outline: Validate whether all users have view access to EIN Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56728 @dunsRegistrationView
  Scenario Outline: Validate whether all users have view access to DUNS Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "DUNS Registration" content inside "Useful Links" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56729 @samgovRegistrationView
  Scenario Outline: Validate whether all users have view access to SAM.gov Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "SAM.gov Registration" content inside "Useful Links" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56730 @contactUsView
  Scenario Outline: Validate whether all users have view access to Contact Us
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
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
    When I click on "Edit" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    And I enter "Edition" values from "SubrecipientOrganization_Field_Values"
    When I click on "Save" in the page details
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56733 @internalContactsEdition @smoke
  Scenario Outline: Validate whether all Internal Users can edit the
    Given I delete the record "Automation PO" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
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

  @56734 @subrecipientContactsEdition
  Scenario Outline: Verifying if the Internal Users has Edit access to Subrecipient Contact
    Given I delete the record "Automation Manager" from the object "Contact"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I click on "Edit" icon for "Automation Manager" inside flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I perform quick search for "Automation Manager" in "---home:-:subrecipientContactTableId---" panel
    Then I see value "New" for title "Status" inside table "---home:-:subrecipientContactTableId---"
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

  @56736 @additionalAddressesCreation  @smoke
  Scenario Outline: Validate whether ADMIN can Create the Additional Addresses
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditionalAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "New" modal by clicking the top right x button
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56737 @additionalAddressesEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Additional Addresses
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditionalAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close "New" modal by clicking the top right x button
    When I perform quick search for "Billing Address" in "---home:-:additionalAddressTableId---" panel
    And I click on "Edit" icon for "Billing Address" inside flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditioanlAddressesEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see that "Test Automation Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56907 @relatedContactsCreation  @smoke
  Scenario: Validate whether ADMIN and DA users can Create the Related Contact
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
    Then I see values "Automation Contact" and "Active" inside table

  @56738 @relatedContactsEdition
  Scenario Outline: The Internal Users should be able to Edit Related Contacts
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
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User |
      | EXE  |
      | PM   |

  @56739 @deleterelatedContacts
  Scenario Outline: Validate whether ADMIN and DA users can Delete the Related Contact
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
    Then I do not see value "Automation Contact" for title "Full Name" inside table "---home:-:relatedContactsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56740 @dunsNumberCreation  @smoke
  Scenario Outline: Validate whether ADMIN and DA users can create the DUNS Number
    Given I delete the record "Test Automation Organization" from the object "DUNS"
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I enter the following values into flex table with id "---home:-:dunsTableId---" by clicking "New" :
      | DUNS Number | Registered Entity Name | Location |
      | 123456789   | Test132                | HernNdon |
    Then I see values "123456789" and "HernNdon" inside table
    Examples:
      | User |
      | PM   |

  @56741 @dunsNumberEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the DUNS NUmber
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    When I enter the following values into flex table with id "---home:-:dunsTableId---" by clicking "New" :
      | DUNS Number | Registered Entity Name | Location |
      | 138047990   | Test132                | HernNdon |
    When I click on "Edit" icon for "138047990" inside flex table with id "---home:-:dunsTableId---"
    And I click on top right button "Save" in flex table with id "---home:-:dunsTableId---"
    Then I see values "138047990" and "HernNdon" inside table
    Examples:
      | User  |
      | ADMIN |

  @56742 @deleteDUNSNumber
  Scenario Outline: Validate whether ADMIN and DA users can delete the DUNS Number
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    When I enter the following values into flex table with id "---home:-:dunsTableId---" by clicking "New" :
      | DUNS Number | Registered Entity Name | Location |
      | 148047990   | Test132                | HernNdon |
    When I click on "delete" icon for "148047990" inside flex table with id "---home:-:dunsTableId---"
    Then I do not see values "148047990" and "DUNSNumber" inside table
    Examples:
      | User  |
      | ADMIN |

  @56743 @deleteIndirectCostRate
  Scenario: Validate whether ADMIN and DA users can delete the Indirect Cost Rates
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I click on top right button "New" in flex table with id "inlineEditGridIndirectRateGrid"
    And I enter "New IDC" values from "InternalOrganization_Field_Values.xlsx"
    When I click modal button "Save"
    And I perform quick search for "New IDC" in "inlineEditGridIndirectRateGrid" panel
    When I click on "Delete" icon for "New IDC" inside flex table with id "inlineEditGridIndirectRateGrid"
    Then I do not see values "New IDC" and "Title" inside table

  @56883 @adminOrPMEditAccessToOwnOrg
  Scenario Outline: Users with Admin/ PM profiles can edit their own organizations.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56911 @foUserCannotEditOrg
  Scenario: Validate whether Fo User Can edit Internal Organizations
    Given I login to "As a Grantor" app as "FO" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Department of Education" in "---home:-:internalOrganizationId---" panel
    Then I cannot see row level action button "Edit" against "Department of Education" in flex table with id "---home:-:internalOrganizationId---"

  @56912 @internalOrganizationPageHeader
  Scenario Outline: Verify that Internal organization page has Header
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    Then I see that "Test Automation Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @57340 @thirdPartyVerification @nonFunctional
  Scenario Outline: Verifying if the Internal Users has Edit access to Subrecipient Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---home:-:subrecipientActiveAccountId---" panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table without waiting for record
    Then I see values "SAM.Gov" and "Entity Validation" inside table
    Examples:
      | User  |
      | ADMIN |

  @57341 @listpageViewChildOrganizations @wip
  Scenario Outline:: Verify system allows access to all Internal users to view the List page
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Department of Education" in "---home:-:internalOrganizationId---" panel
    When I switch to Parent iframe
    And I expand nested table containing column value "Department of Education"
    Then I see values "Teaching and Learning" and "Agency" inside table
    Examples:
      | User  |
      | ADMIN |

  @57342 @agencyBelongsToOneParent
  Scenario Outline: Verify whether an Agency belongs to only one Parent
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Department of Education" in "---home:-:internalOrganizationId---" panel
    Then I see values "Department of Education" and "Executive" inside table
    Examples:
      | User  |
      | ADMIN |

  @57343 @individualSubrecipientContactCreation @wip
  Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Individual Subrecipients
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation SPI" in "ActiveAccountIndApplicant" panel
    When I click on "View" icon for "Automation SPI" inside table without waiting for record
    And I click on top right button "New" in flex table with id "AdditionalAddressInternal"
    And I enter "AdditionalAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    Then I see values "Billing Address" and "VA" inside table
    Examples:
      | User  |
      | ADMIN |

  @57344 @homePendingTask
  Scenario: The Pending Task on the left Navigation shows Pending Tasks across all the Modules
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    And I switch to Parent iframe
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    And I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "HomePendingTasks" panel
    Then I see values "Approve Program" and "Not Started" inside table

  @57345 @homeCompletedTask
  Scenario: The Completed Task on the left Navigation shows Pending Tasks across all the Modules
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    And I switch to Parent iframe
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "HomePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "HomePendingTasks"
    When I click on "Approve" on the approval decision box
    And I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "HomePhaseCompletedTasks" panel
    Then I see values "Approve Program" and "Completed" inside table

  @57346 @subrecipientOrganizationDUNSandEINS
  Scenario Outline: Verify whether the Organization has at least one DUNS Numbers
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    Then I see values "953072483" and "148549041" inside table
    Examples:
      | User  |
      | ADMIN |

  @57347 @viewSubmittedApplicationsOnRelatedLog
  Scenario Outline: Verify all profiles users should be able to view the Submitted Applications.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    And I navigate to "Related Log" sub tab
    Then I can see row level action button "View" against "Automation Application" in flex table with id "RecipientAppReviewList"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @57348 @viewActiveGrantsOnRelatedLog
  Scenario Outline: Verify all profiles users should be able to view the Active Grants.
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    And I navigate to "Related Log" sub tab
    When I perform quick search for "Automation Application" in "ActiveGrantsByOrganization" panel
    Then I can see row level action button "View" against "Automation Application" in flex table with id "RecipientAppReviewList"
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
    When I perform quick search for "Automation Ind" in "ActiveAccountIndApplicant" panel
    Then I can see row level action button "View" against "Automation Ind" in flex table with id "ActiveAccountIndApplicant"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @58245 @reassign
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    And I switch to Parent iframe
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I choose the file "Program_Field_Values.xlsx" to upload for "Checklist" of type "Program"
    When I close "Upload Template" modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Reassign" content inside "My Tasks" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "Approve Program" in "TaskReassignment" panel
    And I click "Reassign Selected" after selection of "Approve Program" in the table "TaskReassignment"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Program" in "HomePendingTasks" panel
    Then I see that "Approve Program" has been added in flextable with Id "HomePendingTasks"

  @59015 @pendingTaskCount
  Scenario: Validate whether user is able to view the total acount of pending Tasks assigned to user
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Add" after selection of "Automation EXE" in the table "---program:-:associateContactsTableId---"
    When I close "Associate" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Add" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I switch to Parent iframe
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI for Regression" in "---program:-:associateKPITableId---" panel
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "---program:-:associateKPITableId---"
    And I switch to Parent iframe
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    Then I see task count for "Planning" phase with the total records of flex table id "PhasePendingTasks"

  @59016 @validateFilesOnHome
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