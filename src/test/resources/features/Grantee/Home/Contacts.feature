@Grantee-InternalExternalContacts @grantee-regression @grantee-parallel-regression
Feature: Contacts related scenarios
  Test all scenarios related to Internal External contacts

  @61424 @validateQuickSearchIsWorkingOrNotAtExternalContactsTable   @positive
  Scenario: Validate Quick search is working properly for valid and invalid input value at External contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Automation External Federal Contact" in "{grantee_tableId:ExternalFederalContacts}" panel
    Then I softly see value "Automation External Federal Contact" for title "Title" inside table "{grantee_tableId:ExternalFederalContacts}"
    When I perform quick search for "Automation External Federal Contact" in "{grantee_tableId:ExternalFederalContacts}" panel
    Then I softly do not see value "Automation External Federal" for title "Full Name" inside table "{grantee_tableId:ExternalFederalContacts}"

  @61424 @validatePaginationFunctionalityIsWorkingOrNotAtExternalContactsTable  @positive
  Scenario: Validate pagination arrow is working fine at external federal contact table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on page navigation arrow "{grantee_tableId:ExternalFederalContacts}" for table id "Next"
    Then I see table "{grantee_tableId:ExternalFederalContacts}" shows "Page 2 of 4"

  @61424 @validateDefaultEntriesAtExternalContactsTable  @positive
  Scenario: Validate default count of records at {grantee_tableId:ExternalFederalContacts} table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I pause execution for "3" seconds
    Then I see default record count of table "{grantee_tableId:ExternalFederalContacts}" is as expected

  @61424 @validateTotalRecordCountAtExternalContactstable  @positive
  Scenario: Validate total records count is displayed as number of records in external contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I select value inside table "{grantee_tableId:ExternalFederalContacts}" is "10"
    Then I see total records count is same as total row of table id "{grantee_tableId:ExternalFederalContacts}" on click "Next"

  @61761 @validateReadOnlyModeOfFieldsAtExternalContactDetailPage @smoke  @positive
  Scenario: Validate fields at External Contacts detail Page is in view mode
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Automation External Federal Contact" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Automation External Federal Contact" inside table
    Then I softly see field "First Name" as "Automation Federal"

  @61761 @validateExternalFederalContactscolumn @smoke  @positive
  Scenario Outline: Validate external federalcontacts detail like column inside the table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    Then I see "<fieldDisplayNames>" in flex table header "{grantee_tableId:ExternalFederalContacts}"

    Examples:
      | fieldDisplayNames |
      | Full Name         |
      | Title             |
      | Organization      |
      | Email             |
      | Office Phone      |

  @61761 @validateLookUplinkAtExternalFederalContactDetailPage @smoke   @positive
  Scenario: Validate look up link at external federal contact detail page is navigating users to ogranizational page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Automation External Federal Contact" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Automation External Federal Contact" inside table
    When I click "USDA-NRCS-NHO" lookup link
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "USDA-NRCS-NHO" in the page details

  @61761 @validateAddressDetailAtExternalFederalContactsDetailPage   @positive
  Scenario: Validate Address detail of Federal Contacts at External Federal contacts detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Automation External Federal Contact" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Automation External Federal Contact" inside table
    When I click "USDA-NRCS-NHO" lookup link
    Then I softly see field "Street" as "200 Constitution Ave NW"
    Then I softly see field "State" as "DC"
    Then I softly see field "Zip Code" as "20210"
    Then I softly see field "Abbreviation" as "DOL"
    Then I softly see field "City" as "Washington"
    When I click "Grantee PM" lookup link
    Then I softly see field "First Name" as "Grantee"
    Then I softly see field "Last Name" as "PM"

  @61761 @validateSystemDetailsAtExternalFederalContactsDetailPage  @positive
  Scenario: Validate last modified date and last modified by and created by field value at system information page block under external federal contacts detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I pause execution for "4" seconds
    And I click modal button "Edit"
    When I enter value "Automation Federal Contact" into field "fieldTitle"
    And I click modal button "Save"
    Then I see field "Title" as "Automation Federal Contact" on modal
    Then I see field "Created By" as "{SavedValue:GRANTEE ADMIN Username}" on modal
    Then I see field "Last Modified By" as "{SavedValue:GRANTEE ADMIN Username}" on modal
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

  @61761 @validateMiniPageLayoutContentOnMouseHoverAtLookupLink  @positive
  Scenario Outline: Validate content of mini page layout on mouse hovering at created by look up link under Extenal federal contact detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    And I pause execution for "6" seconds
    And I click modal button "Edit"
    When I enter value "Automation Federal Contact" into field "fieldTitle"
    And I click modal button "Save"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "View" icon for "Automation Federal Contact" inside table
    And I pause execution for "2" seconds
    When I hover mouse on "Last Modified By" lookup link "{SavedValue:GRANTEE ADMIN Username}"
    Then I see "<miniPageLayout_Text>" shown inside mini page layout on hover

    Examples:
      | miniPageLayout_Text                 |
      | {SavedValue:GRANTEE ADMIN Username} |

  @61905 @validateAddingOfContactForFederalOrganizationUnderExternalContact  @needToCheckWithParallelExecution  @positive
  Scenario Outline: Validate addition of contact for federal organization to check maximum length at external federal contact table
    When I delete the record "<contactName>" from the object "Contact"
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    And I click modal button "Save"
    And I click modal button "Edit"
    When I enter value "AutomationExernalContactToCheckMaximum0123" into field "fieldFirstName"
    When I enter value "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum0123" into field "fieldLastName"
    And I click modal button "Save"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "view" icon for "<contactName>" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    Then I see field "First Name" as "AutomationExernalContactToCheckMaximum01" on modal
    Then I see field "Last Name" as "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum" on modal
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{grantee_tableId:ExternalFederalContacts}" panel
    Then I softly see value "USDA-NRCS-NHO" for title "Organization" inside table "{grantee_tableId:ExternalFederalContacts}"

    Examples:
      | userType      | contactName                                                                                                               |
      | GRANTEE ADMIN | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE PM    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE PO    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE FO    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE EXE   | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |

  @61917 @validateAddingOfContactForNonFederalOrganizationUnderExternalContact @needToCheckWithParallelExecution  @positive
  Scenario Outline: Validate addition of contact for non federal organization to check maximum length at external non federal contact table
    When I delete the record "<contactName>" from the object "Contact"
    When I login to "As a Grantor" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "SidebarNonFederalContact" values from "Field_Values.xlsx"
    And I click modal button "Save"
    And I click modal button "Edit"
    When I enter value "AutomationExernalContactToCheckMaximum0123" into field "fieldFirstName"
    When I enter value "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum0123" into field "fieldLastName"
    And I click modal button "Save"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "<contactName>" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    Then I see field "First Name" as "AutomationExernalContactToCheckMaximum01" on modal
    Then I see field "Last Name" as "AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum" on modal
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationExernalContactToCheckMaximum01" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    Then I softly see value "Department of Health" for title "Organization" inside table "{grantee_tableId:ExternalNonFederalContacts}"

    Examples:
      | userType      | contactName                                                                                                               |
      | GRANTEE ADMIN | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE PM    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE PO    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE FO    | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |
      | GRANTEE EXE   | AutomationExernalContactToCheckMaximum01 AutomationExernalContactToCheckMaximum0123AutomationExernalContactToCheckMaximum |

  @61918 @validateAddingOfContactWithOrWithoutMandatoryFieldsAtNonFederalContacts @smoke
  Scenario: Validate adding of contacts with or without mandatory fields at External Non federal contact
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter value "automationtest" into field "fieldEmail"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Last Name : You must enter a value |
      | Email : Invalid Email Address.     |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "SideBarCRwithDuplicateEmail" values from "Field_Values.xlsx"
    When I enter value "Department of Health NF" into field "fieldAccountId"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Contacts must have unique email addresses. The email address entered is associated with an existing contact. |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "SideBarCRWithInvalidPhone" values from "Field_Values.xlsx"
    When I enter value "Department of Health NF" into field "fieldAccountId"
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter Valid Phone Number |
      | Please Enter 5 Digit ZipCode    |
    And I refresh the page
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "SideBarCRWithInvalidAddress" values from "Field_Values.xlsx"
    When I enter value "Department of Health NF" into field "fieldAccountId"
    And I click modal button "Save"
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Street:Data value too large. (max length=255) |

  @61926 @validateContactAndAddressFieldsEditableForFederalOrganization  @positive
  Scenario Outline: Validate different users can edit contacts and address fields of federal organization at external federal contact detail page
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "Edit" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter value "(987) 654-3210" into field "fieldMobilePhone"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click modal button "Save"
    Then I see field "Street" as "Automation Address Test" on modal
    Then I see field "Mobile Phone" as "(987) 654-3210" on modal

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @61926 @validateModifiedByAndModifiedDateGettingUpdatedAfterEditingContacts  @positive
  Scenario Outline: Validate modified by and modified date getting updated after editing fields or creating new contacts at external federal contact table
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "Edit" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter value "Migratory Birds" into field "fieldAccountId"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click modal button "Save"
    Then I see field "Last Modified By" as "<userName>" on modal
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

    Examples:
      | userType      | userName                            |
      | GRANTEE ADMIN | {SavedValue:GRANTEE ADMIN Username} |
      | GRANTEE PM    | {SavedValue:GRANTEE PM Username}    |
      | GRANTEE PO    | {SavedValue:GRANTEE PO Username}    |
      | GRANTEE FO    | {SavedValue:GRANTEE FO Username}    |
      | GRANTEE EXE   | {SavedValue:GRANTEE EXE Username}   |

  @61926 @validateDeletionOfContactUnderExternalFederalContact @smoke  @positive
  Scenario: Validate  deletion of contact from external federal contact table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"

  @61926 @validateRecordEditedByOwnerOnlyForFederalContact @smoke   @positive
  Scenario Outline: Validate contact record owner able to edit their profiles using created by field at external federal contact detail page
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType      | userName                            |
      | GRANTEE ADMIN | {SavedValue:GRANTEE ADMIN Username} |
      | GRANTEE EXE   | {SavedValue:GRANTEE EXE Username}   |
      | GRANTEE PM    | {SavedValue:GRANTEE PM Username}    |
      | GRANTEE FO    | {SavedValue:GRANTEE FO Username}    |

  @61926 @validateRecordEditedByAdminForAllUsers   @positive @wip @needToCheckFRD
  Scenario Outline: Validate contact record edited by admin for all profiles using created by field at external federal contact
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "view" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType    | userName                          |
      | GRANTEE EXE | {SavedValue:GRANTEE EXE Username} |
      | GRANTEE PM  | {SavedValue:GRANTEE PM Username}  |

  @61926 @validateAdminRecordShouldNotEditedByOthersUsers @wip @needToCheckFRD
  Scenario Outline: Validate contact record should not be edited by others users using created by field at external federal contact
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact2@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "view" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I click "{SavedValue:GRANTEE ADMIN Username}" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |

    Examples:
      | userType    |
      | GRANTEE EXE |
      | GRANTEE PM  |

  @61932 @validateModifiedByAndModifiedDateGettingUpdatedAfterEditingUnderExternalNonFederalContact  @positive
  Scenario: Validate modified by and modified date getting updated after editing fields or creating new contacts at external federal contact table
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "Edit" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click modal button "Save"
    Then I see field "Last Modified By" as "{SavedValue:GRANTEE ADMIN Username}" on modal
    Then I see field "Created By" as "{SavedValue:GRANTEE PM Username}" on modal
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

  @61932 @validateRecordOwnerAbleToEditProfilesUsingCreatedByForNonFederalContact
  Scenario: Validate contact record owner able to modify or edit their profiles using created by field at external federal contact detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I click "{SavedValue:GRANTEE ADMIN Username}" lookup link
    And I click modal button "Edit"
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    Then I see field "About Me" as "Admin Address" on modal
    And I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I click "{SavedValue:GRANTEE ADMIN Username}" lookup link
    When I click on "Edit" in the page details
    And I see the text :
      | You dont have permission to access this record. Please contact administrator. |

  @61932 @validateRecordEditedByOwnerOnlyForNonFederalContact  @positive
  Scenario Outline: Validate contact record owner able to edit their profiles using created by field at external federal contact detail page
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType      | userName                            |
      | GRANTEE ADMIN | {SavedValue:GRANTEE ADMIN Username} |
      | GRANTEE EXE   | {SavedValue:GRANTEE EXE Username}   |
      | GRANTEE PM    | {SavedValue:GRANTEE PM Username}    |

  @61932 @validateRecordEditedByAdminOwnerForNonFederalContact   @positive
  Scenario Outline: Validate Admin User can edit other user profile using created by field
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "view" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"
    Examples:
      | userType    | userName                          |
      | GRANTEE EXE | {SavedValue:GRANTEE EXE Username} |
      | GRANTEE PM  | {SavedValue:GRANTEE PM Username}  |

  @62011 @validateDeletionOfContactUnderExternalFederalContactUsingMultipleUser @smoke  @positive
  Scenario Outline: Validate  deletion of contact from external federal contact table using multiple user
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I pause execution for "2" seconds
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    And I see the text :
      | Record deleted successfully. |
    And I refresh the page
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    Then I do not see value "{SavedValue:firstName}" for title "Full Name" inside table "{grantee_tableId:ExternalFederalContacts}"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62011 @validateDeletionOfContactUsingLoggedInUser @smoke  @positive
  Scenario: Validate deletion of contact from external federal contact table using logged in user but not with record owner
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    And I see the text :
      | Record deleted successfully. |
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    Then I do not see value "{SavedValue:firstName}" for title "Full Name" inside table "{grantee_tableId:ExternalFederalContacts}"

  @62011 @validateImpactOfDeletionOfContactFromExternalFederalContacts  @positive
  Scenario: Validate after deletion of contact from external federal contact table it should not displayed under respective organization
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalFederalContacts}"
    When I enter "ExternalFederalContact" values from "Field_Values.xlsx"
    When I enter value "aotomationExternalContact1@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalFederalContacts}" panel
    When I click on "Delete" icon for "Automation External Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalFederalContacts}"
    And I see the text :
      | Record deleted successfully. |
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "USDA-NRCS-NHO" in "{grantee_tableId:FederalOrganizations}" panel
    When I click on "View" icon for "USDA-NRCS-NHO" inside table
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:RelatedContacts}" panel
    Then I see "No Records Found" inside flex table with id "{grantee_tableId:RelatedContacts}"

  @62010 @validateDeletionOfContactUnderExternalNonFederalContactUsingMultipleUser @smoke  @positive
  Scenario Outline: Validate  deletion of contact from external non federal contact table using multiple user
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "Delete" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I perform quick search for "Automation External Non Federal Contact Test" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    Then I do not see value "Automation External Non Federal Contact Test" for title "Title" inside table "{grantee_tableId:ExternalNonFederalContacts}"

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FD    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62010 @validateDeletionOfContactUsingLoggedInUserForNonFederalContact @smoke
  Scenario: Validate deletion of contact from external non federal contact table using logged in user but not with record owner
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "Delete" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I perform quick search for "Automation External Non Federal Contact Test" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    Then I do not see value "Automation External Non Federal Contact Test" for title "Title" inside table "{grantee_tableId:ExternalNonFederalContacts}"

  @62010 @validateImpactOfDeletionOfContactFromExternalNonFederalContacts
  Scenario: Validate after deletion of contact from external non federal contact table it should not displayed under respective organization
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I enter "ExternalNonFederalContact" values from "Field_Values.xlsx"
    When I enter value "Department of Health" into field "fieldAccountId"
    When I enter value "automationtest@yopmail.com" into field "fieldEmail"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    And I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:ExternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:ExternalNonFederalContacts}" panel
    When I click on "Delete" icon for "Automation External Non Federal Contact Test" inside flex table with id "{grantee_tableId:ExternalNonFederalContacts}"
    When I navigate to "{grantee_sidebar:ExternalOrganization}" content inside "{grantee_sidebar:OrganizationSubheaderName}" subheader on left panel
    When I perform quick search for "Department of Health" in "{grantee_tableId:NonFederalOrganizations}" panel
    When I click on "View" icon for "Department of Health" inside table
    And I navigate to "Overview" sub tab
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:RelatedContacts}" panel
    Then I do not see value "Automation External Non Federal Contact Test" for title "Title" inside table "{grantee_tableId:RelatedContacts}"

  @62129 @validateDefaultEntriesAtInternalContactsTable-myOrganizationContact  @positive
  Scenario: Validate default count of records at internal my organization contacts table Under Internal Contact
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I pause execution for "3" seconds
    Then I see default record count of table "{grantee_tableId:InternalContacts}" is as expected

  @62129 @validateTotalRecordCountAtInternalContactsTable-myOrganizationContact  @positive
  Scenario: Validate total records count is displayed as number of records in internal contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I select value inside table "{grantee_tableId:InternalContacts}" is "10"
    And I pause execution for "3" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:InternalContacts}" on click "Next"

  @62129 @validateTotalRecordCountAtInternalContactsTable-allInternalContacts  @positive
  Scenario: Validate total records count is displayed as number of records in internal contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I select value inside table "{grantee_tableId:InternalContacts}" is "20"
    And I pause execution for "3" seconds
    Then I see total records count is same as total row of table id "{grantee_tableId:InternalContacts}" on click "Next"

  @62129 @validateQuickSearchIsWorkingOrNotAtInternalContacts-myOrganizationContact  @positive
  Scenario: Validate search is working properly for valid and invalid input value at Internal contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "Automation" in "{grantee_tableId:InternalContacts}" panel
    Then I softly see value "Automation" for title "Title" inside table "{grantee_tableId:InternalContacts}"
    When I perform quick search for "Automation Invalid" in "{grantee_tableId:InternalContacts}" panel
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:InternalContacts}"

  @62129 @validateAdvanceSearchIsWorkingOrNotAtInternalContacts-myOrganizationContact  @positive
  Scenario: Validate advance search is working or not for correct and incorrect value at Internal contacts table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I click on advance filter "#advfStateContacts" of table id "{grantee_tableId:InternalContacts}"
    And I click toggle button to select "All Contacts"
    When I enter advance filter values inside id "advfStateContacts"
      | Title | contains | Automation Internal |
    Then I softly see value "Automation Internal Contacts" for title "Title" inside table "{grantee_tableId:InternalContacts}"
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I click on advance filter "#advfStateContacts" of table id "{grantee_tableId:InternalContacts}"
    When I enter advance filter values inside id "advfStateContacts"
      | Title | contains | AutomationInvalid |
    Then I softly see "No Records Found" inside flex table with id "{grantee_tableId:InternalContacts}"

  @62129 @validateRefreshAtInternalContacts-myOrganizationContact  @positive
  Scenario: Validate Refresh option at Internal Contacts is working properly as expected
    Given I login as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contact"
    When I click on parallel lines menu bar with data target value "#StateContactsFlexToggle"
    And I select "Refresh" from parallel lines dropdown of "My Organization’s Contact"
    Then I see table is refreshing

  @62129 @validateDefaultListViewForInternalContacts-myOrganizationContact  @positive
  Scenario: Validate default list view is displayed or not at {grantee_tableId:InternalContacts} table Under Internal Contact
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    Then I see "My Organization’s Contact" shown as inside "{grantee_tableId:InternalContacts}"

  @62129 @validateListViewOrganization-myOrganizationContact @smoke   @positive
  Scenario Outline: Validate default list view contact should contain organization as same as logged in users organization
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    Then I see column "AccountName__c" contains values only "<organizationName>"
    Examples:
      | userType      | organizationName     |
      | GRANTEE ADMIN | SYSTEM               |
      | GRANTEE PM    | Department of Health |
      | GRANTEE PO    | Department of Health |
      | GRANTEE FO    | Department of Health |
      | GRANTEE EXE   | Department of Health |

  @62129 @validateListViewOrganization-allInternalContacts    @positive
  Scenario: Validate contact should contain all Listed organization
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "SYSTEM" in "{grantee_tableId:InternalContacts}" panel
    Then I softly see value "SYSTEM" for title "Organization" inside table "{grantee_tableId:InternalContacts}"
    When I perform quick search for "Test Automation Organization" in "{grantee_tableId:InternalContacts}" panel
    Then I softly see value "Test Automation Organization" for title "Organization" inside table "{grantee_tableId:InternalContacts}"
    When I perform quick search for "Department of Health" in "{grantee_tableId:InternalContacts}" panel
    Then I softly see value "Department of Health" for title "Organization" inside table "{grantee_tableId:InternalContacts}"

  @62020 @validateFieldsInReadOrViewModeAtInternalContacts-myOrganizationContact @smoke   @positive
  Scenario: Validate fields is in read mode only at internal contacts
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "Automation Internal Contacts" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "Automation Internal Contacts" inside flex table with id "{grantee_tableId:InternalContacts}"
    Then I see field "First Name" as "Automation" on modal

  @62020 @validateContactInformation-myOrganizationContact @smoke   @positive
  Scenario: Validate contact information at Internal contact page details
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contact"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    Then I see field "First Name" as "{SavedValue:firstName}" on modal
    Then I see field "Last Name" as "Contact" on modal
    Then I see field "Office Phone" as "(012) 345-6789" on modal
    Then I see field "Email" as "automationtestrecord@yopmail.com" on modal
    Then I see field "Street" as "1000 Defense Pentagon" on modal
    Then I see field "State" as "DC" on modal
    Then I see field "Zip Code" as "41102" on modal
    Then I see field "City" as "Washington" on modal
    Then I see field "Last Modified By" as "{SavedValue:GRANTEE ADMIN Username}" on modal
    Then I see field "Created By" as "{SavedValue:GRANTEE ADMIN Username}" on modal
    When I click "Test Automation Organization" lookup link
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "Test Automation Organization" in the page details

  @62020 @validateContentOnMouseHoverAtInternalContactLookupLink-myOrganizationContact  @positive
  Scenario Outline: Validate content of mini page layout on mouse hovering at created by look up link under Internal contact detail page
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contact"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I hover mouse on "Last Created By" lookup link "{SavedValue:GRANTEE ADMIN Username}"
    Then I see "<miniPageLayout_Text>" shown inside mini page layout on hover

    Examples:
      | miniPageLayout_Text                 |
      | {SavedValue:GRANTEE ADMIN Username} |

  @62019 @validateInternalContactsFunctionalityUsingMultipleUsers-myOrganizationContact @smoke    @positive @wip @waitingForchange
  Scenario Outline: Validate different users can access Internal contact detail page
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contact"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    Then I see the header is "Contact" in the page details
    Then I see the sub-header is "{SavedValue:firstName} Contact" in the page details

    Examples:
      | userType      |
      | GRANTEE ADMIN |
      | GRANTEE PM    |
      | GRANTEE PO    |
      | GRANTEE FO    |
      | GRANTEE EXE   |

  @62029 @validateAddingOfInternalContact-myOrganizationContact @smoke  @positive
  Scenario Outline: Validate addition of contact for Internal Contact
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "My Organization’s Contact"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "<organizationName>" into field "fieldAccountId"
    When I click on "Save" in the page details
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    Then I softly see value "AutomationUser" for title "Title" inside table "{grantee_tableId:InternalContacts}"
    When I click on "View" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    Then I see field "First Name" as "{SavedValue:firstName}" on modal
    Then I see field "Last Name" as "Contact" on modal
    Then I see field "Street" as "1000 Defense Pentagon" on modal

    Examples:
      | userType      | organizationName             |
      | GRANTEE ADMIN | Test Automation Organization |
      | GRANTEE PM    | Test Automation Organization |
      | GRANTEE PO    | Test Automation Organization |
      | GRANTEE FO    | Test Automation Organization |
      | GRANTEE EXE   | Test Automation Organization |

  @62033 @validateContactAndAddressFieldsEditableForInternalContacts   @positive
  Scenario Outline: Validate different users can edit Internal contacts and address fields at Internal contact detail page
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "Edit" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I enter value "(987) 654-3210" into field "fieldMobilePhone"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click modal button "Save"
    Then I see field "Street" as "Automation Address Test" on modal
    Then I see field "Mobile Phone" as "(987) 654-3210" on modal

    Examples:
      | userType      |
      | GRANTEE ADMIN |
