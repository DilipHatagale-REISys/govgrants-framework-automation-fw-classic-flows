@InternalExternalContacts @grantee-regression @grantee-parallel-regression
Feature: Contacts related scenarios
  Test all scenarios related to Internal External contacts

  @61424 @validateQuickSearchIsWorkingOrNotAtExternalContactsTable   @positive
  Scenario: Validate Quick search is working properly for valid and invalid input value at External contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Anderson" in "{prdoh_tableId:ExternalFederalContacts}" panel
    Then I softly see value "Anderson" for title "Last Name" inside table "{prdoh_tableId:ExternalFederalContacts}"
    When I perform quick search for "Demo" in "{prdoh_tableId:ExternalFederalContacts}" panel
    Then I softly do not see value "Demo" for title "Last Name" inside table "{prdoh_tableId:ExternalFederalContacts}"

  @61424 @validatePaginationFunctionalityIsWorkingOrNotAtExternalContactsTable  @positive
  Scenario: Validate pagination arrow is working fine at external federal contact table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on page navigation arrow "{prdoh_tableId:ExternalFederalContacts}" for table id "Next"
    Then I see table "{prdoh_tableId:ExternalFederalContacts}" shows "Page 2 of 3"

  @61424 @validateDefaultEntriesAtExternalContactsTable  @positive
  Scenario: Validate default count of records at {prdoh_tableId:ExternalFederalContacts} table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I pause execution for "3" seconds
    Then I see default record count of table "{prdoh_tableId:ExternalFederalContacts}" is as expected

  @61424 @validateTotalRecordCountAtExternalContactstable  @positive
  Scenario: Validate total records count is displayed as number of records in external contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I select value inside table "{prdoh_tableId:ExternalFederalContacts}" is "All"
    Then I see total records count is same as total row of table id "{prdoh_tableId:ExternalFederalContacts}" and table name "flextable"

  @61761 @validateReadOnlyModeOfFieldsAtExternalContactDetailPage @smoke  @positive
  Scenario: Validate fields at External Contacts detail Page is in view mode
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Anderson" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Anderson" inside table
    Then I softly see field "First Name" as "Mitchel"

  @61761 @validateExternalFederalContactscolumn @smoke  @positive
  Scenario Outline: Validate external federalcontacts detail like column inside the table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    Then I see "<fieldDisplayNames>" in flex table header "{prdoh_tableId:ExternalFederalContacts}"

    Examples:
      | fieldDisplayNames |
      | First Name        |
      | Last Name         |
      | Title             |
      | Organization      |
      | Email             |
      | Business Phone    |

  @61761 @validateLookUplinkAtExternalFederalContactDetailPage @smoke   @positive
  Scenario: Validate look up link at external federal contact detail page is navigating users to ogranizational page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Anderson" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Anderson" inside table
    When I click "Agency For International Development" lookup link
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "Agency For International Development" in the page details

  @61761 @validateAddressDetailAtExternalFederalContactsDetailPage   @positive
  Scenario: Validate Address detail of Federal Contacts at External Federal contacts detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Anderson" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Anderson" inside table
    When I click "Agency For International Development" lookup link
    Then I softly see field "Organization Name" as "Agency For International Development"
    Then I softly see field "Street" as "1300 Pennsylvania Ave NW"
    Then I softly see field "State" as "DC"
    Then I softly see field "Zip Code" as "20004"
    Then I softly see field "Abbreviation" as "USAID"
    Then I softly see field "Website" as "www.usaid.gov"
    Then I softly see field "City" as "Washington"
    When I click "Ramu Loke" lookup link
    Then I softly see field "First Name" as "Ramu"
    Then I softly see field "Last Name" as "Loke"

  @61761 @validateSystemDetailsAtExternalFederalContactsDetailPage  @positive
  Scenario: Validate last modified date and last modified by and created by field value at system information page block under external federal contacts detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I click on "Edit" in the page details
    When I enter value "Automation Federal Contact" into field "fieldTitle"
    And I click on "Save" in the page details
    Then I softly see field "Title" as "Automation Federal Contact"
    Then I softly see field "Created By" as "Automation Admin"
    Then I softly see field "Last Modified By" as "Automation Admin"
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

  @61761 @validateMiniPageLayoutContentOnMouseHoverAtLookupLink  @positive
  Scenario Outline: Validate content of mini page layout on mouse hovering at created by look up link under Extenal federal contact detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I click on "Edit" in the page details
    When I enter value "Automation Federal Contact" into field "fieldTitle"
    And I click on "Save" in the page details
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside table
    When I hover mouse on lookup link "Automation Admin"
    Then I see "<miniPageLayout_Text>" shown inside mini page layout on hover

    Examples:
      | miniPageLayout_Text |
      | Automation Admin    |

  @61905 @validateAddingOfContactForFederalOrganizationUnderExternalContact  @needToCheckWithParallelExecution  @positive
  Scenario Outline: Validate addition of contact for federal organization to check maximum length at external federal contact table
    When I delete the record "Automation Exernal Contact Test Record" from the object "Contact"
    When I delete the record "<contactName>" from the object "Contact"
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I enter value "AutomationExernalContactToCheckMaximum0123" into field "fieldFirstName"
    When I enter value "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum0123" into field "fieldLastName"
    And I click on "Save" in the page details
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "view" icon for "AutomationExernalContactToCheckMaximum01" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    Then I softly see field "First Name" as "AutomationExernalContactToCheckMaximum01"
    Then I softly see field "Last Name" as "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{prdoh_tableId:ExternalFederalContacts}" panel
    Then I softly see value "USDA-NRCS-NHO" for title "Organization" inside table "{prdoh_tableId:ExternalFederalContacts}"

    Examples:
      | userType | contactName                                                                                                               |
      | ADMIN    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | PM       | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | PO       | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | FO       | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | EXE      | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |

  @61917 @validateAddingOfContactForNonFederalOrganizationUnderExternalContact @needToCheckWithParallelExecution  @positive
  Scenario Outline: Validate addition of contact for non federal organization to check maximum length at external non federal contact table
    When I delete the record "<contactName>" from the object "Contact"
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "SidebarNonFederalContact" values from "Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    When I enter value "AutomationExernalContactToCheckMaximum0123" into field "fieldFirstName"
    When I enter value "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum0123" into field "fieldLastName"
    And I click on "Save" in the page details
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "AutomationExernalContactToCheckMaximum01" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    Then I softly see field "First Name" as "AutomationExernalContactToCheckMaximum01"
    Then I softly see field "Last Name" as "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    Then I softly see value "Health State Organization" for title "Organization" inside table "{prdoh_tableId:ExternalNonFederalContacts}"

    Examples:
      | userType | contactName                                                                                                               |
      | ADMIN    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | PM       | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | PO       | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | FO       | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | EXE      | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |

  @61918 @validateAddingOfContactWithOrWithoutMandatoryFieldsAtNonFederalContacts @smoke
  Scenario: Validate adding of contacts with or without mandatory fields at External Non federal contact
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
    And I refresh the page
    When I enter value "automationtest" into field "fieldEmail"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
      | Email : Invalid Email Address.     |
    And I refresh the page
    When I enter "SideBarCRwithDuplicateEmail" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    And I refresh the page
    When I enter "SideBarCRWithInvalidPhone" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Mobile Phone should be number and (XXX) XXX-XXXX format. |
      | Phone Number should be number and (XXX) XXX-XXXX format. |
      | Zip Code should be number and XXXXX format.              |
    And I refresh the page
    When I enter "SideBarCRWithInvalidAddress" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Street:Data value too large. (max length=255) |

  @61926 @validateContactAndAddressFieldsEditableForFederalOrganization  @positive
  Scenario Outline: Validate different users can edit contacts and address fields of federal organization at external federal contact detail page
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "Edit" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter value "(987) 654-3210" into field "fieldMobilePhone"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click on "Save" in the page details
    Then I softly see field "Street" as "Automation Address Test"
    Then I softly see field "Mobile Phone" as "(987) 654-3210"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FO       |
      | EXE      |

  @61926 @validateModifiedByAndModifiedDateGettingUpdatedAfterEditingContacts  @positive
  Scenario Outline: Validate modified by and modified date getting updated after editing fields or creating new contacts at external federal contact table
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "Edit" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter value "Migratory Birds" into field "fieldAccountId"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click on "Save" in the page details
    Then I softly see field "Last Modified By" as "<userName>"
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

    Examples:
      | userType | userName         |
      | ADMIN    | Automation Admin |
      | PM       | Automation PM    |
      | PO       | Automation PO    |
      | FO       | Automation FO    |
      | EXE      | Automation Exe   |

  @61926 @validateDeletionOfContactUnderExternalFederalContact @smoke  @positive
  Scenario: Validate  deletion of contact from external federal contact table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"

  @61926 @validateRecordEditedByOwnerOnlyForFederalContact @smoke   @positive
  Scenario Outline: Validate contact record owner able to edit their profiles using created by field at external federal contact detail page
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "Overview" sub tab
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType | userName         |
      | ADMIN    | Automation Admin |
      | EXE      | Automation Exe   |
      | PM       | Automation PM    |

  @61926 @validateRecordEditedByAdminForAllUsers   @positive
  Scenario Outline: Validate contact record edited by admin for all profiles using created by field at external federal contact
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "ADMIN" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "view" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType | userName       |
      | EXE      | Automation Exe |
      | PM       | Automation PM  |

  @61926 @validateAdminRecordShouldNotEditedByOthersUsers
  Scenario Outline: Validate contact record should not be edited by others users using created by field at external federal contact
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact2@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "view" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I click "Automation Admin" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |

    Examples:
      | userType |
      | EXE      |
      | PM       |

  @61932 @validateModifiedByAndModifiedDateGettingUpdatedAfterEditingUnderExternalNonFederalContact  @positive
  Scenario: Validate modified by and modified date getting updated after editing fields or creating new contacts at external federal contact table
    When I login as "PM" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "ADMIN" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "Edit" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click on "Save" in the page details
    Then I softly see field "Last Modified By" as "Automation Admin"
    Then I softly see field "Created By" as "Automation PM"
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

  @61932 @validateRecordOwnerAbleToEditProfilesUsingCreatedByForNonFederalContact
  Scenario: Validate contact record owner able to modify or edit their profiles using created by field at external federal contact detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I click "Automation Admin" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    Then I softly see field "About Me" as "Admin Address"
    When I re-login as "PM" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I click "Automation Admin" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |

  @61932 @validateRecordEditedByOwnerOnlyForNonFederalContact  @positive
  Scenario Outline: Validate contact record owner able to edit their profiles using created by field at external federal contact detail page
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType | userName         |
      | ADMIN    | Automation Admin |
      | EXE      | Automation Exe   |
      | PM       | Automation PM    |

  @61932 @validateRecordEditedByOwnerOnlyForNonFederalContact   @positive
  Scenario Outline: Validate Admin User can edit other user profile using created by field
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "ADMIN" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"
    Examples:
      | userType | userName       |
      | EXE      | Automation Exe |
      | PM       | Automation PM  |

  @62011 @validateDeletionOfContactUnderExternalFederalContactUsingMultipleUser @smoke  @positive
  Scenario Outline: Validate  deletion of contact from external federal contact table using multiple user
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    And I see the text :
      | Record deleted successfully. |
    And I refresh the page
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    Then I do not see value "{SavedValue:firstName}" for title "Full Name" inside table "{prdoh_tableId:ExternalFederalContacts}"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @62011 @validateDeletionOfContactUsingLoggedInUser @smoke  @positive
  Scenario: Validate deletion of contact from external federal contact table using logged in user but not with record owner
    Given I login as "PM" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I re-login as "EXE" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    And I see the text :
      | Record deleted successfully. |
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    Then I do not see value "{SavedValue:firstName}" for title "Full Name" inside table "{prdoh_tableId:ExternalFederalContacts}"

  @62011 @validateImpactOfDeletionOfContactFromExternalFederalContacts  @positive
  Scenario: Validate after deletion of contact from external federal contact table it should not displayed under respective organization
    Given I login as "PM" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I re-login as "EXE" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalFederalContacts}"
    And I see the text :
      | Record deleted successfully. |
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "USDA-NRCS-NHO" in "{prdoh_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "USDA-NRCS-NHO" inside table
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:RelatedContacts}" panel
    Then I see "No Records Found" inside flex table with id "{prdoh_tableId:RelatedContacts}"

  @62010 @validateDeletionOfContactUnderExternalNonFederalContactUsingMultipleUser @smoke  @positive
  Scenario Outline: Validate  deletion of contact from external non federal contact table using multiple user
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    Then I do not see value "{SavedValue:firstName}" for title "Full Name" inside table "{prdoh_tableId:ExternalNonFederalContacts}"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @62010 @validateDeletionOfContactUsingLoggedInUserForNonFederalContact @smoke
  Scenario: Validate deletion of contact from external non federal contact table using logged in user but not with record owner
    Given I login as "PM" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I re-login as "EXE" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    Then I do not see value "{SavedValue:firstName}" for title "Full Name" inside table "{prdoh_tableId:ExternalNonFederalContacts}"

  @62010 @validateImpactOfDeletionOfContactFromExternalNonFederalContacts
  Scenario: Validate after deletion of contact from external non federal contact table it should not displayed under respective organization
    Given I login as "PM" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Health State Organization" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I re-login as "EXE" user on "default" portal
    When I navigate to "{sidebar:ExternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:ExternalNonFederalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:ExternalNonFederalContacts}"
    When I navigate to "{sidebar:ExternalOrganization}" content inside "{sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Health State Organization" in "{prdoh_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "Health State Organization" inside table
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:RelatedContacts}" panel
    Then I do not see value "Automation Test Record" for title "Full Name" inside table "{prdoh_tableId:RelatedContacts}"

  @62129 @validateDefaultEntriesAtInternalContactsTable-myOrganizationContact  @positive
  Scenario: Validate default count of records at internal my organization contacts table Under Internal Contact
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I pause execution for "3" seconds
    Then I see default record count of table "{prdoh_tableId:InternalContacts}" is as expected

  @62129 @validateTotalRecordCountAtInternalContactstable-myOrganizationContact  @positive
  Scenario: Validate total records count is displayed as number of records in internal contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I select value inside table "{prdoh_tableId:InternalContacts}" is "All"
    Then I see total records count is same as total row of table id "{prdoh_tableId:InternalContacts}" and table name "flextable"

  @62129 @validateTotalRecordCountAtInternalContactstable-allInternalContacts  @positive
  Scenario: Validate total records count is displayed as number of records in internal contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    And I select value inside table "{prdoh_tableId:InternalContacts}" is "All"
    Then I see total records count is same as total row of table id "{prdoh_tableId:InternalContacts}" and table name "flexGrid"

  @62129 @validateQuickSearchIsWorkingOrNotAtInternalContacts-myOrganizationContact  @positive
  Scenario: Validate search is working properly for valid and invalid input value at Internal contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Automation" in "{prdoh_tableId:InternalContacts}" panel
    Then I softly see value "Automation" for title "Title" inside table "{prdoh_tableId:InternalContacts}"
    When I perform quick search for "Automation Invalid" in "{prdoh_tableId:InternalContacts}" panel
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:InternalContacts}"

  @62129 @validateAdvanceSearchIsWorkingOrNotAtInternalContacts-myOrganizationContact  @positive
  Scenario: Validate advance search is working or not for correct and incorrect value at Internal contacts table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I click on advance filter "#advfStateContacts" of table id "{prdoh_tableId:InternalContacts}"
    And I click toggle button to select "All Internal Contacts"
    When I enter advance filter values inside id "advfStateContacts"
      | Last Name | contains | Exe |
    Then I softly see value "Exe" for title "Last Name" inside table "{prdoh_tableId:InternalContacts}"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I click on advance filter "#advfStateContacts" of table id "{prdoh_tableId:InternalContacts}"
    When I enter advance filter values inside id "advfStateContacts"
      | First Name | contains | Automation1 |
    Then I softly see "No Records Found" inside flex table with id "{prdoh_tableId:InternalContacts}"

  @62129 @validateRefreshAtInternalContacts-myOrganizationContact  @positive
  Scenario: Validate Refresh option at Internal Contacts is working properly as expected
    When I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    When I click on parallel lines menu bar with data target value "#StateContactsFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "My Organization’s Contacts"
    Then I see table is refreshing

  @62129 @validateDefaultListViewForInternalContacts-myOrganizationContact  @positive
  Scenario: Validate default list view is displayed or not at {prdoh_tableId:InternalContacts} table Under Internal Contact
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    Then I see "My Organization’s Contacts" shown as inside "{prdoh_tableId:InternalContacts}"

  @62129 @validateListViewOrganization-myOrganizationContact @smoke   @positive
  Scenario Outline: Validate default list view contact should contain organization as same as logged in users organization
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    Then I see column "AccountName__c" contains values only "<organizationName>"
    Examples:
      | userType | organizationName  |
      | ADMIN    | SYSTEM            |
      | PM       | Direccion General |
      | PO       | Direccion General |
      | FO       | Direccion General |
      | EXE      | Direccion General |

  @62129 @validateListViewOrganization-allInternalContacts    @positive
  Scenario: Validate contact should contain all Listed organization
    Given I login as "ADMIN" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "SYSTEM" in "{prdoh_tableId:InternalContacts}" panel
    Then I softly see value "SYSTEM" for title "Organization" inside table "{prdoh_tableId:InternalContacts}"
    When I perform quick search for "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" in "{prdoh_tableId:InternalContacts}" panel
    Then I softly see value "Secretaria Auxiliar de Salud Familiar y Servicios Integrados" for title "Organization" inside table "{prdoh_tableId:InternalContacts}"
    When I perform quick search for "Direccion General" in "{prdoh_tableId:InternalContacts}" panel
    Then I softly see value "Direccion General" for title "Organization" inside table "{prdoh_tableId:InternalContacts}"

  @62020 @validateFieldsInReadOrViewModeAtInternalContacts-myOrganizationContact @smoke   @positive
  Scenario: Validate fields is in read mode only at internal contacts
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "My Organization Contact" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "View" icon for "My Organization Contact" inside flex table with id "{prdoh_tableId:InternalContacts}"
    Then I softly see field "First Name" as "Automation"

  @62020 @validateContactInformation-myOrganizationContact @smoke   @positive
  Scenario: Validate contact information at Internal contact page details
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Direccion General" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    Then I softly see field "First Name" as "{SavedValue:firstName}"
    Then I softly see field "Last Name" as "Contact"
    Then I softly see field "Office Phone" as "(012) 345-6789"
    Then I softly see field "Email" as "automationtestrecord@yopmail.com"
    Then I softly see field "Street" as "1000 Defense Pentagon"
    Then I softly see field "State" as "DC"
    Then I softly see field "Zip Code" as "41102"
    Then I softly see field "City" as "Washington"
    Then I softly see field "Last Modified By" as "Automation Admin"
    Then I softly see field "Created By" as "Automation Admin"
    When I click "Direccion General" lookup link
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Direccion General" in the page details

  @62020 @validateContentOnMouseHoverAtInternalContactLookupLink-myOrganizationContact  @positive
  Scenario Outline: Validate content of mini page layout on mouse hovering at created by look up link under Internal contact detail page
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    When I hover mouse on lookup link "Automation Admin"
    Then I see "<miniPageLayout_Text>" shown inside mini page layout on hover

    Examples:
      | miniPageLayout_Text |
      | Automation Admin    |

  @62019 @validateInternalContactsFunctionalityUsingMultipleUsers-myOrganizationContact @smoke    @positive
  Scenario Outline: Validate different users can access Internal contact detail page
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    Then I see the header is "Contact" in the page details
    Then I see the sub-header is "{SavedValue:firstName} Contact" in the page details

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FO       |
      | EXE      |

  @62029 @validateAddingOfInternalContact-myOrganizationContact @smoke  @positive
  Scenario Outline: Validate addition of contact for Internal Contact
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contacts"
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "<organizationName>" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    Then I softly see value "{SavedValue:firstName}" for title "First Name" inside table "{prdoh_tableId:InternalContacts}"
    When I click on "View" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    Then I softly see field "First Name" as "{SavedValue:firstName}"
    Then I softly see field "Last Name" as "Contact"
    Then I softly see field "Street" as "1000 Defense Pentagon"

    Examples:
      | userType | organizationName  |
      | ADMIN    | SYSTEM            |
      | PM       | Direccion General |
      | PO       | Direccion General |
      | FO       | Direccion General |
      | EXE      | Direccion General |

  @62033 @validateContactAndAddressFieldsEditableForInternalContacts   @positive
  Scenario Outline: Validate different users can edit Internal contacts and address fields at Internal contact detail page
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "Edit" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter value "(987) 654-3210" into field "fieldMobilePhone"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click on "Save" in the page details
    Then I softly see field "Street" as "Automation Address Test"
    Then I softly see field "Mobile Phone" as "(987) 654-3210"

    Examples:
      | userType |
      | ADMIN    |
      | PM       |
      | PO       |
      | FO       |
      | EXE      |

  @62033 @validateModifiedByAndModifiedDateGettingUpdatedAfterEditingInternalContacts  @positive
  Scenario Outline: Validate modified by and modified date getting updated after editing fields or creating new contacts at Internal federal contact table
    When I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "Edit" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click on "Save" in the page details
    Then I softly see field "Last Modified By" as "<userName>"
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

    Examples:
      | userType | userName         |
      | ADMIN    | Automation Admin |
      | PM       | Automation PM    |
      | PO       | Automation PO    |
      | FO       | Automation FO    |
      | EXE      | Automation Exe   |

  @62033 @validateDeletionOfContactUnderInternalContact @smoke  @positive
  Scenario: Validate  deletion of contact from internal contact table
    Given I login as "Admin" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I pause execution for "5" seconds
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "Delete" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    Then I do not see value "{SavedValue:firstName}" for title "First Name" inside table "{prdoh_tableId:InternalContacts}"

  @62033 @validateRecordEditedByOwnerOnlyForInternalContact  @positive
  Scenario Outline: Validate contact record owner able to edit their profiles using created by field at Internal contact detail page
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I pause execution for "3" seconds
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType | userName         |
      | ADMIN    | Automation Admin |
      | EXE      | Automation Exe   |
      | PM       | Automation PM    |

  @62033 @validateRecordEditedByAdminForAllUsersAtInternalContacts  @positive
  Scenario Outline: Validate contact record edited by admin for all profiles using created by field at Internal contact
    When I delete the record "Test Automation Test Automation Record" from the object "Contact"
    Given I login as "<userType>" user
    When I navigate to "HOME" tab
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{prdoh_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "SYSTEM" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I re-login as "ADMIN" user on "default" portal
    When I navigate to "{sidebar:InternalContact}" content inside "{sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Internal Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{prdoh_tableId:InternalContacts}" panel
    When I click on "View" icon for "{SavedValue:firstName}" inside flex table with id "{prdoh_tableId:InternalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType | userName       |
      | EXE      | Automation Exe |
      | PM       | Automation PM  |