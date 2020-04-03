@negotiations @regression
Feature: Validate all scenarios in Negotiations

  Background: To setup data
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"

  @57032 @57031 @66071 @66448 @negotiationInitiatedAndSendToRecipient @deepika
  Scenario: Validate the the Negotiation option on the Approved FDM and Announcement Owner can send the Negotiation request to the Applicant
  Validate the Status Field when the Negotiation Request is "Sent to Subrecipient"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I softly see that "Automation Announcement for FDM" is in "Negotiation Initiated" status

  @57034 @57033 @65295 @65310 @65356 @submitToGrantorbySubrecipientCompleteNegotiation @deepika @smoke
  Scenario: Validate the Applicants able to submit the Application after edit and Internal Agency user decision on Completing the Negotiation | Validate task for SR user
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:homePendingTasks---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    Then I softly can see top right button "Complete Negotiation" in page detail
    When I click on "Complete Negotiation" in the page details
    Then I softly see status in Progress-bar is "Negotiated" and is "green"
    Then I softly can see top right button "Create Subaward" in page detail

  @57035 @57036 @TaskCreatedforSPinegotiationIconAfterFDMApproved @deepika
  Scenario: Validate Applicants will be able to view Negotiation Icon after FDM Approved and receive the Negotiation request from the Internal Agency
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see row level action button "Initiate Negotiation" against "Automation Announcement for FDM" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly see that "Negotiation Request" has been added in flextable with Id "---negotiation:-:homePendingTasks---"

  @57038 @57037 @sendBackToSubrecipientForFurtherChanges @deepika
  Scenario: Validate whether the users receive the pending Task when  Submit to Grantor and able to select Send Back to Subrecipient for further changes
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    Then I softly see that "Review Negotiation" has been added in flextable with Id "---negotiation:-:phasePendingTasksTableId---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    Then I softly see status in Progress-bar is "Negotiation Initiated" and is "green"

  @57211 @awardIconAfterNotAvilablOncenegotiationInitiated @deepika
  Scenario: User will not be able to view the Award icon on the FDM once the Negotiation has been initiated for the Application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I can see row level action button "Create Subaward" against "Automation Announcement for FDM" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @57214 @57039 @66450 @createAwardButtonAfterNegotiationComplete @deepika @smoke
  Scenario: Validate whether user will be able to view and select the Create Award button after the negotiation is completed
  Validate when the Negotiation Request is sent to Subrecipient, Application response page block is available for subrecipient to enter the details and provide them to Grantor and grantor can view them
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    Then I softly can see page block "Applicant Response"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    Then I softly can see page block "Applicant Response"
    Then I softly can see top right button "Complete Negotiation" in page detail
    When I click on "Complete Negotiation" in the page details
    Then I softly can see top right button "Create Subaward" in page detail
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"
    Then I softly can see top right button "Create Subaward" in page detail

  @57217 @57212 @createEditNegotiationButton @deepika
  Scenario: Validate whether users Applicant try to edit the Application after Submit to Grantor and will not be able to perform Negotiation on the Application once it is completed
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit Negotiation" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly cannot see row level action button "Initiate Negotiation" against "Automation Announcement for FDM" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @57218 @57219 @pendingTaskActionIconApplicantEditNegotiationRequest @deepika
  Scenario: Validate whether users will review the information and Applicant will be able to edit the respective application section(s) that the Agency mentioned
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly can see row level action button "Start" against "Negotiation Request" in flex table with id "---negotiation:-:homePendingTasks---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Details is Required to save under Negotiations. |

  @34387 @negotiationWhenOpenUserCannotCreateOther @deepika
  Scenario: Verify that with open negotiation request user can not Complete Negotiation (Negative TC)
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I cannot see top right button "Complete Negotiation" in page detail

  @34192 @57492 @57490 @createSubawardButtonOnCompletedNegotiationfromApplicationsTab @deepika
  Scenario: Validate whether user is able to Create Subaward from the Applications Tab Once Negotiation is completed and user is able to view the completed Negotiation on Applications Tab| Validate that Applicant receives Email notification when sent to subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "120" seconds
    Then I can see mail notification for "EXTERNAL" user with following subject:
      | An Application Negotiation Request for Application has been Requested |
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see values "Automation Announcement for FDM" and "Negotiated" inside table
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly can see top right button "Create Subaward" in page detail

  @57494 @57499 @initiateNegotiationsButtonOnApplicatioAndHiddenCreateSubaward @deepika
  Scenario: Validate whether user to able to Initiate Negotiation from Application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly can see top right button "Initiate Negotiation" in page detail
    When I click on "Initiate Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see "Negotiations" sub tab at view detail page
    When I click on "Send to Subrecipient" in the page details
    Then I cannot see top right button "Create Subaward" in page detail

  @57496 @57495 @65293 @userEditNegotiationIntitiatededitButtonHiddenOnceSendtoSubrecipient @deepika
  Scenario: Validate whether user to able to see the Edit Negotiation Button once created and Send to Subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Initiate Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit Negotiation" in page detail
    When I click on "Edit Negotiation" in the page details
    When I enter value "Negoatiation Initiated" into field "fieldExplanationOfRevisionsNeeded__c"
    And I click on "Save" in the page details
    Then I softly see field "Details" as "Negoatiation Initiated"
    When I click on "Send to Subrecipient" in the page details
    Then I softly cannot see top right button "Edit Negotiation" in page detail

  @57500 @subrecipientCanEditNegotiations
  Scenario: Validate whether Subrecipient User can edit Negotiations once Send to Subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Initiate Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail

  @57502 @viewApplicationStatusOnceSubmitToGrantorFromApplicationListViewPage
  Scenario: Validate whether the user is able to see the Negotiation Initiated from the Application List View Page
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Initiate Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    Then I can see row level action button "View" against "Automation Announcement for FDM" in flex table with id "---negotiation:-:negotiationPendingTaskTableId---"

  @57503 @65296 @subrecipientCannotEditNegotiationRequestOnceSubmitToGrantor
  Scenario: Validate whether Subrecipient user can edit Negotiations Details once Submit to Grantor
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I cannot see top right button "Edit Negotiation" in page detail

  @57504 @57501 @userCanEditandSendToSubrecipientEvenAfterSubmitToGrantor
  Scenario: Verify that applicant able to see application status as “Negotiation Initiated” and user is able to Edit and Send to Subrecipient once Submit to Grantor
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Initiate Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter values into fields
      | Value                            | Field                |
      | Automation Negotiation Initiated | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Negotiation Initiated" and is "green"
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit Negotiation" in page detail

  @57838 @detailsRequiredtoSaveBeforeSubmitToGrantor
  Scenario: Validate whether user to able to Submit to Grantor before providing deatils
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Details is Required to save under Negotiations. |

  @57840 @57839 @66445 @pendingNegotiationsViewAndSendToSubrecipientAfterSubmittingToGrantor
  Scenario: Validate whether users able to Send to Subrecipient after Submit to Grantor for adjustments and view the record  inside Pending Negotaitions Table |Validate Task is craeted to Subrecipient even when the negotiation is send back to subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "RecordId"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:RecordId}" in "---negotiation:-:homePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:RecordId}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "{SavedValue:RecordId}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    Then I softly see values "Automation Announcement for FDM" and "Negotiation Initiated" inside table
    And I click on "View" icon for "{SavedValue:RecordId}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    When I click on "Edit Negotiation" in the page details
    And I enter values into fields
      | Value                              | Field                           |
      | Automation Negotiation Iniatiation | ExplanationOfRevisionsNeeded__c |
    When I click on "Save" in the page details
    When I click on "Send Back to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Negotiation Initiated" and is "green"
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:RecordId}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly see value "{SavedValue:RecordId}" for title "EGMS ID" against the value "Negotiation Request" inside table "---negotiation:-:homePendingTasks---"

  @58029 @initiateNegotiationForAttachmentsNotes @deepika
  Scenario: Validate the selection of AttchementsNotes options from Application Sections for Revision option on the Approved FDM
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    Then I can see "Negotiations" sub tab at view detail page

  @58030 @65324 @completedNegotiationAttachmentsNotes @deepika
  Scenario: Validate whether user is able to view the completed Negotiation on Applications Tab /
  To verify that after clicking on complete negotiation button from the award owner profile  the progress bar  shows negotiated
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" against the value "Negotiated" inside table "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly see status in Progress-bar is "Negotiated" and is "Green"

  @58031 @applicationStatusReviewedAfterIntiationofNegotiation @deepika
  Scenario: Verify that on FDM View page when user click on Initiate Negotiation action then user is able to see status of application to “Reviewed”
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Initiate Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I see that "Automation Announcement for FDM" is in "Reviewed" status

  @58032 @pendingNegotiationRequestUnderCompletedNegotiations @deepika
  Scenario: Verify that user cannot see pending negotiation requests in “Completed Negotiations” table
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationCompletedTaskTableId---" panel
    Then I see "No Records Found" inside flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"

  @58034 @userCannotSeeIntiationButtonAfterIntiated @deepika
  Scenario: Verify that after creating Negotiation Request, user can see “Not Initiated” status of Negotiation Request
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Initiate Negotiation" against "Automation Announcement for FDM" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @34331 @foUserCannotSubmitNegotiations @deepika
  Scenario: Verify that other than owner, other users cannot send negotiation request (Negative TC)
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    Then I cannot see top right button "Send to Subrecipient" in page detail

  @62669 @AddedAttachmentForNegotiations @keerti
  Scenario: Validate the Addition of  attachment to Negotiations
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    When I navigate to "Attachments" sub tab
    When I upload attachment "Announcement_Field_Values.xlsx" from workspace
    And I pause execution for "1" seconds
    Then I see "Announcement_Field_Values.xlsx" has been added in "Attachments" flex table

  @62667 @RecordOwnerCanViewSnapshotAfterNegotiationIsInSubmittedToGrantor @keerti @skipOnJenkins
  Scenario: Validate Record Owner user is able to view the Snapshot after Negotiation  is in "Submitted to Grantor" status
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Submit_Negotiation.pdf"
    When I download the file
    Then I see "Negotiation Initiated" on page "1" of "govgrants" pdf file

  @64851 @historyBeforeAndAfterNegotitionComplete @deepika
  Scenario: Validate whether user is able to Create Subaward from the Applications Tab Once Negitiation is completed and user is able to view the completed Negotiation from it
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I navigate to "History" sub tab
    Then I softly see value "Negotiation Initiated" for title "New Value" inside table "History"
    When I click on "Complete Negotiation" in the page details
    Then I softly see value "Negotiated" for title "New Value" inside table "History"

  @64852 @fieldValuesAFterNegotiationComplete @deepika
  Scenario: Validate whether user is able to see the fields that after Negotiation is Completed
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Created Date" is getting updated with todays date
    Then I softly see field "Status" as "Complete"

  @65074 @fieldupdateBySPI @deepika
  Scenario: Validate whether SPI user can edit the field of Negotiation Request from Application tab
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I get the "EGMS ID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Applications" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:applicationsflexTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---negotiation:-:applicationsflexTableId---"
    When I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I see field "Details" as "Automation Negotiation Iniatiation"

  @65290  @validateApplicationSectionsforRevisionField  @mahadev
  Scenario: To verify the details selected in Application Sections for Revision in negotiation tab in negotiation module and on clicking the forward arrow it should shift to the chosen side by the Award owne
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I clear the value from field "ApplicationSectionsForRevision__c"
    Then I see multipicklist field "fieldApplicationSectionsForRevision__c" contains value "Overview: Project Information" under list "Application Sections for Revision - Available"

  @65267 @VerifyCalendarFieldValue @keerti
  Scenario: Verify Calendar field value at negotiation tab when award owner initiated the negotiation by clicking on initiate negotiation after FDM.
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "Automation Announcement for FDM" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly can see top right button "Initiate Negotiation" in page detail
    When I click on "Initiate Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "NegotiationDueDate__c"
    And I click on "Save" in the page details
    Then I see field "Due Date" as "{Date:M/d/yyyy::d+7}"

  @66068 @negotiationInitiatedWithBlankDueDate @deepika
  Scenario: Validate whether record owner can save the negotiation request without Due date on Overview Tab
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When I clear the value from field "NegotiationDueDate__c"
    When  I enter "Due Date" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Due Date is Required to save under Negotiations. |

  @66451 @66381 @createSubawardFromNegotiation @deepika @smoke
  Scenario: Validate whether User will be able to create draft award created from Complete Negotiation | Validate when Negotiation Request is completed and user clicks on Create Subaward then the sttaus changes to 'Converted to Award'
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I click on "Create Subaward" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationCompletedTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"
    Then I softly see that "Automation Announcement for FDM" is in "Converted to Award" status

  @66447 @verifyTopRightButtonsOnNegotiationsPage @deepika
  Scenario: Validate Negotiations have Edit Negotiation, Create Subaward and Send to Subrecipient button on top of the page
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit Negotiation" in page detail
    Then I softly can see top right button "Create Subaward" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail

  @66446 @addNewValueToApplicationSectionForRevision @deepika
  Scenario: Validate whether for the Negotiation Request the record owner can add new Values to ApplicationSection for Revision
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    And  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Details" as "Negoatiation Initiated"

  @67255  @validateAnnouncementHyperlinkOnGrant   @mahadev
  Scenario: To validate that the announcement page is navigable from the Grant page through the Grantor(PM profile Internal user)
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I click on "Create Subaward" in the page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "Automation Announcement for FDM" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I save the field labeled "EGMS ID" as "AnnID"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I click on hyperlink containing value "{SavedValue:AnnID}"
    Then I see status in Progress-bar is "Published" and is "green"

  @72347 @negotiationComplete @productBusinessFlowSanity
  Scenario: Validate once the Negotiation Request is completed then the record owner can view the record under Completed Negotiations
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    Then I can see row level action button "View" against "Automation Announcement for FDM" in flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"
