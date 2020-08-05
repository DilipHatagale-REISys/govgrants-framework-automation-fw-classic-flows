@organizationRegistrationPage @userRegistration @parallel-regression @regression @grantor-regression
Feature: Validate all registration related scenarios

  @81962 @verifyDownloadOptionOpensInNewWindow-Organization @monu
  Scenario:Verify if user clicks on download option inside Attachment section new tab getting opened
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Attachments" sub tab
    And I upload attachment "AttachmentTesting.pdf" of type "Parent/Child Legal Documents"
    And I pause execution for "3" seconds
    And I refresh the page
    When I click on "Download" icon for "AttachmentTesting.pdf" inside table
    Then I softly see new tab is opened

  @82051 @verifyEnteredValueOfPaymentAddressSection-Organization @monu
  Scenario:Verify entered details is visible in edit mode of fields if user selected NO as in Same as organization Address field
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithOnlyPaymentDetail" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see "No" text enter in field "fieldSameAsOrganizationAddress__c"
    Then I see "1000 Defense Pentagon" text enter in field "fieldPaymentAddressLine1__c"
    Then I see "Washington" text enter in field "fieldPaymentAddressCity__c"
    Then I see "DC" text enter in field "fieldPaymentAddressState__c"
    Then I see "20301" text enter in field "fieldPaymentAddressZipCode__c"
    Then I see "(918) 908-9089" text enter in field "fieldPaymentAddressVendorLocation__c"
    Then I see "1234" text enter in field "fieldPaymentAddressZipCode4__c"

  @82052 @verifyErrorMessageForPaymentAddressSectionFields-Organization @monu
  Scenario:Verify user is able to see error message after filling all details except Payment address section
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Provide Address Line 1 for Payment Address                             |
      | Provide City for Payment Address                                       |
      | Provide State for Payment Address                                      |
      | Provide Zip Code for Payment Address                                   |
      | You must enter an effective date when selecting a parent organization. |

  @82053 @verifyVisibilityOfPaymentAddressFields-Organization @monu
  Scenario:Verify user should not be able to see Expected fields of payment address if same organization address field is selected as yes
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    Then I softly see fields "fieldPaymentAddressLine1__c" is not visible
    Then I softly see fields "fieldPaymentAddressCity__c" is not visible
    Then I softly see fields "fieldPaymentAddressState__c" is not visible
    Then I softly see fields "fieldPaymentAddressZipCode__c" is not visible

  @82787 @82790 @verifyPrimaryRepresentativeDetails-Individual @monu
  Scenario:Verify user is able to see filled details on Primary Representative detail page while individuals registration
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Social Security Number (SSN)" on old form
    When I enter value as "IndividualRegistration@yopmail.com" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    #82790
    Then I softly see field "Primary Email" as "individualregistration@yopmail.com"
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see "Mr." text enter in field "fieldPrimaryRepPrefix__c"
    Then I see "Automation" text enter in field "fieldPrimaryRepFirstName__c"
    Then I see "User" text enter in field "fieldPrimaryRepLastName__c"
    Then I see "Automation Primary Representative" text enter in field "fieldPrimaryRepAddress1__c"
    Then I see "Washington" text enter in field "fieldPrimaryRepCity__c"
    Then I see "20301" text enter in field "fieldPrimaryRepZipCode__c"
    Then I see "1234" text enter in field "fieldPrimaryRepZipCode4__c"
    Then I see "USA" text enter in field "fieldPrimaryRepCountry__c"
    Then I see "Prince George’s" text enter in field "fieldCounty__c"

  @82797 @verifyVisibilityOfFieldsAtPaymentAddressSection-Individual @monu
  Scenario:Verify user is not able to see any fields after selection of Same as organization fields to yes inside payment details page block
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Social Security Number (SSN)" on old form
    When I enter value as "IndividualRegistration@yopmail.com" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    Then I softly see fields "fieldPaymentAddressLine1__c" is not visible
    Then I softly see fields "fieldPaymentAddressCity__c" is not visible
    Then I softly see fields "fieldPaymentAddressState__c" is not visible
    Then I softly see fields "fieldPaymentAddressZipCode__c" is not visible

  @82024 @verifyFilledDetailsPopulatedAtAuthorizedDetailsSection-Organization @monu
  Scenario:Verify user should be able to see filled details at organization address id getting populated at Authorized section
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I see "Vintage Plaza" text enter in field "fieldPrimaryRepAddress1__c"
    Then I see "Sterling" text enter in field "fieldPrimaryRepCity__c"
    Then I see "20171" text enter in field "fieldPrimaryRepZipCode__c"

  @82025 @verifyFilledDetailsAtAuthorizedRepresentativePage-Organization @monu
  Scenario:Verify user should be navigated to captch page after filling all details at authorised representative detail
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the ReCaptcha input box

  @82030 @verifyEmailNotificationForOrganizationRegistration-Organization @monu @wip
  Scenario:Verify user should be able to see email notificatio after queued email is approved
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I checkout to yopmail with mailid "AutomationOrganization@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Organization Registration for {SavedValue:RuntimeOrgName} has been Approved
      """
    Then I see the mail text is as follows :
      """
       {regconfirmationmailbody:mailbody}
      """

  @82784 @VerifyRegistrationPages2of2-Individual @monu
  Scenario:Verify user should be navigated to Registration step 2 of 2 after clicking on save button on registration step 1 of 2 page
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Social Security Number (SSN)" on old form
    When I enter value as "IndividualRegistration@yopmail.com" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 2 of 2" in the page details

  @82780 @VerifyRegistrationStep1of2-Individual @monu
  Scenario:Verify user should be navigated to Registration step 1 of 2 after clicking on Agree button on registration
    Given I begin "Individual" registration
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 2" in the page details

  @33827 @verifySavedDetailsOfOrganizationProfileSubTab-Organization @monu
  Scenario:Verify user should be able to see filled details at organization sub tab after redirecting back to organization profile tab while clicking on back button
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 3 of 3" in the page details
    When I click on "Back" in the page details
    Then I see "No" text enter in field "fieldSameAsOrganizationAddress__c"
    Then I see "For Profit Organizations" text enter in field "fieldOrganizationTypeSInglePicklist__c"
    Then I see "(918) 908-9089" text enter in field "fieldOrgnizationPhoneNumber__c"
    Then I see "www.google.com" text enter in field "fieldWebsite__c"
    Then I see "Vintage Plaza" text enter in field "fieldOrganizationStreetAddress__c"
    Then I see "Prince George’s" text enter in field "fieldCounty__c"
    Then I see "Sterling" text enter in field "fieldOrganizationCityAddress__c"
    Then I see "VA" text enter in field "fieldStateDropdownList__c"
    Then I see "USA" text enter in field "fieldOrganizationsCountry__c"
    Then I see "20171" text enter in field "fieldOrganizationZipCode__c"
    Then I see "(918) 908-9089" text enter in field "fieldPaymentAddressVendorLocation__c"
    Then I see "Yes" text enter in field "fieldSameAsOrganizationAddress__c"

  @81954 @verifyEINNumberAndDUNSNumberAtOrganizationProfileSubTab-Organization @monu
  Scenario:Verify user should be able to see filled details of EIN Number and DUNS Number at organization sub tab
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see field "Data Universal Number System (DUNS) #" as "987654321"
    Then I softly see field "Employer Identification Number (EIN)" as "123456789"

  @81952 @verifyRecipientPortalDetailsUnderContactUS @monu @wip
  Scenario:Verify user should be able to see details of recipient portal details under contact us sub tab
    Given I am on "SUBPORTAL" portal
    Then I softly see the text containing :
      | Office of Management and Budget |
      | 45335 Vintage Park Plaza,       |
      | Sterling, VA 20166              |
      | Phone: (703)-480-7600           |
      | Fax: (123) 123-4567             |

  @82027 @verifyRegisteredDetailsInsidePendingTask-Organization @monu @wip
  Scenario:Verify if user clicks on download option inside Attachment section new tab getting opened
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details

  @82796 @83035 @verifyConfirmationMessage-Individual @meenakshi
  Scenario:To validate Confirmation Message, after clicking Submit button on Catcha page of Individual registration process
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Social Security Number (SSN)" on old form
    When I enter value as "IndividualRegistration@yopmail.com" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    Then I softly see field "Primary Email" as "individualregistration@yopmail.com"
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter "CreationWithOnlyPaymentDetail" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see "No" text enter in field "fieldSameAsOrganizationAddress__c"
    Then I see "1000 Defense Pentagon" text enter in field "fieldPaymentAddressLine1__c"
    Then I see "Washington" text enter in field "fieldPaymentAddressCity__c"
    Then I see "DC" text enter in field "fieldPaymentAddressState__c"
    Then I see "20301" text enter in field "fieldPaymentAddressZipCode__c"
    Then I see "(918) 908-9089" text enter in field "fieldPaymentAddressVendorLocation__c"
    Then I see "1234" text enter in field "fieldPaymentAddressZipCode4__c"
    When I click on "Submit" in the page details
    Then I see the following messages in the page details contains:
      | Confirmation Message                                                                                                                                                                |
      | Your registration request for access to the EGMS has been completed.  You will be sent an email from salesforce.com (technology platform provider) with your Username and Password. |

  @84611 @83374 @83527 @84612 @83373 @validateSAUserforUserRegistration-Organization @meenakshi
  Scenario:To verify SA allow to modify newly created contact in contact table  for Additional user registration process
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Organization"
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "AutomationInternal@yopmail.com" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "AUTOMATION RUNTIME Organization" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "AUTOMATION RUNTIME Organization" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "AutomationInternal@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "AutomationInternal@yopmail.com"
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I close "New Contact" modal by clicking the top right x button
    And I click on "Edit" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I enter value "(704) 777-7869" into field "fieldPhone"
    #83374
    And I enter value "automation.manager@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    When I close "Edit" modal by clicking the top right x button
    Then I softly see value "(704) 777-7869" for title "Phone" inside table "---home:-:userContactsTableId---"
    Then I softly see value "automation.manager@yopmail.com" for title "Email" inside table "---home:-:userContactsTableId---"
    #83527
    And I click on "View" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I save the field labeled "Address Line 1" as "AddressLine1"
    And I save the field labeled "City" as "CityName"
    And I save the field labeled "Zip Code" as "ZipCode"
    And I save the field labeled "Country" as "CountryName"
    Then I softly see field "Address Line 1" as "{SavedValue:AddressLine1}"
    Then I softly see field "City" as "{SavedValue:CityName}"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    Then I softly see field "Country" as "{SavedValue:CountryName}"
    When I close "View" modal by clicking the top right x button
    #84612
    Then I softly can see row level action button "Edit" against "New" in flex table with id "---home:-:userContactsTableId---"
    Then I softly can see row level action button "View" against "New" in flex table with id "---home:-:userContactsTableId---"
    #83373
    Then I softly see value "Automation User" for title "Full Name" inside table "---home:-:userContactsTableId---"
    Then I softly see value "Primary" for title "Role" inside table "---home:-:userContactsTableId---"
    Then I softly see value "automation.manager@yopmail.com" for title "Email" inside table "---home:-:userContactsTableId---"
    Then I softly see value "(704) 777-7869" for title "Phone" inside table "---home:-:userContactsTableId---"

  @85792 @validateSAUserforUserRegistration-Organization @meenakshi
  Scenario:To verify SA allow to modify newly created contact in contact table  for Additional user registration process
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    When I enter value as "987654321" into "Data Universal Number System (DUNS) Number" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Organization"
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Auto@yopmail.com" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "AUTOMATION RUNTIME Organization" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "AUTOMATION RUNTIME Organization" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "Auto@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Organization Registration for AUTOMATIONRUNTIME Organization has Been Approved
      """

  @83038 @85790 @validatingApprovedStatusForIndividualRegistration @meenakshi
  Scenario:To verify after Approved record status changes as : Approved for Individual registration process
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Social Security Number (SSN)" on old form
    When I enter value as "IndividualRegistration@yopmail.com" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    Then I softly see field "Primary Email" as "individualregistration@yopmail.com"
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation User" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "Automation User" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    #85790
    And I checkout to yopmail with mailid "IndividualRegistration@yopmail.com"
    And I pause execution for "1" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Your EGMS Registration has Been Approved
      """