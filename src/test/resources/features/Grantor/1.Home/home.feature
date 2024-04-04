@home @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios in the home tab

  @56710 @56708 @internalOrganizationViewADMINEditPMView @smoke
  Scenario Outline: Validate whether all users have view access to Internal Organization
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    Then I softly can see row level action button "View" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    Then I softly can see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I softly see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |
      | PM    |
      | EXE   |

  @56709 @ValidateViewEditAccessOfInternalOrganization @smoke
  Scenario Outline: Validate system allows Edit access to Internal Organizations to the ADMIN/DA
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    Then I softly can see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    Then I softly see that "Internal Organization" is in "Active" status
    Examples:
      | User  |
      | ADMIN |

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
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Internal Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:internalContactTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---" without waiting for record
    Then I softly see field "Organization" as "Test Automation Organization"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
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
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Potential Reviewer Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    Then I see value "{SavedValue:Automation Runtime Contact}" for title "Full Name" inside table "---home:-:reviewersTableId---"
    Then I see value "New" for title "Status" inside table "---home:-:reviewersTableId---"
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
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Potential Reviewer Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I enter value "Test Automation Description" in email body
    And I click "Send" button in modal
    Then I see the following messages in the page details :
      | Email Sent Successfully |

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
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Potential Reviewer Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:reviewersTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @56725 @56724 @56726 @termsandConditionsViewCreateAdminEdit @smoke
  Scenario Outline: Verifying all Internal Users has View, Create and Edit access to Terms and Conditions
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I close "Create Terms and Conditions" modal by clicking the top right x button
    When I perform quick search for "{SavedValue:EGMSID}" in "---home:-:termsAndConditionsTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
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

  @56728 @UEIRegistration
  Scenario Outline: Validate whether ADMIN have view access to DUNSRegistration
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "UEI Registration" content inside "Useful Links" subheader on left panel
    Then I navigate to url "https://sam.gov/content/entity-registration"
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

  @56733 @internalContactsEdition @smoke @wip
  Scenario Outline: Validate whether all Internal Users can edit the Contacts
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:internalContactTableId---"
    And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
    When I click modal button "Save"
    #And I close "Create Internal Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---" without waiting for record
    And I enter "Edition1" values from "InternalContact_Field_Values.xlsx"
    And I click modal button "Save"
    #And I close "Edit" modal by clicking the top right x button
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    Then I see value "Active" for title "Status" inside table "---home:-:internalContactTableId---"
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
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Subrecipient Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:internalContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:internalContactTableId---" without waiting for record
    Then I softly see field "Organization" as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I click modal button "Edit"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
#    And I close "View Subrecipient Contacts" modal by clicking the top right x button
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
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Potential Reviewer Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
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
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:additionalAddressTableId---"
    And I enter "AdditioanlAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    #And I close "New Additional Address" modal by clicking the top right x button
    Then I softly see that "Internal Organization" is in "Active" status
    And I click on "Edit" icon for "Billing Address" inside flex table with id "---home:-:additionalAddressTableId---" without waiting for record
    And I enter "AdditioanlAddressesEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    #And I close "Edit" modal by clicking the top right x button
    Then I softly see that "Test Automation Organization" is in "Active" status

  @56739 @56907 @relatedContactsCreationEdition
  Scenario Outline: The Internal Users should be able to Create and Edit Related Contacts
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter in modal "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldEmail"
    And I click modal button "Save"
    #And I close "Create Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I select value inside table "---home:-:relatedContactsTableId---" is "All"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Contact}" in flex table with id "---home:-:relatedContactsTableId---"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:relatedContactsTableId---" without waiting for record
    When I enter "RelatedContactsEdition" values from "InternalOrganization_Field_Values.xlsx"
    And I click modal button "Save"
    #When I close "Edit" modal by clicking the top right x button
    Then I softly see that "Internal Organization" is in "Active" status
    Examples:
      | User |
      | EXE  |
