@smeRegistration @smeReviewerRegistration @userRegistration @parallel-regression @regression
Feature: Validate all scenarios for SME Registration

  @34872 @34840 @VerifyPageDetailsOnRegistrationStep1of1-SMEReviewerRegistration @smoke @monu
  Scenario: Validate all expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click modal button "Send"
    And I refresh the page
    And I pause execution for "180" seconds
    And I navigate to yopmail portal for "smereviewer@yopmail.com"
    #34840 #monu
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 1" in the page details
    Then I softly see fields "fieldExternalReviewerPrefix__c" is in edit mode
    Then I softly see fields "fieldExternalReviewerLastName__c" is in edit mode
    Then I softly see fields "fieldExternalReviewerLastName__c" is in edit mode
    Then I softly see fields "fieldExternalReviewerPhone__c" is in edit mode
    Then I softly see field "Email" as "smereviewer@yopmail.com"

  @34991 @VerifySubjectMatterExpertFieldsDetails-SMEReviewerRegistration @smoke @monu
  Scenario: Validate filled details of subject matter expert fields on page of Registration Step 1 of 1
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click modal button "Send"
    And I refresh the page
    And I pause execution for "180" seconds
    And I navigate to yopmail portal for "smereviewer@yopmail.com"
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    And I enter "SubjectMatterExpertDetails" values from "grantorUserRegistration_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details contains:
      | Confirmation Message                                                                                                                                                                |
      | Your registration request for access to the EGMS has been completed.  You will be sent an email from salesforce.com (technology platform provider) with your Username and Password. |

  @34834 @34836 @34831 @VerifyCreatedSMEUserDetails-SMEReviewerRegistration @smoke @monu
  Scenario: Validate created SME user details on modal after clicking on view row level action
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    Then I softly see "Full Name" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Email" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Invited By" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Status" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Sponsoring Agency" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click modal button "Send"
    #34836 #monu
    Then I see the following messages in the page details :
      | Email Sent Successfully |
    #34831 #monu
    And I close modal by clicking the top right x button
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    Then I see value "Invitation Sent" for title "Status" inside table "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I refresh the page
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact}" inside table
    Then I see field "Type" as "Reviewers" on modal
    Then I see field "Status" as "Invitation Sent" on modal
    And I softly see the text containing :
      | Overview    |
      | Attachments |

  @35013 @VerifyCreatedSMEUserAtActivePartneruser-SMEReviewerRegistration @smoke @monu @wip
  Scenario: Validate created SME user should get reflected at salesforce page inside Active Partnet usersall expected fields are getting populated on page of Registration Step 1 of 1 while SME reviewer registration
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click modal button "Send"
    And I refresh the page
    And I pause execution for "62" seconds
    And I navigate to yopmail portal for "smereviewer@yopmail.com"
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the page details
    Then I see the sub-header is "Step 1 of 1" in the page details
    And I enter "OrgProfileCompleteDetail" values from "UserRegistration_Field_Values.xlsx"

  @33847 @VerifyInternalSubricepientAndSMEReviewerContact @monu
  Scenario: Validate user is able to see all expected contacts
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:InternalLink}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{grantee_testData:InternalContacts}" in "{grantor_tableId:InternalContactsTableId}" panel
    Then I softly see value "{grantee_testData:InternalContacts}" for title "Full Name" inside table "{grantor_tableId:InternalContactsTableId}"
    When I navigate to "{grantor_sidebar:SubrecipientsLink}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{grantee_testData:SMEContact}" in "{grantor_tableId:InternalContactsTableId}" panel
    Then I softly see value "{grantee_testData:SMEContact}" for title "Full Name" inside table "{grantor_tableId:InternalContactsTableId}"
    When I navigate to "{grantor_sidebar:SMEReviewersLink}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    When I perform quick search for "{grantee_testData:SMEReviewerContact}" in "{grantor_tableId:PotentialReviewerContactTableId}" panel
    Then I softly see value "{grantee_testData:SMEReviewerContact}" for title "Full Name" inside table "{grantor_tableId:PotentialReviewerContactTableId}"

  @33837 @VerifySystemDisplayAllRelatedTasks @monu
  Scenario: Validate user is able to see all expected contacts
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:PendingTaskLink}" content inside "{grantor_sidebar:MyTasksLinkName}" subheader on left panel
    Then I softly can see page block "Pending Tasks (Assigned To Me)"
    Then I softly can see page block "Pending Tasks (Assigned By Me)"
    Then I softly see "In Progress" value in flex table id "---grantor_tableId:-:PendingTaskAssignedToMeTableId---"
    Then I softly see "Not Started" value in flex table id "---grantor_tableId:-:PendingTaskAssignedToMeTableId---"
    When I navigate to "{grantor_sidebar:CompletedTaskLink}" content inside "{grantor_sidebar:MyTasksLinkName}" subheader on left panel
    Then I softly can see page block "Completed Tasks (Assigned To Me)"
    Then I softly can see page block "Completed Tasks (Assigned By Me)"
    Then I softly see "Completed" value in flex table id "---grantor_tableId:-:CompletedTaskAssignedToMeTableId---"

  @94345 @validatingEmailNotificationForSMEReviewer @meenakshi
  Scenario: To verify Email notification should be received to SME contact after sending invitation by internal  user
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I wait for "2" seconds
    And I enter value "Test Automation Description" in email body
    And I click "Send" button in modal
    And I checkout to yopmail with mailid "IndividualRegistration@yopmail.com"
    And I pause execution for "20" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)
      """

  @35012 @VerifySMEReviewerDetailPage-SMEReviewerRegistration @smoke @monu @wip
  Scenario: Validate all details of created Sme Reviewer
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "{grantor_sidebar:smeReviewer}" content inside "{grantor_sidebar:ContactSubheaderName}" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I refresh the page
    When I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"