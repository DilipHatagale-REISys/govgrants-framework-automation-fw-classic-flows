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
  Scenario: Validate the Applicants receive the Negotiation request from the Internal Agency
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memo (FDM)" content inside "Application Review" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Autoamtion Announcement for Negotiations" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Autoamtion Announcement for Negotiations" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I can see row level action button "Initiate Negotiation" against "Autoamtion Announcement for Negotiations" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"

  @57037 @pendingTaskCreatedForInternalUserAfterSubmitToGrantor @deepika
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

    @57039 @createSubAwardAfterNegotiationCompleted
    Scenario:User will be able to view and select the Create Award button after the negotiation is completed
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