#      | PM   |

  @56738 @deletionOfRelatedContact
  Scenario:  Validate whether the admin is able to Delete Related Contacts
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:internalOrganizationId---" is "All"
    And I pause execution for "5" seconds
    When I click on "View" icon for "SYSTEM" inside table without waiting for record
    And I click on top right button "New" in flex table with id "---home:-:relatedContactsTableId---"
    And I enter "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldEmail"
    And I click modal button "Save"
    #And I close "Create Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I select value inside table "---home:-:relatedContactsTableId---" is "All"
    And I click on "Delete" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:relatedContactsTableId---" without waiting for record
    Then I softly do not see value "{SavedValue:Automation Runtime Contact}" for title "Full Name" inside table "---home:-:relatedContactsTableId---"

  @56740 @56741 @56742 @dunsNumberCreationEditionAndDeletion @smoke
  Scenario: Validate whether ADMIN and DA users can Create, Edit and delete the DUNS Number
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I enter the following values into flex table with id "---home:-:dunsTableId---" by clicking "New" :
      | UEI Number   | Entity Name as Registered       | Location |
      | 138047990986 | Automation Runtime Contact Name | HernNdon |
    Then I softly see values "138047990986" and "HernNdon" inside table
    When I click on "Edit" icon for "138047990986" inside flex table with id "---home:-:dunsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---home:-:dunsTableId---"
    Then I softly see values "138047990986" and "HernNdon" inside table
    When I click on "delete" icon for "138047990986" inside flex table with id "---home:-:dunsTableId---" without waiting for record
    Then I softly do not see values "138047990986" and "UEINumber" inside table

  @56743 @deleteIndirectCostRate @buglogged151630 @wip
  Scenario: Validate whether ADMIN and DA users can delete the Indirect Cost Rates
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    When I click on "View" icon for "Test Automation Organization" inside table without waiting for record
    When I click on top right button "New" in flex table with id "---home:-:indirectRateFlextableId---"
    When I enter the following values into flex table with id "---home:-:indirectRateFlextableId---" by clicking "New" :
      | Title             | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type | Budget Categories |
      | Pre-Screen Review | 0         | 1       | 20                             | Final                   | Personnel         |
      #functionality changed to inline edit
    #And I enter "New IDC" values from "InternalOrganization_Field_Values.xlsx"
    #When I click modal button "Save"
    And I perform quick search for "New IDC" in "---home:-:indirectRateFlextableId---" panel
    When I click on "Delete" icon for "New IDC" inside flex table with id "---home:-:indirectRateFlextableId---" without waiting for record
    Then I do not see values "New IDC" and "Title" inside table

  @56883 @56912 @adminOrPMEditAccessToOwnOrgInternalOrganizationPageHeader
  Scenario Outline: Validate whether Users with Admin/ PM profiles can edit their own organizations and Internal organization page has Header
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    #56883 #monu
    Then I softly can see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"
    #56912 #monu
    When I click on "Edit" icon for "Test Automation Organization" inside table without waiting for record
    When I enter value "Virginia" into field "fieldBillingCity"
    And I click on "Save" in the page details
    Then I softly see field "City" as "Virginia"
    Examples:
      | User  |
      | ADMIN |

  @56911 @foUserCannotEditOrg
  Scenario: Validate whether Fo User Can edit Internal Organizations
    Given I login to "As a Grantor" app as "FO" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    Then I cannot see row level action button "Edit" against "Test Automation Organization" in flex table with id "---home:-:internalOrganizationId---"

  @57340 @thirdPartyVerification @nonFunctional @wip
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
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    #When I perform quick search for "Teaching and Learning" in "---home:-:internalOrganizationId---" panel
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
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    Then I see values "Test Automation Organization" and "Agency" inside table
    Examples:
      | User  |
      | ADMIN |

  @57343 @individualSubrecipientContactCreation @buglogged138607
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---home:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
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
    Then I see values "234567891" and " " inside table
    Examples:
      | User  |
      | ADMIN |

   @73851 @73856 @73850 @57347 @57348 @viewActiveGrantsSubmittedApplicationsOnRelatedLog
  Scenario Outline: Verify all profiles users should be able to view the Submitted Applications and Active Grants.
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---" without waiting for record
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
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
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
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

  @58245 @verifyReassignFunctionality @reassign @smoke @wip
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I click on "Submit For Approval" in the page details
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Reassign" content inside "My Tasks" subheader on left panel
    When I reassign task to "{SavedValue:EXE Username}"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I click "Reassign Selected" after selection of "{SavedValue:ProgramEGMSID}" in the table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see that "Approve Program" has been added in flextable with Id "---home:-:internalHomePendingTaskTableId---"

  @59016 @validateFilesOnHome @deepika
  Scenario: Addition of Attachment to Focus Area by User - Admin/EXE/PM
    When I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    And I click on "Save and Continue" in the page details
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "GrantorFocusAreaFilesgrid"
    And I switch to iframe with id "---home:-:focusAreaFilesTableId---"
    And I upload attachment "Announcement_Field_Values.xlsx" of type "Supporting Documents" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "GrantorFocusAreaFilesgrid"
    When I navigate to "Home" tab
    And I click on "My_Workspace_File"
    Then I see value "{SavedValue:AttachedFile}" for title "Title" inside table "WorkSpaceFilesFlexToggle"

  @62102 @pageBlockSections @deepika
  Scenario Outline: Verify whether the Overview Tab has the sections: Related Contacts and Indirect rates
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    When I click on "View" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---" with wait for record
    And I navigate to "Overview" sub tab
    Then I softly can see page block "Related Contacts"
    #And I softly can see page block "Indirect Cost Rates"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |
