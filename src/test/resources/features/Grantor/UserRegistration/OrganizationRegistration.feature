@organizationRegistrationPage @userRegistration @parallel-regression @regression @grantor-regression @regression
Feature: Validate all registration related scenarios

  @81962 @verifyDownloadOptionOpensInNewWindow-Organization @monu
  Scenario:Verify if user clicks on download option inside Attachment section new tab getting opened
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Files" sub tab
    And I upload attachment "Attachment.pdf" of type "Parent/Child Legal Documents" from computer
    #And I upload attachment "AttachmentTesting.pdf" of type "Parent/Child Legal Documents"
    And I pause execution for "3" seconds
    And I refresh the page
    When I click on "Download" icon for "Attachment.pdf" inside table
    Then I softly see new tab is opened

  @82051 @verifyEnteredValueOfPaymentAddressSection-Organization @monu
  Scenario:Verify entered details is visible in edit mode of fields if user selected NO as in Same as organization Address field
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
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
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Country is required to save under Organization Profile.        |
      | Address line 1 is required to save under Organization Profile. |
      | Zip Code is required to save under Organization Profile.       |
      | State is required to save under Organization Profile.          |

  @82053 @verifyVisibilityOfPaymentAddressFields-Organization @monu
  Scenario:Verify user should not be able to see Expected fields of payment address if same organization address field is selected as yes
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
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
    And I generate the random SSN and save as "ssnID"
    When I enter value as "{SavedValue:ssnID}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #82790
    Then I softly see field "Primary Email" as "{SavedValue:uniqueEmailID}"
    Then I see "Mr." text enter in field "fieldPrimaryRepPrefix__c"
    Then I see "{SavedValue:Automation Runtime}" text enter in field "fieldPrimaryRepFirstName__c"
    Then I see "User" text enter in field "fieldPrimaryRepLastName__c"
    Then I see "Automation Representative" text enter in field "fieldPrimaryRepAddress1__c"
    Then I see "Washington" text enter in field "fieldPrimaryRepCity__c"
    Then I see "20301" text enter in field "fieldPrimaryRepZipCode__c"
    Then I see "USA" text enter in field "fieldPrimaryRepCountry__c"

  @82797 @verifyVisibilityOfFieldsAtPaymentAddressSection-Individual @monu
  Scenario:Verify user is not able to see any fields after selection of Same as organization fields to yes inside payment details page block
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "ssnID"
    When I enter value as "{SavedValue:ssnID}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "fieldSameAsOrganizationAddress__c"
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
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
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
    And I generate the random EIN and save as "EIN"
    When I enter value as "{SavedValue:EIN}" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    Then I see the ReCaptcha input box

  @82030 @verifyEmailNotificationForOrganizationRegistration-Organization @monu @wip
  Scenario:Verify user should be able to see email notificatio after queued email is approved
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
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
    And I generate the random SSN and save as "ssnID"
    When I enter value as "{SavedValue:ssnID}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    Then I see the header is "Create External Registration" in the page details
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
    Then I see the text containing "Registration"
    Then I see the sub-header is "Step 1 of 2" in the page details

  @33827 @verifySavedDetailsOfOrganizationProfileSubTab-Organization @monu
  Scenario:Verify user should be able to see filled details at organization sub tab after redirecting back to organization profile tab while clicking on back button
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456789" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    Then I see the header is "Create External Registration" in the page details
#    Then I see the sub-header is "Step 3 of 3" in the page details
    When I click on "Back" in the page details
    Then I see "Yes" text enter in field "fieldSameAsOrganizationAddress__c"
    Then I see "For-profit organizations" text enter in field "fieldOrganizationTypeSInglePicklist__c"
    Then I see "(918) 908-9089" text enter in field "fieldOrgnizationPhoneNumber__c"
    Then I see "www.google.com" text enter in field "fieldWebsite__c"
    Then I see "Vintage Plaza" text enter in field "fieldOrganizationStreetAddress__c"
    Then I see "Prince George" text enter in field "fieldCounty__c"
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
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see field "Unique Entity Identifier (UEI)" as "{SavedValue:UEI}"
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
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "No" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details

  @82028 @verifyOrganizationDetailPageDuringApproval-Organization @monu
  Scenario:Verify if user can see organization detail page while approval
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "User Profile" sub tab at view detail page
    Then I softly can see "Collab" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page

  @82796 @83035 @verifyConfirmationMessage-Individual @meenakshi
  Scenario:To validate Confirmation Message, after clicking Submit button on Catcha page of Individual registration process
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "ssnID"
    When I enter value as "{SavedValue:ssnID}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    Then I softly see field "Primary Email" as "{SavedValue:uniqueEmailID}"
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I enter "CreationWithOnlyPaymentDetail" values from "UserRegistration_Field_Values.xlsx"
    Then I see "No" text enter in field "fieldSameAsOrganizationAddress__c"
    Then I see "1000 Defense Pentagon" text enter in field "fieldPaymentAddressLine1__c"
    Then I see "Washington" text enter in field "fieldPaymentAddressCity__c"
    Then I see "IL" text enter in field "fieldPaymentAddressState__c"
    Then I see "20301" text enter in field "fieldPaymentAddressZipCode__c"
    Then I see "(918) 908-9089" text enter in field "fieldPaymentAddressVendorLocation__c"
    Then I see "1234" text enter in field "fieldPaymentAddressZipCode4__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system.                                                                                                                                                                |
      | For your records, your registration number is |

  @84611 @83374 @83527 @84612 @83373 @84613 @validateSAUserforUserRegistration-Organization @meenakshi
  Scenario:To verify SA allow to modify newly created contact in contact table  for Additional user registration process
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    #    TODO: Extra Save step to be removed after bug-237206
    And I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:AUTOMATION RUNTIME Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:AUTOMATION RUNTIME Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Welcome to Recipient Portal"
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #84613 #monu
    Then I see only the following ordered options in dropdown field "fieldContactType__c" :
      | --None-- | Agency Director | Fiscal Manager | Program Director | Program Fiscal Contact | Grants Manager | Legal Contact |
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I close "New Contact" modal by clicking the top right x button
    And I click on "Edit" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I enter value "(704) 777-7869" into field "fieldPhone"
    #83374
    And I enter value "automation.manager@yopmail.com" into field "fieldEmail"
    When I click on "Save" in the page details
    #When I close "Edit" modal by clicking the top right x button
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
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:AUTOMATION RUNTIME Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:AUTOMATION RUNTIME Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "Auto@yopmail.com"
    And I pause execution for "20" seconds
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
    And I generate the random SSN and save as "ssnID"
    When I enter value as "{SavedValue:ssnID}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    Then I softly see field "Primary Email" as ""{SavedValue:uniqueEmailID}"
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

  @83539 @validatingRegistrationLegalDisclaimer1of2 @monu
  Scenario:To verify after sending Invitation for created contact , user is able to see Registration Legal Disclaimer 1 of 2 page on click of click here link
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:AUTOMATION RUNTIME Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:AUTOMATION RUNTIME Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Welcome to Recipient Portal"
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I close "New Contact" modal by clicking the top right x button
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:userContactsTableId---" panel
    #83535 #monu
    Then I softly see value "{SavedValue:Automation Runtime Contact}" for title "Full Name" inside table "---home:-:userContactsTableId---"
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    #83533 #monu
    Then I softly see value "Invitation Sent" for title "Status" inside table "---home:-:userContactsTableId---"
    And I click modal button "Send"
    When I close "Send Invitation" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "20" seconds
    And I navigate to yopmail portal for "AutomationManager@yopmail.com"
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details

  @83531 @validatingEditingOfContact @monu @CaptchaIssueOnYopmail
  Scenario:To verify user is able to edit phone number of newly created contact
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:AUTOMATION RUNTIME Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:AUTOMATION RUNTIME Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Welcome to Recipient Portal"
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    #83528 #monu
    Then I see "Automation Runtime Organization" text enter in field "fieldAccountId"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the contact name as "Automation Runtime Contact"
    When I close "New Contact" modal by clicking the top right x button
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:userContactsTableId---" panel
    #83532 #monu
    Then I softly see "Full Name" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Role" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Email" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Phone" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Status" in flex table header "---home:-:userContactsTableId---"
    Then I softly see "Is User" in flex table header "---home:-:userContactsTableId---"
    Then I softly see value "{SavedValue:Automation Runtime Contact}" for title "Full Name" inside table "---home:-:userContactsTableId---"
    Then I softly see value "Primary" for title "Role" inside table "---home:-:userContactsTableId---"
    Then I softly see value "{SavedValue:uniqueEmailID}" for title "Email" inside table "---home:-:userContactsTableId---"
    Then I softly see value "704-777-(7868)" for title "Status" inside table "---home:-:userContactsTableId---"
    Then I softly see value "Active" for title "Status" inside table "---home:-:userContactsTableId---"
    Then I softly can see row level action button "Send Invitation" against "True" in flex table with id "---home:-:userContactsTableId---"
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I enter value "704-777-(7869)" into field "fieldPhone"
    When I click on "Save" in the page details
    #When I close "Edit" modal by clicking the top right x button
    Then I softly see value "Invitation Sent" for title "Status" inside table "---home:-:userContactsTableId---"
    #80530 #monu
    And I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    Then I softly see field "Type" as "Recipient"
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Address Information" page block displayed
    Then I softly see "System Information" page block displayed

  @84614 @validateRolesDropdownValues-Organization @monu @CaptchaIssueOnYopmail
  Scenario:To verify while creating new contacts for Activated users, roles picklist having all expected values
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:AUTOMATION RUNTIME Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:AUTOMATION RUNTIME Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Welcome to Recipient Portal"
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    Then I see only the following ordered options in dropdown field "fieldUserRole__c" :
      | --None-- | Non-User | Secondary | Primary |

  @85781 @validatePlaceOfPerformanceFieldsWRTOrganizationFields-Organization @monu @CaptchaIssueOnYopmail
  Scenario:Verify place of performance fields while creating organization user is getting populated to created application by same user
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:AUTOMATION RUNTIME Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:AUTOMATION RUNTIME Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "220" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Welcome to Recipient Portal"
    Then I set password for the user
    And I navigate to "Home" tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI4" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Address line 1" as "Sterling"
    Then I softly see field "Zip Code" as "20171"
    Then I softly see field "State" as "VA"
    #85783 #monu
    When I click on "Edit" in the page details
    And I enter value "20172" into field "fieldZip4__c"
    When I click on "Save" in the page details
    Then I softly see field "Zip Code" as "20172"

  @222890 @ValidateEXEuserfromuserregistrationapprovalqueueshouldnotabletoseethereassigntaskofOrganizationRegistrationApprovalinReassignTask
  Scenario: Validate EXE user from user registration approval queue should not able to see the reassign task of Organization Registration Approval in Reassign Task
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    #    TODO: Extra Save step to be removed after bug-237206
    And I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "Review Organization User Registration" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"

  @223042 @ValidateAdminusershouldnotabletoseethereassigntaskofOrganizationRegistrationApprovalfrommytaskAsaAdmin @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Admin user should not able to see the reassign task of Organization Registration Approval from my task As a Admin
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    #    TODO: Extra Save step to be removed after bug-237206
    And I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "Review Organization User Registration" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"

  @223512 @ValidatePMuserfromuserregistrationapprovalqueueshouldnotabletoseethereassigntaskofIndividualRegistrationApprovalinReassignTask @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user from user registration approval queue should not able to see the reassign task of Individual Registration Approval in Reassign Task
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "ssnID"
    When I enter value as "{SavedValue:ssnID}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system. |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:UserFullName}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "Review Individual User Registration" for title "Task Type" inside table "---program:-:grantorTaskReassignTableId---"

  @223616 @ValidateAdminusershouldnotabletoseethereassigntaskofIndividualRegistrationApprovalfromAllTasksAsaAdmin @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Admin user should not able to see the reassign task of Individual Registration Approval from All Tasks As a Admin
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "ssnID"
    When I enter value as "{SavedValue:ssnID}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system. |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    And I save the value from row "1" for column name "Full Name" as "UserFullName" from flex table "{grantor_tableId:SubrecipientIndRegistration}"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:UserFullName}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "Review Individual User Registration" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"

  @222975 @223047 @ValidateAdminusershouldnotabletoseethereassigntaskofParent/ChildrelationshipApprovalfromAlltasksAsaAdmin @sprint-12-US-226646 @vaibhav @reassignment @CaptchaIssueOnYopmail
  Scenario: Validate Admin user should not able to see the reassign task of Parent/Child relationship Approval from All tasks As a Admin
    Given I begin "Organization" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    #    TODO: Extra Save step to be removed after bug-237206
    And I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "220" seconds
    And I refresh the page
    And I click on mail with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I click on "Associate Parent Organization" in the page details
    And I enter "parentOrg" values from "UserRegistration_Field_Values.xlsx"
    When I upload attachment "Announcement_Field_Values.xlsx" of type "Program Artifacts"
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---closeout:-:homePendingTaskTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Organization}" for title "EGMS ID" inside table "{grantee_tableId:SubrecipientOrganization}"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "{SavedValue:Automation Runtime Organization}" for title "EGMS ID" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly do not see value "Review Parent/Child Organization Relationship Request" for title "Task Type" inside table "---program:-:adminTaskReassignmentTableId---"