@home
Feature: Validate all scenarios in the home tab

  	@35024 @internalOrganizationCreate @InternalOrganization
  	Scenario: Verifying if the Admin has create access to Internal Organization
  	Given I login to "As Administrator" app as "Admin" user
    When I navigate to "Setup" tab
    And I navigate to "Internal" content inside "Organizations" subheader on left panel
    When I click toggle button to select "Draft Internal Organizations"
    And I click on top right button "New" in flex table with id "inlineEditGridInternalOrganizationHierarchy"
    When I enter "RequiredForSave" values from "InternalOrganization_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see that "State Organization" is in "Created" status
    
  	@35637 @internalOrganizationEdit @InternalOrganization
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
	
	@35024 @internalOrganizationView @internalOrganization @home
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
	
	@internalOrganizationADMINEdit @internalOrganization @home
	Scenario Outline: Validate system allows Edit access to Internal Organizations to the ADMIN/DA
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	When I pause execution for "5" seconds
	Then I can see row level action button "Edit" against "Behavioral Healthcare, Developmental Disabilities and Hospitals" in flex table with id "inlineEditGridInternalOrganizationHierarchy" 
	Examples:
	| User  |
	| ADMIN |
	| DA	|
	
	@internalOrganizationPMEdit @internalOrganization @home
	Scenario: Verify whether the PM profiles can Edit their own Organizations
	Given I login to "As a Grantor" app as "SIMON PM" user 
	When I navigate to "Home" tab
	And I navigate to "Internal" content inside "Organization" subheader on left panel
	When I pause execution for "5" seconds
	Then I can see row level action button "Edit" against "Department of Health" in flex table with id "inlineEditGridInternalOrganizationHierarchy" 
	
	@subrecipientOrganizationView @subrecipients @organization @home
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
	
	@activeSubrecipientOrganizationsView @subrecipients @organization @home
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
	
	@activeIndividualSubrecipientsEdit @subrecipients @organization @home
	Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Individual Subrecipients
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
	Then I can see row level action button "Edit" against "Pankaj Nelli" in flex table with id "ActiveAccountIndApplicant" 
	Examples:
	| User  |
	| ADMIN |
	| DA	|
	
	@activeSubrecipientOrganizationsEdit @subrecipients @organization @home
	Scenario Outline: Validate whether ADMIN/DA have Edit access to Active Subrecipient Organizations
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
	When I pause execution for "5" seconds
	Then I can see row level action button "Edit" against "Bankers Small Business Community Development Corporation Of California" in flex table with id "ActiveAccount" 
	Examples:
	| User  |
	| ADMIN |
	| DA    |
	
	@internalContactsView @internal @contacts @home
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
	
	@internalContactsCreate @internal @contacts @home
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
	
	@internalContactsEdit @internal @contacts @home
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
	
	@subrecipientContactsCreate @subrecipients @contacts @home
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
	
	@smeReviewersContactView @smeReviewers @contacts @home
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
	
	@smeReviewersContactCreate @smeReviewers @contacts @home
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
	
	@smeReviewersContactSendInviatation @smeReviewers @contacts @home
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
	
	@activeSMEReviewersContactDetailPageView @smeReviewers @contacts @home
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
	
	@termsandConditionsView @termsandConditions @manageTermsandConditions @home
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
	
	@termsAndConditionsCreate @termsandConditions @manageTermsandConditions @home
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
	| DA	|
	
	@termsAndConditionsADMINedit @termsandConditions @manageTermsandConditions @home
	Scenario Outline: Verifying if the ADMIN has Edit access to Terms and Conditions
	Given I login to "As a Grantor" app as "<User>" user
	When I navigate to "Home" tab
	And I navigate to "Terms and Conditions" content inside "Manage Terms and Conditions" subheader on left panel
	When I perform quick search for "TC-8115" in "MasterTermConditions" panel 
	Then I can see row level action button "Edit" against "TC-8115" in flex table with id "MasterTermConditions" 
	 Examples:
	| User  |
	| ADMIN |
	| DA	|
	
	@einRegistrationView @einRegistration @usefulLinks @home
	Scenario Outline: Validate whether all users have view access to EIN Registration
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	Then I navigate to "EIN Registration" content inside "Useful Links" subheader on left panel
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM	|
	
	@dunsRegistrationView @dunsRegistration @usefulLinks @home
	Scenario Outline: Validate whether all users have view access to DUNS Registration
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	Then I navigate to "DUNS Registration" content inside "Useful Links" subheader on left panel
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM	|
	
	@samgovRegistrationView @samgovRegistration @usefulLinks @home
	Scenario Outline: Validate whether all users have view access to SAM.gov Registration
	Given I login to "As a Grantor" app as "<User>" user 
	When I navigate to "Home" tab
	Then I navigate to "SAM.gov Registration" content inside "Useful Links" subheader on left panel
	Examples:
	| User  |
	| ADMIN |
	| EXE   |
	| PM	|
	
	@contactUsView @contactUs @technicalSupport @home
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