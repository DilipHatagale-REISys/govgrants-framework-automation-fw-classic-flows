@home @regression
Feature: Validate all scenarios in the home tab

  @35024 @internalOrganizationCreate @smoke
  Scenario: Verifying if the Admin has create access to Internal Organization
    Given I delete the record "Product Automation permanent Orgtn" from the object "ACCOUNT"
    Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "---home:-:organizationId---"
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status

  @35637 @internalOrganizationAdminEdit
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
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User   |
      | PM     |
      | EXE   |
      | ADMIN |

  @56709 @internalOrganizationADMINEdit
  Scenario Outline: Validate system allows Edit access to Internal Organizations to the ADMIN/DA
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

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
    When I perform quick search for "Automation SPI" in "---home:-:subrecipientActiveAccountId---IndApplicant" panel
    And I click on "View" icon for "Automation SPI" inside flex table with id "---home:-:subrecipientActiveAccountId---IndApplicant"
    Then I see that "Individual Subrecipient" is in "Active" status
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
    When I perform quick search for "Automation SPI" in "---home:-:subrecipientActiveAccountId---IndApplicant" panel
    Then I can see row level action button "Edit" against "Automation SPI" in flex table with id "---home:-:subrecipientActiveAccountId---IndApplicant"
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
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
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
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    When I perform quick search for "Automation PO" in "---home:-:subrecipientContactTableId---" panel
    Then I can see row level action button "View" against "Automation PO" in flex table with id "---home:-:subrecipientContactTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56718 @internalContactsEdit
  Scenario Outline: Validate system allows edit access to Contacts to all Internal Users
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation PO" in "---home:-:subrecipientContactTableId---" panel
    Then I can see row level action button "Edit" against "Automation PO" in flex table with id "---home:-:subrecipientContactTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56719 @subrecipientContactsCreate @smoke
  Scenario Outline: Verifying if the Internal Users has create access to Subrecipient Contact
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
  Scenario Outline: Verifying all Internal Users has View access to SME ---home:-:reviewersTableId--- Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME ---home:-:reviewersTableId---" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation Contact" in "---home:-:reviewersTableId---" panel
    Then I can see row level action button "View" against "Automation Contact" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56721 @smeReviewersContactCreate 
  Scenario Outline: Verifying all Internal Users has Create access to SME ---home:-:reviewersTableId--- Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME ---home:-:reviewersTableId---" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "Potential---home:-:reviewersTableId---Contact_Field_Values.xlsx"
    When I click modal button "Save"
    Then I see values "Automation SME" and "New" inside table
    Examples:
      | User  |
      | ADMIN |

  @56722 @smeReviewersContactSendInvitation
  Scenario Outline: Verify the system allows all Internal users to Send Invitation to SME Reviewer
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME ---home:-:reviewersTableId---" content inside "Contacts" subheader on left panel
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
    When I navigate to "Home" tab
    And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
    When I perform quick search for "TC-5885" in "---home:-:termsAndConditionsTableId---" panel
    Then I can see row level action button "View" against "TC-5885" in flex table with id "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56725 @termsAndConditionsCreate @smoke
  Scenario Outline: Verifying if the ADMIN/DA has create access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    And I close modal by clicking the top right x button
    When I perform quick search for "AutomationT&C" in "---home:-:termsAndConditionsTableId---" panel
    Then I see value "Active" for title "Status" against the value "AutomationT&C" inside table "---home:-:termsAndConditionsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56726 @termsAndConditionsADMINedit
  Scenario Outline: Verifying if the ADMIN has Edit access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
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

  @56731 @editInternalOrganization @smoke
  Scenario Outline: Validate whether ADMIN users can Edit the Internal Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    And I enter "Edition" values from "InternalOrganization_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56732 @subrecipientOrganizationEdition @smoke
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Subrecipient Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    And I perform quick search for "GROUNDWORK SAN DIEGO-CHOLLAS CREEK" in "---home:-:subrecipient---home:-:subrecipientActiveAccountId---Id---" panel
    When I click on "Edit" icon for "GROUNDWORK SAN DIEGO-CHOLLAS CREEK" inside flex table with id "---home:-:subrecipientActiveAccountId---"
    And I enter "Edition" values from "SubrecipientOrganization_Field_Values"
    When I click on "Save" in the page details
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56733 @internalContactsEdition @smoke
  Scenario Outline: Validate whether all Internal Users can edit the Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I perform quick search for "Automation Contact" in "---home:-:subrecipientContactTableId---" panel
    When I click on "Edit" icon for "Automation Contact" inside flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Edition1" values from "InternalContact_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    And I perform quick search for "Automation Contact" in "---home:-:subrecipientContactTableId---" panel
    Then I see value "Active" for title "Status" inside table "---home:-:subrecipientContactTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56734 @subrecipientContactsEdition
  Scenario Outline: Verifying if the Internal Users has Edit access to Subrecipient Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation Manager" in "---home:-:subrecipientContactTableId---" panel
    When I click on "Edit" icon for "Automation Manager" inside flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I perform quick search for "Automation Manager" in "---home:-:subrecipientContactTableId---" panel
    Then I see that "Automation Manage" is in "New" status
    Examples:
      | User  |
      | ADMIN |

  @56735 @sme---home:-:reviewersTableId---ContactEdition 
  Scenario Outline: Verifying all Internal Users has Edit access to SME ---home:-:reviewersTableId--- Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME ---home:-:reviewersTableId---" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation SME1" in "---home:-:reviewersTableId---" panel
    And I click on "Edit" icon for "Automation SME1" inside flex table with id "---home:-:reviewersTableId---"
    When I enter "Edition" values from "Potential---home:-:reviewersTableId---Contact_Field_values.xlsx"
    And I click modal button "Save"
    Then I see value "New" for title "Status" inside table "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56736 @additionalAddressesCreation  @smoke
  Scenario Outline: Validate whether ADMIN can Create the Additional Addresses
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    And I click on top right button "New" in flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditionalAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56737 @additionalAddressesEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Additional Addresses
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    When I perform quick search for "Billing Address" in "---home:-:additionalAddressTableId---" panel
    And I click on "Edit" icon for "Billing Address" inside flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditioanlAddressesEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @relatedContactsCreation  @smoke
  Scenario Outline: Validate whether ADMIN and DA users can Create the Related Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter "---home:-:relatedContactsTableId---Creation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I perform quick search for "Automation Contact" in "---home:-:relatedContactsTableId---" panel
    Then I see values "Automation Contact" and "Active" inside table
    Examples:
      | User  |
      | ADMIN |

  @56738 @relatedContactsEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Related Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    When I perform quick search for "Automation Contact" in "---home:-:relatedContactsTableId---" panel
    And I click on "Edit" icon for "Automation Contact" inside flex table with id "---home:-:relatedContactsTableId---"
    When I enter "---home:-:relatedContactsTableId---Edition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    And I click on "Save" in the page details
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @56739 @delete---home:-:relatedContactsTableId---
  Scenario Outline: Validate whether ADMIN and DA users can Delete the Related Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    When I perform quick search for "Automation Contact" in "---home:-:relatedContactsTableId---" panel
    And I click on "Delete" icon for "Automation Contact" inside flex table with id "---home:-:relatedContactsTableId---"
    Then I do not see value "Automation Contact" for title "Full Name" inside table "---home:-:relatedContactsTableId---"
    Examples:
      | User  |
      | ADMIN |

  @56740 @dunsNumberCreation  @smoke
  Scenario Outline: Validate whether ADMIN and DA users can create the DUNS Number
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    When I enter the following values into flex table with id "---home:-:dunsTableId---" by clicking "New" :
      | DUNS Number | Registered Entity Name | Location |
      | 138038990   | Test132                | HernNdon |
    And I click on top right button "Save" in flex table with id "---home:-:dunsTableId---"
    Then I see values "138038990" and "DUNSNumber" inside table
    Examples:
      | User  |
      | ADMIN |

  @56741 @dunsNumberEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the DUNS NUmber
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    And I perform quick search for "128038790" in "---home:-:dunsTableId---" panel
    When I click on "Edit" icon for "128038790" inside flex table with id "---home:-:dunsTableId---"
    And I click on top right button "Save" in flex table with id "---home:-:dunsTableId---"
    Then I see values "128038790" and "DUNSNumber" inside table
    Examples:
      | User  |
      | ADMIN |

  @56742 @deleteDUNSNumber
  Scenario Outline: Validate whether ADMIN and DA users can delete the DUNS Number
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    And I perform quick search for "128038799" in "---home:-:dunsTableId---" panel
    When I click on "delete" icon for "128038799" inside flex table with id "---home:-:dunsTableId---"
    Then I do not see values "128038799" and "DUNSNumber" inside table
    Examples:
      | User  |
      | ADMIN |

  @56743 @deleteIndirectCostRate
  Scenario Outline: Validate whether ADMIN and DA users can delete the Indirect Cost Rates
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "---home:-:internalOrganizationId---" panel
    When I switch to iframe with id "iframeFlexGridSearch"
    When I click on "View" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---"
    And I perform quick search for "New IDC" in "inlineEditGridIndirectRateGrid" panel
    When I click on "Delete" icon for "New IDC" inside flex table with id "inlineEditGridIndirectRateGrid"
    Then I do not see values "New IDC" and "Title" inside table
    Examples:
      | User  |
      | ADMIN |

   @56744 @createCases @deepika
   Scenario Outline: Verify all Internal / External Users should be able to create the Cases
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Manage Cases" content inside "Technical Support" subheader on left panel
    When I click on top right button "New" in flex table with id "CaseList"
    And I enter "CaseCreation" values from "HomeCases_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see that "Case Creation" is in "Tier 1 Support - Pending Assignment" status
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |
   
   @56745 @editionCases @deepika
   Scenario Outline: Verify all Internal / External Users should be able to Edit the Cases
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Manage Cases" content inside "Technical Support" subheader on left panel
    And I perform quick search for "Case Creation" in "inlineEditGridIndirectRateGrid" panel
    When I click on "Delete" icon for "New IDC" inside flex table with id "CaseList"
    And I enter "CaseEdition" values from "HomeCases_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "Case Creation" is in "Tier 1 Support - Pending Assignment" status
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |
	