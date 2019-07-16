@home @regression
Feature: Validate all scenarios in the home tab

  @35024 @internalOrganizationCreate @smoke
  Scenario: Verifying if the Admin has create access to Internal Organization
    Given I delete the record "Product Automation permanent Orgtn" from the object "ACCOUNT"
    Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    And I click on top right button "New" in flex table with id "Organizations"
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status

  @35637 @internalOrganizationAdminEdit
  Scenario Outline: Verifying if the Admin has edit access to Internal Organization
    Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    When I click on "View" icon for "<Organization name>" inside flex table with id "Organizations"
    When I click on "Edit" in the page details
    When I enter value "Automation" into field "Abbreviation__c"
    And I click on "Save" in the page details
    Then I see that "Internal Organization" is in "Created" status
    Examples:
      | Organization name                     |
      | Internal Automation Organization Test |

  @35024 @internalOrganizationView
  Scenario Outline: Validate whether all users have view access to Internal Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I click on "View" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @internalOrganizationADMINEdit
  Scenario Outline: Validate system allows Edit access to Internal Organizations to the ADMIN/DA
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    Then I can see row level action button "Edit" against "Test Automation Organization" in flex table with id "inlineEditGridInternalOrganizationHierarchy"
    Examples:
      | User  |
      | ADMIN |

  @internalOrganizationPMView
  Scenario: Verify whether the PM profiles can Edit their own Organizations
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    When I perform quick search for "Department of Health" in "inlineEditGridInternalOrganizationHierarchy" panel
    Then I can see row level action button "View" against "Department of Health" in flex table with id "inlineEditGridInternalOrganizationHierarchy"

  @subrecipientOrganizationView
  Scenario Outline: Validate whether all users have view access to Subrecipient Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    And I click on "View" icon for "Bankers Small Business Community Development Corporation Of California" inside flex table with id "ActiveAccount"
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @activeSubrecipientOrganizationsView
  Scenario Outline: Validate whether all users have view access to Active Individual Subrecipients
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Pankaj Nelli" in "ActiveAccountIndApplicant" panel
    And I click on "View" icon for "Pankaj Nelli" inside flex table with id "ActiveAccountIndApplicant"
    Then I see that "Individual Subrecipient" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @activeIndividualSubrecipientsEdit
  Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Individual Subrecipients
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Pankaj Nelli" in "ActiveAccountIndApplicant" panel
    Then I can see row level action button "Edit" against "Pankaj Nelli" in flex table with id "ActiveAccountIndApplicant"
    Examples:
      | User  |
      | ADMIN |

  @activeSubrecipientOrganizationsEdit
  Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Subrecipient Organizations
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Bankers Small Business Community Development Corporation Of California" in "ActiveAccount" panel
    Then I can see row level action button "Edit" against "Bankers Small Business Community Development Corporation Of California" in flex table with id "ActiveAccount"
    Examples:
      | User  |
      | ADMIN |

  @internalContactsView
  Scenario Outline: Validate whether all users have view access to Contacts
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation Contact" in "flexTableRandomID" panel
    And I click on "View" icon for "Automation Contact" inside flex table with id "flexTableRandomID"
    Then I see field "Organization" as "Test Automation Organization"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @internalContactsCreate @smoke
  Scenario Outline: Verify that Internal contacts are accessible across agencies and can be created by any Internal user
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "flexTableRandomID"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I close Modal
    When I perform quick search for "Automation PO" in "flexTableRandomID" panel
    Then I can see row level action button "View" against "Automation PO" in flex table with id "flexTableRandomID"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @internalContactsEdit
  Scenario Outline: Validate system allows edit access to Contacts to all Internal Users
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation PO" in "flexTableRandomID" panel
    Then I can see row level action button "Edit" against "Automation PO" in flex table with id "flexTableRandomID"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @subrecipientContactsCreate @smoke
  Scenario Outline: Verifying if the Internal Users has create access to Subrecipient Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "flexTableRandomID"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click modal button "Save"
    When I click on "View" icon for "Automation Manager" inside flex table with id "flexTableRandomID"
    Then I see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @smeReviewersContactView
  Scenario Outline: Verifying all Internal Users has View access to SME Reviewers Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "Mark Bellinger" in "Reviewers" panel
    Then I can see row level action button "View" against "Mark Bellinger" in flex table with id "Reviewers"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @smeReviewersContactCreate @wip
  Scenario Outline: Verifying all Internal Users has Create access to SME Reviewers Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "Reviewers"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    Then I see values "Automation SME" and "New" inside table
    Examples:
      | User  |
      | ADMIN |

  @smeReviewersContactSendInviatation
  Scenario Outline: Verify the system allows all Internal users to Send Invitation to SME Reviewer
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on "Send Invitation" icon for "Automation SME" inside flex table with id "Reviewers"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @activeSMEReviewersContactDetailPageView
  Scenario Outline: Verify that system allows user to see the detail page of Active SME Reviewer contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    Then I can see row level action button "View" against "Smiley SME" in flex table with id "ActiveAccountReviewer"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @termsandConditionsView
  Scenario Outline: Verifying all Internal Users has View access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
    When I perform quick search for "TC-5885" in "MasterTermConditions" panel
    Then I can see row level action button "View" against "TC-5885" in flex table with id "MasterTermConditions"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @termsAndConditionsCreate @smoke
  Scenario Outline: Verifying if the ADMIN/DA has create access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
    When I click on top right button "New" in flex table with id "MasterTermConditions"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    And I close modal by clicking the top right x button
    When I perform quick search for "AutomationT&C" in "MasterTermConditions" panel
    Then I see value "Active" for title "Status" against the value "AutomationT&C" inside table "MasterTermConditions"
    Examples:
      | User  |
      | ADMIN |

  @termsAndConditionsADMINedit
  Scenario Outline: Verifying if the ADMIN has Edit access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
    When I perform quick search for "TC-5885" in "MasterTermConditions" panel
    Then I can see row level action button "Edit" against "TC-5885" in flex table with id "MasterTermConditions"
    Examples:
      | User  |
      | ADMIN |

  @einRegistrationView
  Scenario Outline: Validate whether all users have view access to EIN Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @dunsRegistrationView
  Scenario Outline: Validate whether all users have view access to DUNS Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "DUNS Registration" content inside "Useful Links" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @samgovRegistrationView
  Scenario Outline: Validate whether all users have view access to SAM.gov Registration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "SAM.gov Registration" content inside "Useful Links" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @contactUsView
  Scenario Outline: Validate whether all users have view access to Contact Us
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    Then I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @editInternalOrganization @smoke
  Scenario Outline: Validate whether ADMIN users can Edit the Internal Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    And I enter "Edition" values from "InternalOrganization_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @subrecipientOrganizationEdition @smoke
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Subrecipient Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    And I perform quick search for "GROUNDWORK SAN DIEGO-CHOLLAS CREEK" in "ActiveAccount" panel
    When I click on "Edit" icon for "GROUNDWORK SAN DIEGO-CHOLLAS CREEK" inside flex table with id "ActiveAccount"
    And I enter "Edition" values from "SubrecipientOrganization_Field_Values"
    When I click on "Save" in the page details
    Then I see that "Subrecipient Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @internalContactsEdition @smoke
  Scenario Outline: Validate whether all Internal Users can edit the Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I perform quick search for "Automation Contact" in "flexTableRandomID" panel
    When I click on "Edit" icon for "Automation Contact" inside flex table with id "flexTableRandomID"
    And I enter "Edition1" values from "InternalContact_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    And I perform quick search for "Automation Contact" in "flexTableRandomID" panel
    Then I see value "Active" for title "Status" inside table "flexTableRandomID"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @subrecipientContactsEdition
  Scenario Outline: Verifying if the Internal Users has Edit access to Subrecipient Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation Manager" in "flexTableRandomID" panel
    When I click on "Edit" icon for "Automation Manager" inside flex table with id "flexTableRandomID"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I perform quick search for "Automation Manager" in "flexTableRandomID" panel
    Then I see that "Automation Manage" is in "New" status
    #Then I see value "New" for title "Status" inside table "flexTableRandomID"
    Examples:
      | User  |
      | ADMIN |

  @smeReviewersContactEdition @wip
  Scenario Outline: Verifying all Internal Users has Edit access to SME Reviewers Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "Automation SME1" in "Reviewers" panel
    And I click on "Edit" icon for "Automation SME1" inside flex table with id "Reviewers"
    When I enter "Edition" values from "PotentialReviewersContact_Field_values.xlsx"
    And I click modal button "Save"
    Then I see value "New" for title "Status" inside table "Reviewers"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @additionalAddressesCreation  @smoke
  Scenario Outline: Validate whether ADMIN can Create the Additional Addresses
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    And I click on top right button "New" in flex table with id "AdditionalAddressInternal"
    And I enter "AdditionalAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @additionalAddressesEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Additional Addresses
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    When I perform quick search for "Billing Address" in "AdditionalAddressInternal" panel
    And I click on "Edit" icon for "Billing Address" inside flex table with id "AdditionalAddressInternal"
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
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    And I click on top right button "New" in flex table with id "RelatedContacts"
    And I enter "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I perform quick search for "Automation Contact" in "RelatedContacts" panel
    Then I see values "Automation Contact" and "Active" inside table
    Examples:
      | User  |
      | ADMIN |

  @relatedContactsEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the Related Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    When I perform quick search for "Automation Contact" in "RelatedContacts" panel
    And I click on "Edit" icon for "Automation Contact" inside flex table with id "RelatedContacts"
    When I enter "RelatedContactsEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    When I close Modal
    And I click on "Save" in the page details
    Then I see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

  @deleteRelatedContacts
  Scenario Outline: Validate whether ADMIN and DA users can Delete the Related Contact
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    When I perform quick search for "Automation Contact" in "RelatedContacts" panel
    And I click on "Delete" icon for "Automation Contact" inside flex table with id "RelatedContacts"
    Then I do not see value "Automation Contact" for title "Full Name" inside table "RelatedContacts"
    Examples:
      | User  |
      | ADMIN |

  @dunsNumberCreation  @smoke
  Scenario Outline: Validate whether ADMIN and DA users can create the DUNS Number
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    When I enter the following values into flex table with id "flexGridRelatedDUNS" by clicking "New" :
      | DUNS Number | Registered Entity Name | Location |
      | 138038990   | Test132                | HernNdon |
    And I click on top right button "Save" in flex table with id "flexGridRelatedDUNS"
    Then I see values "138038990" and "DUNSNumber" inside table
    Examples:
      | User  |
      | ADMIN |

  @dunsNumberEdition
  Scenario Outline: Validate whether ADMIN and DA users can Edit the DUNS NUmber
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    And I perform quick search for "128038790" in "flexGridRelatedDUNS" panel
    When I click on "Edit" icon for "128038790" inside flex table with id "flexGridRelatedDUNS"
    And I click on top right button "Save" in flex table with id "flexGridRelatedDUNS"
    Then I see values "128038790" and "DUNSNumber" inside table
    Examples:
      | User  |
      | ADMIN |

  @deleteDUNSNumber
  Scenario Outline: Validate whether ADMIN and DA users can delete the DUNS Number
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "Edit" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    And I perform quick search for "128038799" in "flexGridRelatedDUNS" panel
    When I click on "delete" icon for "128038799" inside flex table with id "flexGridRelatedDUNS"
    Then I do not see values "128038799" and "DUNSNumber" inside table
    Examples:
      | User  |
      | ADMIN |

  @deleteIndirectCostRate
  Scenario Outline: Validate whether ADMIN and DA users can delete the Indirect Cost Rates
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Test Automation Organization" in "inlineEditGridInternalOrganizationHierarchy" panel
    When I click on "View" icon for "Test Automation Organization" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
    And I perform quick search for "New IDC" in "inlineEditGridIndirectRateGrid" panel
    When I click on "Delete" icon for "New IDC" inside flex table with id "inlineEditGridIndirectRateGrid"
    Then I do not see values "New IDC" and "Title" inside table
    Examples:
      | User  |
      | ADMIN |
	