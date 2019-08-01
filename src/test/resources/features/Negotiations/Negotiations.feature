@negotiations @regression
Feature: Validate all scenarios in Negotiations

  Background: To setup data
    Given I delete the record "Autoamtion Announcement for Negotiations" from the object "FDM"

  @57031 @initiateNegotiations @deepika
  Scenario: Validate the Negotiation option on the Approved FDM
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I can see "Negotiations" sub tab at view detail page

  @57032 @negotiationInitiatedAndSendToRecipient @deepika
  Scenario: Validate the Announcement Owner can send the Negotiation request to the Applicant
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I see that "Autoamtion Announcement for Negotiations" is in "Negotiation Initiated" status

  @57033 @submitToGrantorbySubrecipient @deepika
  Scenario: Validate the Applicants able to submit the Application after edit
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I can see top right button "Submit to Grantor" in page detail

  @57034 @completeNegotiation @deepika
  Scenario: Validate the Internal Agency user decision on Completing the Negotiation
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I click on "Complete Negotiation" in the page details
    Then I see status in Progress-bar is "Negotiated" and is "green"

  @57035 @pendingTaskCreatedforSubrecipient @deepika
  Scenario: Validate the Applicants receive the Negotiation request from the Internal Agency
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    Then I see that "Negotiation Request" has been added in flextable with Id "PendingTasks"

  @57036 @negotiationIconAfterFDMApproved @deepika
  Scenario: Validate the Applicants will be able to view Negotiation Icon after FDM Approved
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I can see row level action button "Initiate Negotiation" against "Autoamtion Announcement for Negotiations" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @57037 @pendingTaskCreatedForInternalUserAfterSubmitToGrantor @deepika
  Scenario: Validate the Internal User receive the pending Task when  Submit to Grantor
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    Then I see that "Review Negotiation" has been added in flextable with Id "PhasePendingTasks"

  @57038 @sendBackToSubrecipientForFurtherChanges @deepika
  Scenario: Validate whether the users will be able to select Send Back to Subrecipient for further changes
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Negotiation Initiated" and is "green"

  @57039 @createSubAwardAfterNegotiationCompleted @deepika
  Scenario: User will be able to view and select the Create Award button after the negotiation is completed
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I click on "Complete Negotiation" in the page details
    Then I can see top right button "Create Subaward" in page detail

  @57211 @awardIconAfterNotAvilablOncenegotiationInitiated @deepika
  Scenario: User will not be able to view the Award icon on the FDM once the Negotiation has been initiated for the Application
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Create Subaward" against "Autoamtion Announcement for Negotiations" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @57212 @editNegotiationNotAvilableAFterSubmitToGrantor @deepika
  Scenario: Validate the Applicant try to edit the Application after Submit to Grantor
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I cannot see top right button "Edit Negotiation" in page detail

  @57214 @createAwardButtonAfterNegotiationComplete @deepika
  Scenario: Validate whether user will be able to view and select the Create Award button after the negotiation is completed
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Completed Negotiations" content inside "Negotiations" subheader on left panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "flexGridCompletedNegotiations"
    Then I can see top right button "Create Subaward" in page detail

  @57217 @createNegotiationButtonAfterNegotiationComplete @deepika
  Scenario: Validate whether users will not be able to perform Negotiation on the Application once it is completed
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I cannot see row level action button "Initiate Negotiation" against "Autoamtion Announcement for Negotiations" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @57218 @pendingTaskActionIcon @deepika
  Scenario: Validate whether users will review the information by clicking the Action icon on the Pending Task
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    Then I can see row level action button "Start" against "Negotiation Request" in flex table with id "PendingTasks"

  @57219 @applicantEditNegotiationRequest @deepika
  Scenario: Applicant will be able to edit the respective application section(s) that the Agency mentioned in the Negotiation Request
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I click on "Save" in the page details
    Then I see the following messages in the page details :
      | Details is Required to save under Negotiations. |

  @34387 @negotiationWhenOpenUserCannotCreateOther @deepika
  Scenario: Verify that with open negotiation request user can not Complete Negotiation (Negative TC)
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I cannot see top right button "Complete Negotiation" in page detail

  @57220 @viewCompletedNegotiation @deepika
  Scenario: validate whther user is able to view the completed Negotiation on left Navigation under Completed Negotiations
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I get the "EGMS ID"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Completed Negotiations" content inside "Negotiations" subheader on left panel
    Then I can see row level action button "View" against "Autoamtion Announcement for Negotiations" in flex table with id "flexGridCompletedNegotiations"