#      | GRANTEE PM    |
#      | GRANTEE PO    |
#      | GRANTEE FO    |
#      | GRANTEE EXE   |

  @62033 @validateModifiedByAndModifiedDateGettingUpdatedAfterEditingInternalContacts  @positive
  Scenario Outline: Validate modified by and modified date getting updated after editing fields or creating new contacts at Internal federal contact table
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "Edit" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I enter value "Automation Address Test" into field "fieldMailingStreet"
    And I click modal button "Save"
    Then I see field "Last Modified By" as "<userName>" on modal
    And I save the field labeled "Last Modified Date" as "ModifiedDate"
    Then I softly see field "{SavedValue:ModifiedDate}" contains todays date withTime

    Examples:
      | userType      | userName                            |
      | GRANTEE ADMIN | {SavedValue:GRANTEE ADMIN Username} |
      | GRANTEE PM    | {SavedValue:GRANTEE PM Username}    |
      | GRANTEE PO    | {SavedValue:GRANTEE PO Username}    |
      | GRANTEE FO    | {SavedValue:GRANTEE FD Username}    |
      | GRANTEE EXE   | {SavedValue:GRANTEE EXE Username}   |

  @62033 @validateDeletionOfContactUnderInternalContact @smoke  @positive
  Scenario: Validate  deletion of contact from internal contact table
    Given I login to "As a Grantee" app as "GRANTEE ADMIN" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I pause execution for "5" seconds
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "Delete" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "AutomationUser" in "{grantee_tableId:InternalContacts}" panel
    Then I do not see value "AutomationUser" for title "Title" inside table "{grantee_tableId:InternalContacts}"

  @62033 @validateRecordEditedByOwnerOnlyForInternalContact  @positive
  Scenario Outline: Validate contact record owner able to edit their profiles using created by field at Internal contact detail page
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I re-login as "<userType>" user on "default" portal
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I pause execution for "3" seconds
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType      | userName                            |
      | GRANTEE ADMIN | {SavedValue:GRANTEE ADMIN Username} |
      | GRANTEE EXE   | {SavedValue:GRANTEE EXE Username}   |
      | GRANTEE PM    | {SavedValue:GRANTEE PM Username}    |

  @62033 @validateRecordEditedByAdminForAllUsersAtInternalContacts  @positive
  Scenario Outline: Validate contact record edited by admin for all profiles using created by field at Internal contact
    Given I login to "As a Grantee" app as "<userType>" user
    When I navigate to "Home" tab
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    And I click on top right button "New" in flex table with id "{grantee_tableId:InternalContacts}"
    When I enter "InternalContactCorrectData" values from "Field_Values.xlsx"
    When I enter value "Test Automation Organization" into field "fieldAccountId"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    And I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "{grantee_sidebar:InternalContact}" content inside "{grantee_sidebar:ContactSubheaderName}" subheader on left panel
    And I click toggle button to select "All Contacts"
    When I perform quick search for "{SavedValue:firstName}" in "{grantee_tableId:InternalContacts}" panel
    When I click on "View" icon for "AutomationUser" inside flex table with id "{grantee_tableId:InternalContacts}"
    When I click "<userName>" lookup link
    When I click on "Edit" in the page details
    When I enter value "Admin Address" into field "fieldAboutMe__c"
    When I click on "Save" in the page details
    Then I softly see field "About Me" as "Admin Address"

    Examples:
      | userType    | userName                          |
      | GRANTEE EXE | {SavedValue:GRANTEE EXE Username} |
      | GRANTEE PM  | {SavedValue:GRANTEE PM Username}  |