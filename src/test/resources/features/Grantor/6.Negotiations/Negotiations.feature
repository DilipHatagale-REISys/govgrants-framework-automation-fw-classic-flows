@negotiations @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios in Negotiations

  Background: To setup data
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"

  @66071 @57031 @66448 @57032 @negotiationInitiatedAndSendToRecipient @deepika
  Scenario: Validate the the Negotiation option on the Approved FDM and Announcement Owner can send the Negotiation request to the Applicant
  Validate the Status Field when the Negotiation Request is "Sent to Subrecipient"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    Then I softly see field "Status" as "Negotiation Initiated"

  @65295 @57033 @65310 @57034 @65356 @submitToGrantorbySubrecipientCompleteNegotiation @deepika @smoke
  Scenario: Validate the Applicants able to submit the Application after edit and Internal Agency user decision on Completing the Negotiation | Validate task for SR user
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    Then I softly see status in Progress-bar is "Reviewed" and is "green"
    Then I softly can see top right button "Create Subaward" in page detail

  @57036 @57035 @TaskCreatedforSPinegotiationIconAfterFDMApproved @deepika
  Scenario: Validate Applicants will be able to view Negotiation Icon after FDM Approved and receive the Negotiation request from the Internal Agency
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly see that "Negotiation Request" has been added in flextable with Id "---negotiation:-:homePendingTasks---"

  @57037 @57038 @sendBackToSubrecipientForFurtherChanges @deepika
  Scenario: Validate whether the users receive the pending Task when  Submit to Grantor and able to select Send Back to Subrecipient for further changes
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    Then I softly see status in Progress-bar is "Submitted" and is "Green"

  @57211 @awardIconAfterNotAvilablOncenegotiationInitiated @deepika
  Scenario: User will not be able to view the Award icon on the FDM once the Negotiation has been initiated for the Application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Create Subaward" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @66450 @57214 @57039 @createAwardButtonAfterNegotiationComplete @deepika @smoke
  Scenario: Validate whether user will be able to view and select the Create Award button after the negotiation is completed
  Validate when the Negotiation Request is sent to Subrecipient, Application response page block is available for subrecipient to enter the details and provide them to Grantor and grantor can view them
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"
    Then I softly can see top right button "Create Subaward" in page detail

  @57212 @57217 @createEditNegotiationButton @deepika
  Scenario: Validate whether users Applicant try to edit the Application after Submit to Grantor and will not be able to perform Negotiation on the Application once it is completed
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @57218 @57219 @pendingTaskActionIconApplicantEditNegotiationRequest @deepika
  Scenario: Validate whether users will review the information and Applicant will be able to edit the respective application section(s) that the Agency mentioned
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I cannot see top right button "Complete Negotiation" in page detail

  @34192 @57490 @57492 @createSubawardButtonOnCompletedNegotiationfromApplicationsTab @deepika
  Scenario: Validate whether user is able to Create Subaward from the Applications Tab Once Negotiation is completed and user is able to view the completed Negotiation on Applications Tab| Validate that Applicant receives Email notification when sent to subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I logout
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I pause execution for "60" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: An Application Negotiation Request for Application {SavedValue:EGMSID} has been Requested
      """
    Given I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see values "{SavedValue:Automation Runtime FDM Announcement}" and "Reviewed" inside table
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly can see top right button "Create Subaward" in page detail

  @57494 @57499 @initiateNegotiationsButtonOnApplicatioAndHiddenCreateSubaward @deepika
  Scenario: Validate whether user to able to Initiate Negotiation from Application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see "Negotiations" sub tab at view detail page
    When I click on "Send to Subrecipient" in the page details
    Then I softly cannot see top right button "Create Subaward" in page detail

  @57495 @65293 @57496 @userEditNegotiationIntitiatededitButtonHiddenOnceSendtoSubrecipient @deepika
  Scenario: Validate whether user to able to see the Edit Negotiation Button once created and Send to Subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Request Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    When I enter value "Negoatiation Initiated" into field "fieldExplanationOfRevisionsNeeded__c"
    And I click on "Save" in the page details
    Then I softly see field "Details" as "Negoatiation Initiated"
    When I click on "Send to Subrecipient" in the page details
    Then I softly cannot see top right button "Edit" in page detail

  @57500 @subrecipientCanEditNegotiations
  Scenario: Validate whether Subrecipient User can edit Negotiations once Send to Subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Request Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Request Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---negotiation:-:negotiationPendingTaskTableId---"

  @65296 @57503 @subrecipientCannotEditNegotiationRequestOnceSubmitToGrantor
  Scenario: Validate whether Subrecipient user can edit Negotiations Details once Submit to Grantor
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I cannot see top right button "Edit" in page detail

  @57501 @57504 @userCanEditandSendToSubrecipientEvenAfterSubmitToGrantor
  Scenario: Verify that applicant able to see application status as “Negotiation Initiated” and user is able to Edit and Send to Subrecipient once Submit to Grantor
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Request Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Negotiation Initiated"
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see top right button "Edit" in page detail

  @57838 @detailsRequiredtoSaveBeforeSubmitToGrantor
  Scenario: Validate whether user to able to Submit to Grantor before providing deatils
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Details is Required to save under Negotiations. |

  @57839 @57840 @66445 @pendingNegotiationsViewAndSendToSubrecipientAfterSubmittingToGrantor
  Scenario: Validate whether users able to Send to Subrecipient after Submit to Grantor for adjustments and view the record  inside Pending Negotaitions Table |Validate Task is craeted to Subrecipient even when the negotiation is send back to subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "RecordId"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    Then I softly see values "{SavedValue:Automation Runtime FDM Announcement}" and "Negotiation Submitted" inside table
    And I click on "View" icon for "{SavedValue:RecordId}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    When I click on "Request Negotiations" in the page details
    And I enter values into fields
      | Value                              | Field                           |
      | Automation Negotiation Iniatiation | ExplanationOfRevisionsNeeded__c |
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" against the value "Reviewed" inside table "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly see status in Progress-bar is "Reviewed" and is "Green"

  @58031 @applicationStatusReviewedAfterIntiationofNegotiation @deepika
  Scenario: Verify that on FDM View page when user click on Initiate Negotiation action then user is able to see status of application to “Reviewed”
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Request Negotiation" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I see that "{SavedValue:Automation Runtime FDM Announcement}" is in "Reviewed" status

  @58032 @pendingNegotiationRequestUnderCompletedNegotiations @deepika
  Scenario: Verify that user cannot see pending negotiation requests in “Completed Negotiations” table
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @34331 @foUserCannotSubmitNegotiations @deepika
  Scenario: Verify that other than owner, other users cannot send negotiation request (Negative TC)
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "GrantorApplicationFilesgrid"
    And I upload attachment "Announcement_Field_Values.xlsx" of type "General Assurances" from computer
    When I save the value from row "1" for column name "Title" as "AttachedFile" from flex table "GrantorApplicationFilesgrid"
    Then I see value "{SavedValue:AttachedFile}" for title "Title" inside table "GrantorApplicationFilesgrid"

  @62667 @RecordOwnerCanViewSnapshotAfterNegotiationIsInSubmittedToGrantor @keerti @skipOnJenkins
  Scenario: Validate Record Owner user is able to view the Snapshot after Negotiation  is in "Submitted to Grantor" status
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    Then I softly see value "Negotiation Submitted" for title "New Value" inside table "History"
    When I click on "Complete Negotiation" in the page details
    Then I softly see value "Reviewed" for title "New Value" inside table "History"

  @64852 @fieldValuesAFterNegotiationComplete @deepika
  Scenario: Validate whether user is able to see the fields that after Negotiation is Completed
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I navigate to "Overview" sub tab
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock

  @65074 @fieldupdateBySPI @deepika
  Scenario: Validate whether SPI user can edit the field of Negotiation Request from Application tab
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I get the "EGMS ID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    Then I softly see field "Details" as "Automation Negotiation Iniatiation" in "Applicant Response" pageblock

  @65290  @validateApplicationSectionsforRevisionField @mahadev
  Scenario: To verify the details selected in Application Sections for Revision in negotiation tab in negotiation module and on clicking the forward arrow it should shift to the chosen side by the Award owne
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly can see top right button "Request Negotiation" in page detail
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Overview: Project Information" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    And I click on "Save" in the page details
    Then I see field "Due Date" as "{Date:MM/dd/yyyy::d+7}"

  @66068 @negotiationInitiatedWithBlankDueDate @deepika
  Scenario: Validate whether record owner can save the negotiation request without Due date on Overview Tab
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When I clear the value from field "NegotiationDueDate__c"
    When  I enter "Due Date" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Due Date is required to save under Negotiations. |

  @66381 @66451 @createSubawardFromNegotiation @deepika @smoke
  Scenario: Validate whether User will be able to create draft award created from Complete Negotiation | Validate when Negotiation Request is completed and user clicks on Create Subaward then the sttaus changes to 'Converted to Award'
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    Then I softly see that "{SavedValue:Automation Runtime FDM Announcement}" is in "Converted to Award" status

  @66447 @verifyTopRightButtonsOnNegotiationsPage @deepika
  Scenario: Validate Negotiations have Edit Negotiation, Create Subaward and Send to Subrecipient button on top of the page
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail

  @66446 @addNewValueToApplicationSectionForRevision @deepika
  Scenario: Validate whether for the Negotiation Request the record owner can add new Values to ApplicationSection for Revision
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    And  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see field "Details" as "Negotiation Initiated"

  @67255  @validateAnnouncementHyperlinkOnGrant @mahadev
  Scenario: To validate that the announcement page is navigable from the Grant page through the Grantor(PM profile Internal user)
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I save the field labeled "EGMS ID" as "AnnID"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    And I navigate to "Overview" sub tab
    When I click on hyperlink containing value "{SavedValue:AnnID}"
    Then I see status in Progress-bar is "Published" and is "green"

  @133262 @133251 @ValidatePMUserAllowEditSelectAtLeastOneFormErrorMessage @Sprint-3 @Vaibhav
  Scenario: Validate PM User Allow Edit Select At Least One Form Error Message
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    Then I softly see values "{SavedValue:EGMSID}" and "Reviewed" inside table
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    #133251
    Then I softly see field "Application Sections for Negotiation" as "Files: Forms"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Negotiations Tab - Select at least one form for negotiation, because Form section is added for negotiation. |

  @133252 @ValidatePMuserisabletoselectAllowEditforatleastoneformintheAvailableFormsforRevisionstablewhenapplicationissubmittedtograntor @sprint-3 @vaibhav
  Scenario: Validate PM user is able to select Allow Edit for atleast one form in the Available Forms for Revisionstable when application is submitted to grantor
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly can see top right button "Request Negotiations" in page detail
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I see value "check" for title "Needs Negotiation" against the value "Standard Assurances Form" inside table "---negotiation:-:NegotiationFormsTableId---"

  @133264 @ValidatethateditactionisdisplayedforAlloweditcolumnwhenSubrecipientuserhassubmittedapplicationtograntorandApplicationisinNegotiationInitiatedstate @sprint-3 @vaibhav
  Scenario: that edit action is displayed for "Allow edit" column when Subrecipient user has submitted application to grantor and Application is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly can see top right button "Request Negotiations" in page detail
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:NegotiationFormsTableId---"

  @133569 @ValidateSPIuserisabletoEditformonclickofeditactionwhenApplicationissenttosubrecipientandisinNegotiationInitiatedstate @sprint-3 @vaibhav
  Scenario: SPI user is able to Edit form on click of edit action when Application is sent to subrecipient and is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I can see top right button "Cancel" in page detail
    Then I can see top right button "Save" in page detail
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I can see top right button "Cancel" in page detail
    Then I can see top right button "Save" in page detail

  @165881 @Verifythateditactionisnotdisplayedtoannouncementownerfor"Allowedit"columnwhenApplicationissenttosubrecipientandisinNegotiationInitiatedstate @sprint-3 @vrishali
  Scenario: Verify that edit action is not displayed to announcement owner for "Allow edit" column  when Application is sent to subrecipient and is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    And I navigate to "Negotiations" sub tab
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:NegotiationFormsTableId---"

  @165880 @Verify-PMuserisnotabletoselectFiles:FormsinApplicationSectionsforRevisionmultipicklistwhenApplicationissenttoSubrecipientuserandinNegotiationInitiatedstate @sprint-3 @Vrishali
  Scenario:Verify PM user is not able to select Files:Forms in Application Sections for Revision multi picklist when Application is sent to Subrecipient user and is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Application Sections for Revision" is not editable

  @133979 @ValidatePMUserSelectAllowEditMoreThanONeFormSubmittedToGrantor @sprint-3 @vaibhav
  Scenario: Validate PM User Select Allow Edit More Than ONe Form Submitted To Grantor
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    Then I see value "check" for title "Needs Negotiation" against the value "Standard Assurances Form" inside table "---negotiation:-:NegotiationFormsTableId---"
    Then I see value "check" for title "Needs Negotiation" against the value "Program Application Form" inside table "---negotiation:-:NegotiationFormsTableId---"

  @164461 @ValidateSPAuserisabletoEditformonclickofeditactionwhenApplicationissenttosubrecipientandisinNegotiationInitiatedstate @sprint-3 @vaibhav
  Scenario: SPA user is able to Edit form on click of edit action when Application is sent to subrecipient and is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I can see top right button "Cancel" in page detail
    Then I can see top right button "Save" in page detail
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I can see top right button "Cancel" in page detail
    Then I can see top right button "Save" in page detail

  @165815 @Verify-PMuserisabletoselectFiles:FormsinApplicationSectionsforRevisionmultipicklistwhensubrecipientuserhassubmittedapplicationtograntorandApplicationinNegotiationInitiatedstate @sprint-3 @Vrishali
  Scenario: Verify PM user is able to select Files:Forms in Application Sections for Revision multi picklist when Subrecipient user has submitted application to grantor and Application is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I pause execution for "3" seconds
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Application Sections for Negotiation" as "Files: Forms"

  @166360 @VerifyvalidationisdisplayedtoPMtoselecttheFiles:FormsoptionApplicationSectionsRevisionsection @sprint-3 @vrishali @bug-190352
  Scenario: Verify validation is displayed to PM user to select the "Allow edit" for at least one form in the available forms for Revisions table
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    Then I softly can see "Negotiations" sub tab at view detail page
    And I navigate to "Negotiations" sub tab
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details :
      | Negotiations Tab - Select at least one form for negotiation, because Form section is added for negotiation. |

  @133572 @ValidateSPIuserisnotabletoeditformifFormisnotselectedonNegotiationstabAvailablFormsforRevisionsandApplicationisinNegotiationInitiatedstate @sprint-3 @vaibhav
  Scenario: Validate SPI user is not able to edit form if Form is not selected on Negotiations tab Available Forms for Revisions and Application is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"

  @164564 @ValidateSPAuserisnotabletoeditformifFormisnotselectedonNegotiationstabAvailablFormsforRevisionsandApplicationisinNegotiationInitiatedstate @sprint-3 @vaibhav
  Scenario: Validate SPA user is not able to edit form if Form is not selected on Negotiations tab Available Forms for Revisions and Application is in Negotiation Initiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"

  @165804 @ValidateSubrecipientuserisnotabletoeditformswhenApplicationisinreviewedstateandGrantoruserhasInitiatedNegotiationfortheapplication @sprint-3 @vaibhav
  Scenario: Validate Subrecipient user is not able to edit forms when Application is in reviewed state and Grantor user has Initiated Negotiation for the application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"

  @165810 @ValidateSPIuserisnotabletoeditselectedformonapplicationwhenapplicationisinNegotiationinitiatedstateandapplicationissubmittedtoGrantor @sprint-3 @vaibhav
  Scenario: Validate SPI user is not able to edit selected form on application when application is in Negotiation initiated state and application is submitted to Grantor
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_prog" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_stand" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"

  @165882 @ValidateSubrecipientuserisnotabletoeditformswhenApplicationisinNegotiatedstate @sprint-3 @vaibhav
  Scenario: Validate Subrecipient user is not able to edit forms when Application is in Negotiated state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_prog" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_stand" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Applications" subheader on left panel
    And I click toggle button to select "Negotiations - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:applicationsflexTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:applicationsflexTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "View" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Back" in the page details
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see top right button "Edit" in page detail

  @165884 @ValidateSubrecipientuserisnotabletoeditformswhenApplicationisinConvertedtoAwardstate  @sprint-3 @vaibhav
  Scenario: Validate Subrecipient user is not able to edit forms when Application is in Converted to Award state
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_prog" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_stand" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I click on "Create Subaward" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Applications" subheader on left panel
    And I click toggle button to select "Negotiations - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:applicationsflexTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:applicationsflexTableId---"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "View" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Back" in the page details
    And I click on "View" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see top right button "Edit" in page detail

  @191292 @ValidateusershouldabletocreatedirectsubawardwithoutnegotiationInitiated  @sprint-1 @vaibhav
  Scenario: Validate user should able to create direct subaward without negotiation Initiated
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I softly can see page block "Subaward Information"

  @189349 @189353 @ValidateusershouldabletoseetheRequestNegotiationButtononapplicationrecordafterFDMisapproved @sprint-13 @vaibhav
  Scenario: Validate user should able to see the Request Negotiation Button  on  application record after FDM is approved
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @189452 @189455 @ValidateusershouldabletoseetheRequestNegotiationButtononapplicationrecordafterFDMisapproved @sprint-13 @vaibhav
  Scenario: Validate  user should able to see the Request Negotiation Button  on  application record after FDM is approved
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I see status in Progress-bar is "Approved" and is "Green"
    Then I softly can see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @189468 @ValidateusershouldabletoseetheNotifyApplicantsbuttononapprovedFDM @sprint-13 @vaibhav
  Scenario: Validate user should able to see the Notify Applicants button on approved FDM
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I see status in Progress-bar is "Approved" and is "Green"
    Then  I can see top right button "Notify Selected Applicants" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @189488 @189498 @189504 @ValidateS/Rsideallowtheapplicationrecordownerwitheditaccesstoeditsectionsandformswithintheapplicationonlyforcreatedstatus @sprint-13 @vaibhav
  Scenario: Validate allow the application record owner with edit access to edit sections and forms within the application only for created status
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
     #189498
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see fields "fieldQuestion1__c" is in edit mode
    Then I softly see fields "fieldQuestion2__c" is in edit mode
    Then I softly see fields "fieldQuestion3__c" is in edit mode
    Then I softly see fields "fieldQuestion4__c" is in edit mode
    Then I softly see fields "fieldQuestion5__c" is in edit mode
    Then I softly see fields "fieldQuestion6__c" is in edit mode
    Then I softly see fields "fieldQuestion7__c" is in edit mode
    Then I softly see fields "fieldQuestion8__c" is in edit mode
    Then I softly see fields "fieldQuestion9__c" is in edit mode
    Then I softly see fields "fieldQuestion10__c" is in edit mode
    Then I softly see fields "fieldQuestion11__c" is in edit mode
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
     #189504
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see fields "fieldAppplicationSubmitted__c" is in edit mode
    Then I softly see fields "fieldSubmittedOnForm__c" is in edit mode


  @189512 @Validates/rusersshouldbeseethesectionNegotiationRequestdetailsintheNegotiationstabforapplication @sprint-13 @vaibhav
  Scenario: Validate  s/r users should be  see the section  Negotiation Request details in the Negotiations tab for application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I enter values into fields
      | Value      | Field                      |
      | 10/18/2142 | fieldNegotiationDueDate__c |
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    #189548
    Then I softly see field "Due Date" as "10/18/2142"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I softly see field "Application Sections for Negotiation" as "Files: Forms"
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
   Then I softly see field "Due Date" as "10/18/2142" in "Negotiation Request Details" pageblock

  @189521 @Validatere-submittingtherevisedapplicationtheapplicationsectionsandformsshouldbelockedfortheS/Ruser @sprint-13 @vaibhav
  Scenario: Validate re-submitting the revised application, the application sections and forms should be locked  for the S/R user
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Ed_Over" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Overview" sub tab
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldGranteeProgramincome__c" is in edit mode
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_prog" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_stand" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see that "Estimated Program Income For Project Period" rendered in view mode only
    Then I softly see that "Application Title" rendered in view mode only

  @189536 @189539 @ValidateUponre-submissiontheapplicationshouldcomebacktothegrantorandnotifytheuserwhorequestedtheNegotiation @sprint-13 @vaibhav
  Scenario: Validate Upon re-submission, the application should come back to the grantor and notify the user who requested the Negotiation
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    #189539
    Then I softly can see top right button "Complete Negotiation" in page detail

  @189563 @ValidatesubrecipientshouldbeabletoprovideNegotiationSummarycommentsintheNegotiationstabbeforere-submittingtheapplicationtothegrantorinNegotiationDetailsunderNegotiationTab @sprint-13 @vaibhav
  Scenario: Validate subrecipient should be able to provide Negotiation  Summary comments in the Negotiations tab before re-submitting the application to the grantor in Negotiation Details under Negotiation Tab
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Ed_Over" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Overview" sub tab
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldGranteeProgramincome__c" is in edit mode
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I softly see field "Details" as "Automation Negotiation Iniatiation" in "Applicant Response" pageblock

  @189571 @Validatesubmittingtherevisedapplicationthesectionsandformsgetlockedforthesubrecipient @sprint-13 @vaibhav
  Scenario: Validate submitting the revised application the sections and forms get locked for the subrecipient
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Ed_Over" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Overview" sub tab
    Then I softly see fields "fieldTitle__c" is in edit mode
    Then I softly see fields "fieldGranteeProgramincome__c" is in edit mode
    And I enter values into fields
      | Value                       | Field                        |
      | Automation Test Description | fieldTitle__c                |
      | 100                         | fieldGranteeProgramincome__c |
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_prog" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_stand" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Form saved successfully. |
    When I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Negotiations" sub tab
    #134399
    Then I softly see field "Negotiation Request Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see field "Estimated Program Income For Project Period" as "$100.00"
    Then I softly see field "Application Title" as "Automation Test Description"

  @189574 @Validateusershouldgetnotificationandtheapplicationcomesbackinpendingtaskoncethenegotiationontheapplication @sprint-13 @vaibhav
  Scenario: Validate user should get notification and the application comes back in pending task once the negotiation on the application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_prog" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:filesFormsTableId---"
    When  I enter "Form_stand" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:internalHomePendingTableId---"

  @189576 @ValidateusershouldrequestednegotiationforanapplicationshouldbeabletomarkCompleteNegotiationforresubmittedapplication @sprint-13 @vaibhav
  Scenario: Validate user should requested negotiation for an application should be able to mark ‘Complete Negotiation’ for resubmitted application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    Then I softly can see top right button "Complete Negotiation" in page detail
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock

  @189579 @ValidateGrantorsideifstatusisnegotiationinitiatedtheSendBacktoSubrecipientinProductwillbereplacedbySendtoSubrecipientforapplication @sprint-13 @vaibhav
  Scenario: Validate Grantor side if status is negotiation initiated the 'Send Back to Subrecipient' in Product will be replaced by 'Send to Subrecipient' for application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I click on "Send to Subrecipient" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock

  @190678 @ValidatecanceltheRequestnegotiationthenweshouldabletoInitiatetherequestnegotiation @sprint-13 @vaibhav
  Scenario: Validate cancel the Request negotiation then we should able to Initiate the request negotiation
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Request Negotiations" in the page details
    When I click on "Save" in the page details
    When I click on "Cancel Negotiation" in the page details
    Then I softly see field "Negotiation Request Status" as "Cancelled" in "Negotiation Request Details" pageblock
    Then I softly can see top right button "Request Negotiation" in page detail

  @190679 @ValidateCompletenegotiationOrpendingnegotiationthewecanseenegotiationinitiatedrecordinApplicationNegotiationgridindecrementalorder @sprint-13 @vaibhav
  Scenario: Validate Complete negotiation Or pending negotiation then we can see negotiation initiated record in Application Negotiation grid in decremental order
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    And I save the value from row "1" for column name "EGMS ID" as "NegoEGMSID" from flex table "---negotiation:-:negotiationPendingTaskTableId---"
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    Then I softly see value "{SavedValue:NegoEGMSID}" for title "EGMS ID" inside table "---negotiation:-:negotiationPendingTaskTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "NegoEGMSID1" from flex table "---negotiation:-:negotiationCompletedTaskTableId---"
    And I perform quick search for "{SavedValue:NegoEGMSID1}" in "---negotiation:-:negotiationCompletedTaskTableId---" panel
    Then I softly see value "{SavedValue:NegoEGMSID1}" for title "EGMS ID" inside table "---negotiation:-:negotiationCompletedTaskTableId---"

  @190680 @ValidateInitiatetheNegotiationfromdirectapprovedFDMthenweShouldnotabletoseeRequestNegotiationcreatesubawardbuttononApplication @sprint-13 @vaibhav
  Scenario: Validate Initiate the Negotiation from direct approved FDM then we  should not able to see Request Negotiation & create subaward button on Application
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly cannot see top right button "Request Negotiations" in page detail
    Then I softly cannot see top right button "Create Subaward" in page detail

  @190744 @Validateusershouldabletocreatesubawardaftercompletethenegotiation @sprint-13 @vaibhav
  Scenario: Validate user should able to create subaward after complete the negotiation
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
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
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:negotiationCompletedTaskTableId---"
    Then I softly see value "Converted to Award" for title "Status" inside table "---negotiation:-:negotiationCompletedTaskTableId---"

  @189444 @ValidateDONOTallowtheapplicationtobeconvertedtoanawardifitisNegotiationinitiated @sprint-13 @vaibhav
  Scenario: VAlidate DO NOT allow the application to be converted to an award if it is Negotiation initiated
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly cannot see row level action button "Create Subaward" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @197056 @ValidateAppRevnewownerPMcancreateinitiatenegotiationafterFDMisapprovesfromappafterit'srelatedAnnownershipwillassigntootherPMuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate AppRev new owner PM can create initiate negotiation after FDM is approves from app after it's related Ann ownership will assign to other PM user
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime FDM Announcement}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:Automation Runtime FDM Announcement}" for title "Title" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see row level action button "Initiate Negotiation" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @219357 @CompetativeAnnVerifyasEXEuserIcannotseeRecommendedforawardcolumnisvisiblewhenAppstatusisnegotiationinitiated @sprint-10-US-203669 @komal @Allocation
  Scenario: Competative Ann as EXE user I cannot see Recommended for award column is visible when App status is negotiation initiated
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    #219357
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Recommended Budget" inside page block
