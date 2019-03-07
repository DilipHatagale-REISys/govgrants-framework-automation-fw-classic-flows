@home
Feature: Validate all scenarios in the home tab

  	@35024 @internalOrganizationCreate @InternalOrganization @home @all
  	Scenario: Verifying if the Admin has create access to Internal Organization
  	Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    When I click toggle button to select "Draft Internal Organizations"
    And I click on top right button "New" in flex table with id "inlineEditGridInternalOrganizationHierarchy"
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status
    
  	@35637 @internalOrganizationEdit @InternalOrganization @home @all
  	Scenario Outline: Verifying if the Admin has edit access to Internal Organization
    Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal Organizations" content inside "Manage Organizations" subheader on left panel
    When I click on "View" icon for "<Organization name>" inside flex table with id "OrganizationId"
    When I click on "Edit" in the page details
    When I enter value "Automation" into field "Abbreviation__c"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status
	Examples:
	| Organization name 				    |
	| Internal Automation Organization Test |
	
	@35024 @internalOrganizationView @internalOrganization @home @all
	Scenario Outline: Validate whether all users have view access to Internal Organization
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	When I click on "View" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	Then I see that "Internal Organization" is in "Active" status
	Examples:
	|User   |
	| ADMIN |
	| EXE   |
	| PM    |
	
	@internalOrganizationADMINEdit @internalOrganization @home @all
	Scenario Outline: Validate system allows Edit access to Internal Organizations to the ADMIN/DA
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	When I pause execution for "5" seconds
	Then I can see row level action button "Edit" against "Behavioral Healthcare, Developmental Disabilities and Hospitals" in flex table with id "inlineEditGridInternalOrganizationHierarchy" 
	Examples:
	| User  |
	| ADMIN |
	
	@internalOrganizationPMEdit @internalOrganization @home @all
	Scenario: Verify whether the PM profiles can Edit their own Organizations
	Given I login to "As a Grantor" app as "SIMON PM" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	When I pause execution for "5" seconds
	Then I can see row level action button "Edit" against "Department of Health" in flex table with id "inlineEditGridInternalOrganizationHierarchy" 
	
	@subrecipientOrganizationView @subrecipients @organization @home @all
	Scenario Outline: Validate whether all users have view access to Subrecipient Organization
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
	And I click on "View" icon for "Bankers Small Business Community Development Corporation Of California" inside flex table with id "ActiveAccount"
	Then I see that "Subrecipient Organization" is in "Active" status
	Examples:
	| User  |
	| ADMIN |
	| EXE 	|
	| PM 	|
	
	@activeSubrecipientOrganizationsView @subrecipients @organization @home @all
	Scenario Outline: Validate whether all users have view access to Active Individual Subrecipients
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
	When I click on "View" icon for "Pankaj Nelli" inside flex table with id "ActiveAccountIndApplicant"
	Then I see that "Name" is in "Active" status
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM    |
	
	@activeIndividualSubrecipientsEdit @subrecipients @organization @home @all
	Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Individual Subrecipients
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
	Then I can see row level action button "Edit" against "Pankaj Nelli" in flex table with id "ActiveAccountIndApplicant" 
	Examples:
	| User  |
	| ADMIN |
	| DA	|
	
	@activeSubrecipientOrganizationsEdit @subrecipients @organization @home @all
	Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Subrecipient Organizations
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
	When I pause execution for "5" seconds
	Then I can see row level action button "Edit" against "Bankers Small Business Community Development Corporation Of California" in flex table with id "ActiveAccount" 
	Examples:
	| User  |
	| ADMIN |
	
	@internalContactsView @internal @contacts @home @all
	Scenario Outline: Validate whether all users have view access to Contacts
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Contacts" subheader on left panel 
	When I perform quick search for "Jane Doe" in "flexTableRandomID" panel
	And I click on "View" icon for "Jane Doe" inside flex table with id "flexTableRandomID"
	Then I see field "Status" as "Active"		
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@internalContactsCreate @internal @contacts @home @all
	Scenario Outline: Verify that Internal contacts are accessible across agencies and can be created by any Internal user
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Contacts" subheader on left panel
	When I click on top right button "New" in flex table with id "flexTableRandomID"
	And I enter "Creation" values from "InternalContact_Field_Values.xlsx"
	When I click on "Save" in the page details 
	Then I see field "Status" as "Active"	
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@internalContactsEdit @internal @contacts @home @all
	Scenario Outline: Validate system allows edit access to Contacts to all Internal Users
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Contacts" subheader on left panel
	Then I can see row level action button "Edit" against "Jane Doe" in flex table with id "flexTableRandomID" 
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@subrecipientContactsCreate @subrecipients @contacts @home @all
	Scenario Outline: Verifying if the Internal Users has create access to Subrecipient Contact
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel 
	When I click on top right button "New" in flex table with id "flexTableRandomID" 
	And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
	When I click modal button "Save"
	And I perform quick search for "Virat Kong" in "flexTableRandomID" panel 
	Then I see value "Active" for title "Status" inside table "flexTableRandomID"
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@smeReviewersContactView @smeReviewers @contacts @home @all
	Scenario Outline: Verifying all Internal Users has View access to SME Reviewers Contact
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
	Then I can see row level action button "View" against "Deepika Vanamala" in flex table with id "Reviewers" 			 
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@smeReviewersContactCreate @smeReviewers @contacts @home @all
	Scenario Outline: Verifying all Internal Users has Create access to SME Reviewers Contact
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel 
	When I click on top right button "New" in flex table with id "Reviewers" 
	And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
	When I click on "Save" in the page details
	And I perform quick search for "Staci Alley" in "Reviewers" panel 
	Then I see value "New" for title "Status" against the value "Staci Alley" inside table "Reviewers"
	Examples:
	| User  |
	| ADMIN |	
	
	@smeReviewersContactSendInviatation @smeReviewers @contacts @home @all
	Scenario Outline: Verify the system allows all Internal users to Send Invitation to SME Reviewer
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
	And I click on "Send Invitation" icon for "New SME" inside flex table with id "Reviewers"
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@activeSMEReviewersContactDetailPageView @smeReviewers @contacts @home @all
	Scenario Outline: Verify that system allows user to see the detail page of Active SME Reviewer contact 
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel 
	Then I can see row level action button "View" against "Kyle Farrell" in flex table with id "ActiveAccountReviewer" 	
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@termsandConditionsView @termsandConditions @manageTermsandConditions @home @all
	Scenario Outline: Verifying all Internal Users has View access to Terms and Conditions
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel 
	When I perform quick search for "TC-5842" in "MasterTermConditions" panel 	 
	Then I can see row level action button "View" against "TC-5842" in flex table with id "MasterTermConditions" 	
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	
	@termsAndConditionsCreate @termsandConditions @manageTermsandConditions @home @all
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
	
	@termsAndConditionsADMINedit @termsandConditions @manageTermsandConditions @home @all
	Scenario Outline: Verifying if the ADMIN has Edit access to Terms and Conditions
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
	When I perform quick search for "TC-8115" in "MasterTermConditions" panel 
	Then I can see row level action button "Edit" against "TC-8115" in flex table with id "MasterTermConditions" 
	 Examples:
	| User  |
	| ADMIN |
	
	@einRegistrationView @einRegistration @usefulLinks @home @all
	Scenario Outline: Validate whether all users have view access to EIN Registration
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	Then I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM	|
	
	@dunsRegistrationView @dunsRegistration @usefulLinks @home @all
	Scenario Outline: Validate whether all users have view access to DUNS Registration
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	Then I navigate to "DUNS Registration" content inside "Useful Links" subheader on left panel
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM	|
	
	@samgovRegistrationView @samgovRegistration @usefulLinks @home @all
	Scenario Outline: Validate whether all users have view access to SAM.gov Registration
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	Then I navigate to "SAM.gov Registration" content inside "Useful Links" subheader on left panel
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM	|
	
	@contactUsView @contactUs @technicalSupport @home @all
	Scenario Outline: Validate whether all users have view access to Contact Us
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	Then I navigate to "Contact Us" content inside "Technical Support" subheader on left panel
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM 	|
	| SPI   |
	| SPA   |
	

	@internalOrganizationEdition @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Edit the Internal Organization
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
    And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	And I enter "Edition" values from "InternalOrganization_Field_Values.xlsx"
	When I click on "Save" in the page details
	Then I see that "Internal Organization" is in "Active" status
	Examples:
	|User |
	|ADMIN|
	
	@subrecipientOrganizationEdition @subrecipients @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Edit the Subrecipient Organization
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
	And I perform quick search for "CASA FAMILIAR, INC" in "ActiveAccount" panel
	When I click on "Edit" icon for "CASA FAMILIAR, INC" inside flex table with id "ActiveAccount"
	And I enter "Edition" values from "SubrecipientOrganization_Field_Values"
	When I click on "Save" in the page details
	Then I see that "Subrecipient Organization" is in "Active" status
	Examples:
	|User|
	|ADMIN|
	
	@internalContactsEdition @internal @contacts @home @all
	Scenario Outline: Validate whether all Internal Users can edit the Contact
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Contacts" subheader on left panel
	And I perform quick search for "Jane Doe" in "flexTableRandomID" panel
	When I click on "Edit" icon for "Jane Doe" inside flex table with id "flexTableRandomID"
	And I enter "Edition1" values from "InternalContact_Field_Values.xlsx"
	And I click modal button "Save"
    When I close Modal
    And I perform quick search for "Jane Doe" in "flexTableRandomID" panel
	Then I see value "Active" for title "Status" inside table "flexTableRandomID"
	Examples:
	| User   |
	| ADMIN  |
	| EXE    |
	| PM 	 |
	
	@subrecipientContactsEdition @subrecipients @contacts @home @all
	Scenario Outline: Verifying if the Internal Users has Edit access to Subrecipient Contact
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
	When I perform quick search for "Bet Time" in "flexTableRandomID" panel 
	When I click on "Edit" icon for "Bet Time" inside flex table with id "flexTableRandomID"			
	And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
	And I click modal button "Save"
    And I perform quick search for "Bet Time" in "flexTableRandomID" panel
	Then I see value "Active" for title "Status" against the value "Bet Time" inside table "flexTableRandomID"
	Examples:
	| User   |
	| ADMIN  |	
		
	@smeReviewersContactEdition @smeReviewers @contacts @home @all
	Scenario Outline: Verifying all Internal Users has Edit access to SME Reviewers Contact
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel 
	When I perform quick search for "Deepika Vanamala" in "Reviewers" panel 
	And I click on "Edit" icon for "Deepika Vanamala" inside flex table with id "Reviewers"			
	When I enter "Edition" values from "PotentialReviewersContact_Field_values.xlsx"
	And I click on "Save" in the page details				
	Then I see value "Invitation Sent" for title "Status" inside table "Reviewers"
	Examples:
	| User   |
	| ADMIN  |
	| EXE    |
	| PM     |
			
	@additionalAddressesCreation @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Create the Additional Addresses
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	And I click on top right button "New" in flex table with id "AdditionalAddressInternal"
	And I enter "AdditionalAddressesCreation" values from "InternalOrganization_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	Then I see that "Internal Organization" is in "Active" status
	Examples:
	|User|
	|ADMIN|
	
	
	@additionalAddressesEdition @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Edit the Additional Addresses 
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	When I perform quick search for "Services" in "AdditionalAddressInternal" panel 
	And I click on "Edit" icon for "Services" inside flex table with id "AdditionalAddressInternal"			
	When I enter "Edition" values from "PotentialReviewersContact_Field_values.xlsx"
	And I enter "AdditionalAddressesEdition" values from "InternalOrganization_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	Then I see that "Internal Organization" is in "Active" status
	Examples:
	|User|
	|ADMIN|
	
	@relatedContactsCreation @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Create the Related Contact
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	And I click on top right button "New" in flex table with id "RelatedContacts"
	And I enter "RelatedContactsCreation" values from "InternalOrganization_Field_Values.xlsx"
	And I click modal button "Save"
	When I close Modal
	Then I see values "Jim Cobat" and "FullName" inside table 
	Examples:
	|User|
	|ADMIN|
	
	
	@relatedContactsEdition @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Edit the Related Contact
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	When I perform quick search for "Jerry Smith" in "RelatedContacts" panel 
	And I click on "Edit" icon for "Jerry Smith" inside flex table with id "RelatedContacts"			
	When I enter "RelatedContactsEdition" values from "InternalOrganization_Field_Values.xlsx"
	And I click modal button "Save"
	And I click on "Save" in the page details
	Then I see that "Internal Organization" is in "Active" status
	Examples:
	|User |
	|ADMIN|
		
	@deleteRelatedContacts @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Delete the Related Contact
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	When I perform quick search for "Automation EXE" in "RelatedContacts" panel 
	And I click on "Delete" icon for "Automation EXE" inside flex table with id "RelatedContacts"			
	Then I do not see value "Automation EXE" for title "Full Name" inside table "RelatedContacts"
	Examples:
	|User |
	|ADMIN|
		
	@dunsNumberCreation @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can create the DUNS Number
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	When I enter the following values into flex table with id "flexGridRelatedDUNS" by clicking "New" : 
	|DUNS Number  | Registered Entity Name|Location | 
	| 123478657   | Test1                 | Herndon | 
	 And I click on top right button "Save" in flex table with id "flexGridRelatedDUNS" 
	Then I see values "123478657" and "DUNSNumber" inside table 
	Examples:
	|User |
	|ADMIN|
	
	@dunsNumberEdition @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can Edit the DUNS NUmber
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	When I click on "Edit" icon for "234523524" inside flex table with id "flexGridRelatedDUNS" 
	And I click on top right button "Save" in flex table with id "flexGridRelatedDUNS" 
	Then I see values "234523524" and "DUNSNumber" inside table 
	Examples:
	|User |
	|ADMIN|
	
	@deleteDUNSNumber @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can delete the DUNS Number
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	When I click on "delete" icon for "234523524" inside flex table with id "flexGridRelatedDUNS" 
	Then I do not see values "234523524" and "DUNSNumber" inside table 
	Examples:
	|User |
	|ADMIN|
	
	
	@childOrganizations @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether all users have view access to Child Organizations
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	When I click on "View" icon for "Eleanor Slater Hospital" inside flex table with id "GranteeChildOrganizations" 
	Then I see that "Internal Organization" is in "Active" status
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM	|
	
	@deleteIndirectCostRate @internalOrganizationEdit @internalOrganization @organization @home @all
	Scenario Outline: Validate whether ADMIN and DA users can delete the Indirect Cost Rates
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	And I perform quick search for "Behavioral Healthcare, Developmental Disabilities and Hospitals" in "inlineEditGridInternalOrganizationHierarchy" panel
	When I click on "Edit" icon for "Behavioral Healthcare, Developmental Disabilities and Hospitals" inside flex table with id "inlineEditGridInternalOrganizationHierarchy"
	And I perform quick search for "New IDC" in "inlineEditGridIndirectRateGrid" panel
	When I click on "Delete" icon for "New IDC" inside flex table with id "inlineEditGridIndirectRateGrid" 
	Then I do not see values "New IDC" and "Title" inside table 
	Examples:
	|User |
	|ADMIN|
	