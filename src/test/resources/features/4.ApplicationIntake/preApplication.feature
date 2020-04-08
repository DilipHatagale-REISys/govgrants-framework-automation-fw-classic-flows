@preApplication @regression @app
Feature: Validate all scenarios in the Pre-Application

  Background: Qualify Announcement and Create PreApplication
    Given I delete the record "Automation Announcement for Pre-Application" from the object "Application"
    When I delete the record "Automation Announcement for Application" from the object "PreApplication"
    And I delete the record "Automation Announcement for Pre-Application" from the object "Qualified Announcement"
    And I delete the record "Automation Announcement for Application" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"

  @53151 @75961 @72622 @preApplicationCreationProgramIncomeValidation @smoke
  Scenario: Validate the Creation of Pre Application | Validate the user  will be able to view the the Program Income field on the overview tab when the value set as No.
   Validate the title entered while creating the pre-application reflects same under Oppurtunity Name
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Then I softly see field "Opportunity Name" as "Automation Announcement for Application"
    When I navigate to "Overview" sub tab
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "No"
    Then I softly cannot see field "Estimated Program Income For Project Period" inside page block

  @67063 @validateVariousRolesAppearsPreApplication @jitendra
  Scenario: To Validate that various roles appear in the project roles dropdown in contact tableon preapplication of  SPI profile
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    Then I verify that All the following projects roles are available in picklist :
      | Principal Investigator   |
      | Fiscal Contact           |
      | Grants Administrator     |
      | Ebiz POC                 |
      | Other                    |
      | Project Director/Manager |
      | Authorized Signatory     |

  @67077 @67065 @contactsAtPreApplicationFromSameOrganisation @jitendra
  Scenario: To verify that the contacts appearing in the Associate button in Contact table of preapplication is of the Same organisation
    When I navigate to "Overview" sub tab
    And I click table top right button "Associate" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I perform quick search for "Automation SPA" in "---preApplication:-:associatePreAppContactsTableId---" panel
    When I click "Add" after selection of "Automation SPA" in the table "---preApplication:-:associatePreAppContactsTableId---"
    And I close modal by clicking the top right x button
    Then I softly see value "Automation SPA" for title "Name" inside table "---preApplication:-:flexGridPreAppContactTableId---"
    When I click on "View" icon for "Automation SPI" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I save the field labeled "Organization" as "orgName1"
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "Record Id" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "View" icon for "Automation SPA" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I save the field labeled "Organization" as "orgName2"
    Then I softly see that the saved value "{SavedValue:orgName1}" and "{SavedValue:orgName2}" are equal

  @53153 @preApplicationEdition
  Scenario: Validate edition of pre-application
    When I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "Green"

  @75595 @75596 @53154 @70664 @addBudgetDetailsToPreApplication @smoke
  Scenario: Addition of budget in the budget grid to an pre-application |
  Validate User will be able to view the opportunity focus area in the application budget grid when the focus area settings as Yes while announcement creation
    Validate the SPI Users will be able to add new focus areas while creating an pre-application | Validate when the oppurtunity has only one focus area then user will not be able see any other focus areas when clicked on Add focus areas
    When I navigate to "Budget" sub tab
    Then I softly can see top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I click on top right button "Add Focus Area" in flex table with id "---applicationIntake:-:focusAreaTableAppId---"
    When I click "Add" after selection of "Automation Permanent Focus Area1" in the table "---applicationIntake:-:focusAreaAssociateTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:focusAreaAssociateTableId---"
    And I expand nested table containing column value "BP01"
    Then I softly see field "Focus Area : Automation Permanent Focus Area" inside page block
    When I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 1000       | 5000           | 100            |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

  @53155 @PreApplicationAttachmentChecklistCA
  Scenario: Validate the attachment checklist of the PreApplication
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    Then I see "Active" has been added in "Attachments" flex table

  @53160 @70466 @70467 @71116 @submitPreApplication @smoke @deepika
  Scenario: Submitting an pre application to Grantor |To verify that the budget field is editable for the Subrecipient (SPI User) under budget tab on pre-application
  Validate whether SPI user can view the edit button once pre - application has been submitted to Grantor |  Validate whether the user can submit the Pre Application Submission before the due date
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    Then I softly see value "$10,150.00" for title "Total Project Cost" against the value "Construction" inside table "---preApplication:-:preApplicationAttachmentId---"
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    Then I softly cannot see top right button "Edit" in page detail

  @34150 @34023 @53162 @70247 @70248 @70249 @70250 @70251 @70524 @75584 @preApplicationToApplication @deepika
  Scenario Outline: Validate Grantor accept the submitted pre-application and converted it to application | Validate the subrecipient users able to create application from the approved Pre Application
  Validate Announcement owner will be able to view the Accept and Reject button |Validate the subrecipient users able to create application from the approved Pre Application
  Validate Announcement Owner will be able to view the pending task under announcement tab after every pre application submission happens. |Validate pre-application is converted to Application |Verify whether PM, FO,EXE internal user is able to view Accepted Pre Application
  Validate SPI user will not able to create application before Pre-Application is Accepted by Grantor | Validate the SPI user can view the Accepted pre-applications under Pre-Applications - Submitted table list
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly cannot see top right button "Create Application" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---preApplication:-:pendingTaskTableId---" panel
    Then I softly see that "Record Id" has been added in flextable with Id "---preApplication:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record id" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Accept" in the page details
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    Then I softly see value "<Announcement Name>" for title "Pre-Application Title" against the value "Accepted" inside table "RecipientPreApplications"
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I get the "EGMS ID"
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name           | Project Role             | Is Key Contact |
      | Automation SPI | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Then I softly see that "Record Id" is in "Converted to Application" status
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see status in Progress-bar is "Submitted" and is "Green"
    Examples:
      | Announcement Name                       | User |
      | Automation Announcement for Application | PM   |
      |                                         | FO   |
      |                                         | EXE  |

  @70468 @acknowledgeRequiredForPre-App @deepika
  Scenario: Validate the system should throw an validation message if the pre-application is submitted with Acknowledging it
    Given I click on "Edit" in the page details
    And I enter "Edition1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I click on "Submit to Grantor" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Enter an Acknowledgement before submitting this Pre-Application. |

  @70523 @snapshotAfterPreApplicationIsSubmitted @deepika
  Scenario:  Validate SR user is able to view the Snapshot after Pre- Application is Submitted to Grantor status
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    Then I softly see value "$10,150.00" for title "Total Project Cost" against the value "Construction" inside table "---preApplication:-:preApplicationAttachmentId---"
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    And I click on "Menu" in the page details
    And I select "Take Snapshot" from dropdown
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "Snapshot_Pre-Application_Submission.pdf"
    When I download the file
    Then I see "Submitted to Grantor" on page "1" of "govgrants" pdf file

  @34155 @34025 @75585 @preApplicationRejectionByGrantor @deepika
  Scenario Outline: Validate when Grantor Rejects the submitted pre-application then the status of Pre-Application status will be in rejected status
  Validate other than Record Owner PM, FO user will not able to Reject submitted Pre-Application | Validate the SPI user can view the rejected pre-applications under Pre-Applications - Submitted table list
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:preApplicationsGrantorTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---preApplication:-:preApplicationsGrantorTableId---"
    Then I softly cannot see top right button "Reject" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    When I click on "Reject" in the page details
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    Then I softly see value "<Announcement Name>" for title "Pre-Application Title" against the value "Rejected" inside table "RecipientPreApplications"
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly cannot see top right button "Create Application" in page detail
    Examples:
      | Announcement Name                       |
      | Automation Announcement for Application |

  @75522 @75523 @preApplicationPDFRelatedLog @aashish
  Scenario Outline: To verify system allow to download PDF for Pre-application section in Related log tab of announcement
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Attachments" sub tab
    When I upload attachment "InternalOrganization_Field_Values.xlsx" of type "Other"
    When I click on "Submit to Grantor" in the page details
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly cannot see top right button "Create Application" in page detail
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---preApplication:-:pendingTaskTableId---" panel
    Then I softly see that "Record Id" has been added in flextable with Id "---preApplication:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record id" inside flex table with id "---preApplication:-:pendingTaskTableId---"
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Accept" in the page details
    Given I am on "SUBPORTAL" portal
    And I login as "SPI" user
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - Submitted"
    And I perform quick search for "<Announcement Name>" in "RecipientPreApplications" panel
    Then I softly see value "<Announcement Name>" for title "Pre-Application Title" against the value "Accepted" inside table "RecipientPreApplications"
    When I click on "View" icon for "<Announcement Name>" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I get the "EGMS ID"
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "flexGridAppContact" by clicking "Edit" :
      | Name           | Project Role             | Is Key Contact |
      | Automation SPI | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "Automation Announcement for Pre-Application" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I navigate to "Related Log" sub tab
    And I select "Download as PDF" from parallel lines dropdown of "Pre-Applications"
    And I download the file
    And I see "Pre-Applications" on page "1" of "govgrants" pdf file
    Examples:
      | Announcement Name                       |
      | Automation Announcement for Application |