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
      | Your registration request for access to the EGMS has been completed.  You will be sent an email from salesforce.com (technology platform provider) with your Username and Password.|