#      | PM    |

  @62103 @pageBlockSectionsRelatedLog @deepika
  Scenario Outline:  Validate whether the Related Log displays Active Federal/NGO Applications (Grantee) and Active Federal/NGO Grants (Grantee).
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
    When I click on "View" icon for "Test Automation Organization" inside flex table with id "---home:-:internalOrganizationId---" with wait for record
    And I navigate to "Related Log" sub tab
    Then I can see page block "Internal Programs"
    Then I can see page block "Active Announcements (Grantor) "
    Then I can see page block "Active Applications "
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
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 2     |
    And I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I refresh the page
    And I click on "Notify" in the page details
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---home:-:externalPendingTasktableId---"

  @62106 @indUserEditProfile @deepika
  Scenario: Verify whether the Individual Sub Profile Users can view their own contact information under Overview Tab
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "IND" user
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    When I navigate to "Overview" sub tab
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

  @62254 @PerformGlobalSearchOnHomeTab @keerti
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
    #And I click toggle button to select "Internal Programs"
    And I perform quick search for "{SavedValue:ProgramID}" in "Program__c" panel
    Then I see value "{SavedValue:ProgramID}" for title "EGMS ID" inside table "Program__c"

  @62912 @VerifyrecentlyViewedRecordAndDetailsOnMiniPageLayoutAndHoverLink @keerti @wip
  Scenario: The Internal User should be able to view the recently viewed record and details on the Mini pagelayout and the hover link  will take to the record
    Given I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Home" tab
    And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I select value inside table "---home:-:InternalOrganizationHierarchyTableID---" is "All"
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
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Potential Reviewer Contact" modal by clicking the top right x button
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
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldEmail"
    When I click modal button "Save"
    #And I close "Create Potential Reviewer Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Contact}" for title "Full Name" inside table "---home:-:reviewersTableId---"
    Then I softly see value "{SavedValue:uniqueEmailID}" for title "Email" inside table "---home:-:reviewersTableId---"
    Then I softly see value "New" for title "Status" inside table "---home:-:reviewersTableId---"
    Then I softly see value "Test Automation Organization" for title "Sponsoring Agency" inside table "---home:-:reviewersTableId---"
    #34674
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I wait for "2" seconds
    And I enter value "Test Automation Description" in email body
    And I click "Send" button in modal
    Then I see the following messages in the page details :
      | Email Sent Successfully |

@Bug-ID-388698 @201744 @201746 @201748 @ValidateSPIusershouldnotabletoeditfollowingfieldsFirstNameLastNameEmaildUserRolealreadyread-onlyonexternalprofileuser @sprint-5-US-200038 @vaibhav
  Scenario Outline: Validate SPI user should not able to edit following fields a. First Name b. Last Name c. Email d. User Role already read-only on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "My Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly see that "First Name" rendered in view mode only
    Then I softly see that "Last Name" rendered in view mode only
    Then I softly see that "User Role" rendered in view mode only
    Then I softly see that "Email" rendered in view mode only
    Examples:
      | userType |
      | SPI3     |
      | SPA      |
      | IND      |

  @201750 @ValidateSPI\SPA\INDusercanedittheAccessibilityModefieldonexternalprofileuser @sprint-5-US-200038 @vaibhav
  Scenario Outline: Validate SPI\SPA\IND user can edit the 'Accessibility Mode' field on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "My Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly see checkbox field "Accessibility Mode" is editable
    Examples:
      | userType |
      | SPI3     |
      | SPA      |
      | IND      |

  @201753 @201756 @ValidatefollowingfieldsareeditableforSPI\SPAuseronexternalprofileuser @sprint-5-US-200038 @vaibhav
  Scenario Outline: Validate following fields are editable for SPI\SPA user on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "My Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly see fields "Phone" is in edit mode
    Then I softly see fields "fieldMailingStreet" is in edit mode
    Then I softly see fields "fieldAddress2__c" is in edit mode
    Then I softly see fields "fieldMailingCity" is in edit mode
    Then I softly see fields "fieldMailingState" is in edit mode
    Then I softly see fields "fieldMailingPostalCode" is in edit mode
    Then I softly see fields "fieldMailingCountry" is in edit mode
    #201756
    Then I softly do not see "Affiliated Institution" inside page block detail
    Examples:
      | userType |
      | SPI3     |
      | SPA      |

  @201757  @ValidateSPI\SPAIseeMovedAddressLine2fieldbeforetheCityfieldonexternalprofileuser @sprint-5-US-200038 @vaibhav
  Scenario Outline: Validate SPI\SPA I see Moved 'Address Line 2' field before the 'City' field on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "My Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly see "Address Line 2" inside page block detail
    Then I softly see "City" inside page block detail
    Examples:
      | userType |
      | SPI3     |
      | SPA      |

  @201758 @ValidateSPI\SPA\INDuserseeMovedCountryfieldaftertheZipCodefieldonexternalprofileuser @sprint-5-US-200038 @vaibhav
  Scenario Outline: Validate SPI\SPA\IND user see Moved 'Country' field after the 'Zip Code' field on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "My Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly see "Zip Code" inside page block detail
    Then I softly see "Country" inside page block detail
    Examples:
      | userType |
      | SPI3     |
      | SPA      |
      | IND      |

  @201759 @ValidateSPI\SPA\INDuserIshouldnotseetheProfileDescriptionsectiononexternalprofileuseronexternalprofileuser @sprint-5-US-200038 @vaibhav
  Scenario Outline: Validate SPI\SPA\IND user I should not see the 'Profile Description' section on external profile user on external profile user
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
    And I select "My Profile" from user dropdown
    And I click on "Edit" in the page details
    Then I softly do not see "Profile Description" page block displayed
    Examples:
      | userType |
      | SPI3     |
      | SPA      |
      | IND      |