@applicationReview @regression
Feature: Validate all scenarios in the Application Review

  Background: Submit the application for Review
    Given I delete the record "Automation Announcement for Application Review" from the object "APPLICATION REVIEWS"
    And I delete the record "Automation Announcement for Application Review" from the object "Qualified Announcement"
    Given I am on "SUBPORTAL" portal
    And I qualify the announcement "Automation Announcement for Application Review" as user "SPI"
      | Actions    | Step 1         | Step 2        | Step 3  | Step 4        |
      | Navigation | Grants Portal  | Opportunities | Active  | Opportunities |
      | FlexTable  | popupflextable | View          | Qualify |               |
    When I click on "Create Application" in the page details
    When I enter value "Automation Application" into field "Title__c"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Given I complete the fields from the sheet "Edition" in excel "Application_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "EnhanceAppBudCateGrantorFlexTableFlexToggle" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "applicationIntake::kpiTableId" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Attachments" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "applicationIntake::allFormsTableId"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "applicationIntake::allFormsTableId"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Given I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details

  @51065 @applicationReviewHappyPath
  Scenario Outline: complete review process for an application
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I pause execution for "5" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I can see top right button "Submit for Approval" in page detail
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51066 @smeReviewEnterDueInDays @smoke
  Scenario Outline: Enter Due in Days for all review forms in SME-review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 10          |
      | Compliance Review | 15          |
    Then I see that "10" has been added in flextable with Id "flexGridApplicationReviewTree"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @38463 @smeReviewAddReviewer
  Scenario Outline: Add a reviewer to each review step under SME Review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    Then I see that "Automation PM" has been added in flextable with Id "flexGridReviewStepUsers"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @38462 @smeReviewAssignApplicationToReviewer @smoke
  Scenario Outline: Verify that user is able to assign applications of a particular announcement to its reviewers
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    Then I see that "Assigned" has been added in flextable with Id "flexGridStepReviews"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @38464 @smeReviewSendForReview @smoke
  Scenario Outline: Choose the reviewers and send for review in SME Review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I refresh the page
    Then I see that "Sent for Review" has been added in flextable with Id "flexGridStepReviews"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51062 @smeReviewCompleteReviewForm @smoke
  Scenario Outline: Complete Review form as Various reviewers in SME Review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    Then I see that "Review Completed" has been added in flextable with Id "flexGridStepReviews"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51063 @promoteToNextFromSMEReview @smoke
  Scenario Outline:Promoting from SME Review to the next review step for an application
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    Then I see that "Promoted to Management Review Step" has been added in flextable with Id "flexGridPreScreenRelatedStepApplicationsFinal"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51064 @managementReviewEnterDueInDays
  Scenario Outline: Enter Due in Days for all review forms in Management review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    Then I see that "5" has been added in flextable with Id "flexGridApplicationReviewTree"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51061 @managementReviewAddReviewer
  Scenario Outline: Add a reviewer to each review step in Management Review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    Then I see that "Automation FO" has been added in flextable with Id "flexGridReviewStepUsers"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51060 @managementReviewAssignApplicationToReviewer @smoke
  Scenario Outline: Assign Application to Reviewer in management Review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    Then I see that "Assigned" has been added in flextable with Id "flexGridStepReviews"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51059 @managementReviewSendForReview @smoke
  Scenario Outline: Choose the reviewers and send for review in Management Review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    Then I see that "Sent for Review" has been added in flextable with Id "flexGridStepReviews"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51058 @managementReviewCompleteReviewForm
  Scenario Outline: Complete Review form as Various reviewers in Management Review
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    Then I see that "Review Completed" has been added in flextable with Id "flexGridStepReviews"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51057 @promoteToFDMFromManagementReview @smoke
  Scenario Outline:Promoting from Last review step review to the FDM step for an application
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I pause execution for "5" seconds
    Then I see that "Review Step" is in "Completed" status
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51056 @subAwardAbbreviationInFDM
  Scenario Outline: Adding a sub-award abbreviation in FDM
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I pause execution for "5" seconds
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    And I click on "Save" in the page details
    Then I see that "Funding Decision Memo" is in "Created" status
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51055 @recommendationForApplicationInFDM
  Scenario Outline: Adding a recommendation for an application in FDM
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I pause execution for "5" seconds
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    And I click on "Save" in the page details
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 500                | Yes                   | Recommended |
    Then I see that "Recommended" has been added in flextable with Id "flexGridFundingDecisionMemoApplications"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51054 @approverAssignmentForApplicationInFDM @smoke
  Scenario Outline: Assigning an approver in FDM
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I pause execution for "5" seconds
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 500                | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Executive Approver | Automation EXE | Automation Test Description |
    Then I see that "Automation EXE" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51053 @submitForApprovalFDM
  Scenario Outline: Submitting the FDM for approval
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I pause execution for "5" seconds
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 500                | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Executive Approver | Automation EXE | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "Green"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |

  @51052 @approveFDM @applicationReviewAndFDMHappyPath @smoke
  Scenario Outline: Approving FDM as the assigned user
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList" with wait for record
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "flexGridAnnouncementReviewSteps" with wait for record
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
      | Automation FO  |
      | Automation PM  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation PM" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation PM" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation FO" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation FO" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "RelatedPanelApplicationsGridFlexToggle" with wait for record
    And I perform quick search for "Automation EXE" in "flexGridAssignPanelApplications" panel
    And I pause execution for "4" seconds
    And I check "Automation EXE" boxes in flex table with id "flexGridAssignPanelApplications"
    When I click on top right button "Assign" in flex table with id "flexGridAssignPanelApplications"
    When I close Modal
    When I refresh the page
    And I check "All" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to Next Step" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on "Next Review Step" in the page details
    When I pause execution for "7" seconds
    When I edit the following rows inline in flex table with id "flexGridApplicationReviewTree" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "flexGridReviewStepUsers" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I click on "Assign" icon for "Automation FO" inside flex table with id "flexGridReviewStepUsers"
    When I perform quick search for "<Application Name>" in "flexGridAssignAppToUser" panel
    And I check "<Application Name>" boxes in flex table with id "flexGridAssignAppToUser"
    When I click on top right button "Assign" in flex table with id "flexGridAssignAppToUser"
    When I close Modal
    And I refresh the page
    When I check "<Application Name>" boxes in flex table with id "flexGridStepReviews"
    And I click on top right button "Send for Review" in flex table with id "flexGridStepReviews"
    And I pause execution for "4" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Task" subheader on left panel
    And I perform quick search for "Record ID" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "PhasePendingTasks"
    When I complete filling in the Review form with recomendation "Recommendation" under title "Comments"
    And I click on "Save" in the page details
    And I click on "Submit" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Review" subheader on left panel
    Given I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "flexGridAnnouncementList" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "flexGridAnnouncementList"
    And I navigate to "Related Logs" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewSteps"
    When I check "<Application Name>" boxes in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    And I click on top right button "Promote to FDM" in flex table with id "flexGridPreScreenRelatedStepApplicationsFinal"
    When I pause execution for "5" seconds
    When I click on "Funding Decision Memo" in the page details
    And I click on "Edit" in the page details
    When I enter value "AuGr" into field "GrantCode__c"
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I enter the recommendation in FDM in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit"
      | Application Title      | Recommended Budget | Recommend for Funding | Comments    |
      | Automation Application | 500                | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "Edit" :
      | Responsibility     | Name           | Description                 |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "Announcement EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record Id" inside table
    When I click on "Approve" on the approval decision box
    Then I see status in Progress-bar is "Approved" and is "green"
    Examples:
      | Announcement Name                              | Application Name       |
      | Automation Announcement for Application Review | Automation Application |