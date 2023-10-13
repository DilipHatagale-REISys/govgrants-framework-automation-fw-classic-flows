@negotiations @negotiationWB @grantor-regression @grantor-parallel-regression @regression
Feature: Validate all scenarios in Negotiations

  @164572  @ValidateEXEUserAllowEditSelectAtLeastOneFormErrorMessage @Sprint-3 @Vaibhav
  Scenario: Validate EXE User Allow Edit Select At Least One Form Error Message
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation EXE user"
    When I login to "As a Grantor" app as "EXE" user
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
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
    When I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Negotiations Tab - Select at least one form for negotiation, because Form section is added for negotiation. |

  @164571 @ValidateEXEuserisabletoselectAllowEditforatleastoneformintheAvailableFormsforRevisionstablewhenapplicationissubmittedtograntor @sprint-3 @vaibhav
  Scenario: Validate EXE user is able to select Allow Edit for atleast one form in the Available Forms for Revisionstable when application is submitted to grantor
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I see value "check" for title "Needs Negotiation" against the value "Standard Assurances Form" inside table "---negotiation:-:NegotiationFormsTableId---"

  @164570 @ValidatePOuserisabletoselectAllowEditforatleastoneformintheAvailableFormsforRevisionstablewhenapplicationissubmittedtograntor @sprint-3 @vaibhav
  Scenario: Validate PO user is able to select Allow Edit for atleast one form in the Available Forms for Revisionstable when application is submitted to grantor
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I see value "check" for title "Needs Negotiation" against the value "Standard Assurances Form" inside table "---negotiation:-:NegotiationFormsTableId---"

  @164569 @ValidateEXEUserAbleToSelectFileAndFormsForRevisionPicklistWhenApplicationInreviewedState @sprint-3 @vaibhv
  Scenario: Validate EXE User Able To Select File And Forms For Revision Picklist When Application In reviewed State
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly see field "Application Sections for Negotiation" as "Files: Forms"

  @164568  @ValidatePOUserAbleToSelectFileAndFormsForRevisionPicklistWhenApplicationInreviewedState @sprint-3 @vaibhv
  Scenario: Validate PO User Able To Select File And Forms For Revision Picklist When Application In reviewed State
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    Then I softly see field "Application Sections for Negotiation" as "Files: Forms"

  @164573 @ValidatePOUserselecttheAlloweditforatleastoneformintheavailableformsforRevisionstable
  Scenario: Validate PO User select the Allow edit for atleast one form in the available forms for Revisions table
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationPendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationPendingTaskTableId---"
    When I click on "Request Negotiations" in the page details
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition_Forms" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see the following messages in the page details contains:
      | Negotiations Tab - Select at least one form for negotiation, because Form section is added for negotiation. |

  @164574 @ValidatePOUserelectAlloweditformorethanoneformwhenapplicationissubmittedtograntor @sprint-3 @vaibhav
  Scenario: Validate PO User Select Allow edit for more than one form when application is submitted to grantor
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    And I pause execution for "5" seconds
    When I click on "Form Name" column header inside table with id "---negotiation:-:NegotiationFormsTableId---"
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---negotiation:-:NegotiationFormsTableId---"
    And I enter value "Checked" into field "AllowEdit__c"
    And I click on top right button "Save" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    Then I see value "check" for title "Needs Negotiation" against the value "Standard Assurances Form" inside table "---negotiation:-:NegotiationFormsTableId---"
    Then I see value "check" for title "Needs Negotiation" against the value "Program Application Form" inside table "---negotiation:-:NegotiationFormsTableId---"

  @164575 @ValidateEXEUserelectAlloweditformorethanoneformwhenapplicationissubmittedtograntor @sprint-3 @vaibhav
  Scenario: Validate EXE User Select Allow edit for more than one form when application is submitted to grantor
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I see value "true" for title "Needs Negotiation" against the value "Standard Assurances Form" inside table "---negotiation:-:NegotiationFormsTableId---"
    Then I see value "true" for title "Needs Negotiation" against the value "Program Application Form" inside table "---negotiation:-:NegotiationFormsTableId---"

  @165879 @ValidateEXEUserIsShowAllowEditButton @sprint-3 @vaibhav
  Scenario: Validate EXE User Is Show Allow Edit Button
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:NegotiationFormsTableId---"
    Then I softly can see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:NegotiationFormsTableId---"

  @165831 @ValidateEXEUserAbleToSelectFileFormsApplicationInSubmittedToGrantorStatus @sprint-3 @vaibhav
  Scenario: Validate EXE User Able To Select File Forms Application In Submitted To Grantor Status
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly see that "Initiate Negotiation" has been added in flextable with Id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly see field "Application Sections for Negotiation" as "Files: Forms"

  @165830 @ValidatePOUserAbleToSelectFileFormsApplicationInSubmittedToGrantorStatus @sprint-3 @vaibhav
  Scenario: Validate PO User Able To Select File Forms Application In Submitted To Grantor Status
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION-Automation PO user"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    Then I softly see field "Application Sections for Negotiation" as "Files: Forms"

  @274714 @ValidateCompetitiveValidateusercansendtheApplicationforNegotiationpostFDMisapprovedwhenFAisno @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Competitive Validate user can send the Application for Negotiation post FDM is approved when FA is no
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION_YES_FOCUS_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    And I navigate to "Negotiations" sub tab
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Send to Subrecipient" in the page details
    And I softly see the following messages in the page details contains:
      | Negotiation Tab: Please select "Budget Tab: Budget Details" with "Budget Tab: Budget Summary by Focus Area" in the Application Sections for the Negotiation field. |
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    When I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:homePendingTasks---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly see "Actions" in flex table header "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I expand nested table containing column value "BP01"
    Then I softly see value "$2,000.00" for title "Budget" against the value "Construction" inside table "---applicationReview:-:budgetTableId---"

  @189567 @ValidatethesubrecipientshouldbeabletoprovideNegotiationSummarycommentsintheNegotiationstabbeforeresubmittingpreapplicationtothegrantorinNegotiationDetailsunderNegotiationTab
  Scenario: Validate the subrecipient should be able to provide Negotiation  Summary comments in the Negotiations tab before re-submitting  pre-application to the grantor in Negotiation Details under Negotiation Tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created" in "Negotiation Request Details" pageblock
    Then I softly see field "Pre-Application Sections for Negotiation" as "Files and Forms: Forms"
    Then I softly see field "Details" as "Negotiation Initiated"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I click on "Edit" in the page details
    Then I see textarea field "fieldApplicantResponse__c" is editable
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    Then I softly see field "Details" as "Automation Test"

  @227883 @ValidateAllocationischangedintheannouncementwhentheapplicationissenttosrthenIfthebudgetbudgetdetailssectionisnotinthepicklistthenbudgetbudgetdetailsfieldinautomaticallyadded @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Allocation is changed in the announcement when the application is sent to s/r, then If the "budget: budget details" section is not in the picklist then "budget: budget details" field is automatically added
    And I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO_RISKASSESSMENT_NO-Automation EXE user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "FIRST_BUDGET_CATEGORY_NO_FOCUS_AREA"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    When I login to "As a Grantor" app as "EXE" user
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 5000             |
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Applications" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:applicationsflexTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:applicationsflexTableId---"
    When I navigate to "Negotiations" sub tab
    Then I softly see field "Application Sections for Negotiation" as "Budget: Budget Details" in "Negotiation Request Details" pageblock

  @164576 @ValidateINDuserisabletoEditformonclickofeditactionwhenApplicationisinNegotiationInitiatedstate @sprint-3 @vaibhav
  Scenario: Validate IND user is able to Edit form on click of edit action when Application is in Negotiation Initiated state
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default-Automation IND user"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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

  @164577 @ValidateINDuserisnotabletoeditformifFormisnotselectedonNegotiationstabAvailablFormsforRevisionsandApplicationisinNegotiationInitiatedstate @sprint-3 @vaibhav
  Scenario: Validate IND user is not able to edit form if Form is not selected on Negotiations tab Available Forms for Revisions and Application is in Negotiation Initiated state
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default-Automation IND user"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---negotiation:-:filesFormsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Application Form" in flex table with id "---negotiation:-:filesFormsTableId---"

  @165812 @ValidateINDuserisnotabletoeditselectedformonapplicationwhenapplicationisinNegotiationinitiatedstateandapplicationissubmittedtoGrantor @sprint-3 @vaibhav
  Scenario: Validate IND user is not able to edit selected form on application when application is in Negotiation initiated state and application is submitted to Grantor
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default-Automation IND user"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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
    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
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