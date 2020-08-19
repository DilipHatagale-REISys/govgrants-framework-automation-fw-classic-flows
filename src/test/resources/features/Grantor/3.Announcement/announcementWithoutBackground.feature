@announcement @commonAnnouncements @grantor-regression @grantor-parallel-regression
Feature: Validate all common scenarios in the  Announcement tab (Announcement without background)

  @70878 @70373 @70821 @70978 @validationOverrideProgramSetting @aashish
  Scenario: To Verify that user can override program settings at Announcement level
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsMatchRequired__c"
    Then I softly see that "GranteeMatch__c" rendered in view mode only
    And I enter value "No" into field "fieldFocusAreaRequired__c"
    And I click modal button "Save and Continue"
    Then I softly see field "Focus Area Required?" as "No"
    Then I softly cannot see field "Pre-Application Due Date" inside page block

  @70369 @validationForSubrecipientMatch @smoke @aashish
  Scenario: To Validate system generates validation message for  by keeping the "Subrecipient Match(%)" field as blank while creating Announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Draft"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal3" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | If you select Subrecipient Match Required setting as Yes then you need to set value for Required Match % |

  @70553 @70604 @validationForNoFocusAreaAndNOObjective @smoke @monu
  Scenario: To Verify that If user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal FA" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "fieldIsGoalsRequired__c"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    Then I softly do not see "Related Focus Areas" page block displayed
    Then I softly do not see "Objectives" page block displayed

  @75457 @validationDetailsOdPublishedCompetitiveAnnouncement @smoke @aashish
  Scenario: To Verify that If user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:competitiveTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---announcement:-:competitiveTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    And I click on "View" icon for "Funding Decision Memo" inside flex table with id "---grantor_tableId:-:FDMTableId---" without waiting for record
    Then I softly can see "Funding Decision Memo" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page

  @75546 @75639 @75633 @75645 @75646 @75544 @75545 @75543 @jitendra @downloadPDF @skipOnJenkins
  Scenario: To verify system allow to download PDF for Announcement-published table for announcement tab
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for FDM tests" and properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for FDM tests}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for FDM tests}" for title "Announcement Name" inside table "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for FDM tests}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Collab" sub tab
    And I click on advance filter "#advfCommunicationHistory" of table id "---announcement:-:collabMessages---"
    And I enter advance filter values inside id "advfCommunicationHistory"
      | Subject | Contains | Dont mess with jitu |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject | Body             |
      | internal.user.product@gmail.com | jitu    | this is bodyless |
    # next 2 Then statements are combined to validate the single test @75633
    Then I softly see the following messages in the page details :
      | Email sent succesfully. |
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "31" seconds
    Then I softly can see mail notification for "INTERNAL" user with following subject:
      | jitu |
    And I click on "View" icon for "jitu" inside flex table with id "---announcement:-:collabMessages---" without waiting for record
    Then I softly see following details for email sent under collab:
      | abc@gmail.com |
      | jitu          |
    And I refresh the page
    And I click on "Reply" icon for "jitu" inside flex table with id "---announcement:-:collabMessages---" without waiting for record
    And I send the email under collab tab with following details:
      | To                              | Subject      | Body             |
      | internal.user.product@gmail.com | changed jitu | this is bodyless |
    And I pause execution for "30" seconds
    Then I softly can see mail notification for "INTERNAL" user with following subject:
      | changed jitu |
    And I close "Reply" modal by clicking the top right x button
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I click on advance filter "#advfActiveFundingOpportunitiesCompitive" of table id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter advance filter values inside id "advfActiveFundingOpportunitiesCompitive"
      | Announcement Name | Contains | {SavedValue:Automation Runtime Announcement for FDM tests} |
    Then I softly see value "{SavedValue:Automation Runtime Announcement for FDM tests}" for title "Announcement Name" inside table "---announcement:-:competitiveAnnouncementTableId---"
    And I refresh the page
    And I click on advance filter "#advfActiveFundingOpportunitiesCompitive" of table id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter advance filter values inside id "advfActiveFundingOpportunitiesCompitive"
      | Announcement Name | Contains | Dont mess with jitu |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I refresh the page
    And I click on parallel menu button in flex table title "Published Competitive Announcements"
    And I select "Download as PDF" from dropdown
    And I download the file
    And I pause execution for "10" seconds
    And I softly see "Published Competitive Announcements" on page "1" of "govgrants" pdf file


  @70999 @73627 @73632 @70997 @70980 @71010 @71011 @71012 @70998 @71022 @71023 @71037 @71027 @validationForErrorMessageOfPreApplication @aashish
  Scenario: To validate system generated error message when Pre Application Due Date is greater than Application Due Date while submitting information
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Test1       | Mandatory | Application | Active |
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description | Required  | Applies To  | Status |
      | Test2       | Mandatory | Application | Active |
    And I click on advance filter "#advfAnnouncementChecklists" of table id "---announcement:-:annChecklist---"
    And I enter advance filter values inside id "advfAnnouncementChecklists"
      | Description | contains | Test2 |
    Then I softly see value "Test2" for title "Description" inside table "---announcement:-:annChecklist---"
    And I refresh the page
    And I click on advance filter "#advfAnnouncementChecklists" of table id "---announcement:-:annChecklist---"
    And I enter advance filter values inside id "advfAnnouncementChecklists"
      | Description | contains | Test3 |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:annChecklist---"
    And I refresh the page
    Then I softly see value "Pre-Screen Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "SME Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Management Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 20              |
    Then I softly see value "20.00%" for title "Step Weight (%)" inside table "---announcement:-:AnnouncementReviewPanel---"
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 75              |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 150.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 25              |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 50.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 0               |
      | SME Review        | 0               |
      | Pre-Screen Review | 0               |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 0.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "Pre-Screen Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly do not see value "Pre-Screen Review" for title "Step Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I navigate to "Overview" sub tab
    And I enter value "30" into field "fieldApplicationDueDate__c"
    And I enter value "40" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Pre-Application Due Date cannot be after Application Due Date |
    And I enter value "20" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "Application Due Date" as "ADD"
    And I save the field labeled "PreApplication Due Date" as "PDD"
    Then I softly see field "PreApplication Due Date" as "{SavedValue:PDD}"
    Then I softly see field "Application Due Date" as "{SavedValue:ADD}"
    And I click on "Edit" in the page details
    And I enter value "-5" into field "fieldPreApplicationDueDate__c"
    And I enter value "-5" into field "fieldApplicationDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Pre-Application Due Date cannot be in the past. |
      | Overview Tab - Application Due Date cannot be in the past.     |

  @71445 @71580 @71593 @userCanValidateGeneratedErrorMessage @aashish
  Scenario: To validate system generates error message,when user giving form weight but review steps weight is 0 in Announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 100             |
      | SME Review        | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly can see top right button "New" in flex table with id "---announcement:-:AnnouncementReviewPanel---"

  @71150 @71578 @71303 @71051 @71054 @71497 @71500 @71503 @71523 @71518 @71151 @71152 @71540 @71153 @71056 @71314 @71307 @verifyTotalReviewFormWeight @aashish @smoke
  Scenario: To validate system generated error message when total Review Form  weight(%) is more than 100 % while creating Announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
    And I click on "Save" in the page details
    And I expand nested table containing column value "SME Review"
    Then I softly see "Form Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 75              |
      | Program Review | 75              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step, it is currently 150.00%. |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 20              |
      | Program Review | 20              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step, it is currently 40.00%. |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 0               |
      | Program Review | 0               |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step, it is currently 0%. |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 60              |
      | Program Review | 40              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 70              |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Weight (%) | Form Name           |
      | 70.00%          | Program Review Form |
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I click on "Delete" icon for "Program Review Form" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    Then I softly do not see value "Program Review Form" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly see value "75%" for title "Section Weight (%)" against the value "Budget" inside table "---announcement:-:reviewPanelTableId---"
    Then I softly see value "15%" for title "Section Weight (%)" against the value "Match" inside table "---announcement:-:reviewPanelTableId---"
    Then I softly see value "10%" for title "Section Weight (%)" against the value "Program Income" inside table "---announcement:-:reviewPanelTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header         |
      | 10%                | Program Income updated |
    Then I softly see value "Program Income updated" for title "Section Header" inside table "---announcement:-:reviewPanelTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header |
      | 10%                | Program Income |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 50                 |
      | Match          | 60                 |
      | Program Income | 70                 |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%, it is currently 180%. |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 0                  |
      | Match          | 0                  |
      | Program Income | 0                  |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Program Income section because it does not have a weight. |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Match section because it does not have a weight.          |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Budget section because it does not have a weight.         |
      | Setup Tab - SME Review - Fiscal Review: A weighted form must contain weighted sections.                                                             |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 25                 |
      | Match          | 25                 |
      | Program Income | 50                 |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 30                 |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%, it is currently 80%. |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review Form" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header   |
      | 15%                | Capability Forms |
    Then I softly see value "Capability Forms" for title "Section Header" inside table "---announcement:-:reviewPanelTableId---"
    And I expand nested table containing column value "1"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question             | Max Score |
      | 1              | Review form question | 50        |
    Then I softly see value "Review form question" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Question                    | Type | Max Score |
      | 1              | Review form question Edited | Date | 40        |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    Then I softly see value "Review form question Edited" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    Then I softly see value "Date" for title "Type" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    Then I softly see value "40" for title "Max Score" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    And I click on "Delete" icon for "Review form question Edited" inside flex table with id "---announcement:-:reviewPanelQuestionsTableId---" without waiting for record
    Then I softly do not see value "Review form question Edited" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"

  @71293 @71295 @71440 @71416 @verifyUserCanAddReviewers @aashish
  Scenario: To verify that user is allow to add reviewers to review forms while creating Announcement | To verify default review forms & reviewer section are populated on Draft announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 0               |
      | SME Review        | 100             |
    And I click on "Save" in the page details
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Fiscal Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Program Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Compliance Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Required?" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Actions" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Reviewer" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Email" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Organization Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "# of Applications Assigned" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---program:-:programReviewPanel---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 50                 |
      | Environment    | 25                 |
      | Permits        | 25                 |
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer |
      | David FO |
    Then I softly see value "Automation PM" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "donald_pm@ggp.test7.atm.automation" for title "Email" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Test Automation Organization" for title "Organization Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I click on "Remove from Form" icon for "Automation PM" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |

  @70861 @70858 @profileNotAllowedToCreateAnnouncement @aashish
  Scenario Outline: Verify user having FO/FD Profile are not allowed to create announcements
    When I login to "As a Grantor" app as "<users>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "---announcement:-:competitiveTableId---"
    Examples:
      | users |
      | FO    |
      | FD    |

  @73630 @73626 @SystemsErrorAfterApplyingWrongFilter @jitendra
  Scenario: To validate system is getting displayed error message while adding invalid values into the filter for Approves section on responsibility tab of announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:approversTableId---" by clicking "Edit" :
      | Role               | Name                      | Description                 |
      | Program Approver   | {SavedValue:PM Username}  | Automation Test Description |
      | Executive Approver | {SavedValue:EXE Username} | Automation Test Description |
      | Fiscal Approver    | {SavedValue:FO Username}  | Automation Test Description |
    And I click on advance filter "#advfGrantorAnnouncementRolesandResponsibilities" of table id "---announcement:-:approversTableId---"
    And I enter advance filter values inside id "advfGrantorAnnouncementRolesandResponsibilities"
      | Responsibility | equals to | Program Reviewer |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:approversTableId---"
    And I navigate to "Setup" sub tab
    And I click on advance filter "#advfAnnoucementPackagesGrantor" of table id "---announcement:-:businessFormlistTableId---"
    And I enter advance filter values inside id "advfAnnoucementPackagesGrantor"
      | Name | Contains | Anything |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:businessFormlistTableId---"

  @73854 @73855 @73852 @73853 @jitendra @filterNotYetQualifiedSPAUser
  Scenario:  To verify, filter functionality for Not Yet Qualified:All section for announcement by external user
  | To verify, all closed opportunity which has Not Qualified should reflect under Not Yet Qualified: Closed list view
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPA" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I save the value from row "1" for column name "Announcement ID" as "annId" from flex table "---announcement:-:opportunityNotQtableId---"
    And I click on advance filter "#advfnyqae" of table id "---announcement:-:opportunityNotQtableId---"
    And I enter advance filter values inside id "advfnyqae"
      | Announcement ID | Contains | {SavedValue:annId} |
    Then I softly see value "{SavedValue:annId}" for title "Announcement ID" inside table "---announcement:-:opportunityNotQtableId---"
    And I refresh the page
    And I click on advance filter "#advfnyqae" of table id "---announcement:-:opportunityNotQtableId---"
    And I enter advance filter values inside id "advfnyqae"
      | Announcement ID | Contains | I am laughing |
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:opportunityNotQtableId---"
    And I refresh the page
    And I click toggle button to select "Not Yet Qualified Opportunities - Closed"
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:opportunityNotQtableId---"
    And I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:annId}" in "---announcement:-:opportunityNotQtableId---" panel
    Then I softly see value "{SavedValue:annId}" for title "Announcement ID" inside table "---announcement:-:opportunityNotQtableId---"

  @73866 @73870 @jitendra @viewQualifiedOpportunitySPA
  Scenario: To verify user allow to view Qualified opportunity  in opportunity tab
  | To verify, searched functionality for Qualified Opportunities :All section for opportunities phase
    Given I published "Directed" type announcement having name "Automation Runtime Announcement for Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---" without waiting for record
    When I click on "Qualify" in the page details
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application Intake}" in "---preApplication:-:qualifiedOpprtunitesTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Application Intake}" for title "Opportunity Name" inside table "---preApplication:-:qualifiedOpprtunitesTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "egms id" from flex table "---preApplication:-:qualifiedOpprtunitesTableId---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application Intake}" inside flex table with id "---preApplication:-:qualifiedOpprtunitesTableId---" without waiting for record
    Then I softly see field "EGMS ID" as "{SavedValue:egms id}"

  @73857 @75635 @75624 @publishingExtendDatedButtonDisplay @buglogged95462
  Scenario: To Verify that Extend Dates(Revise) button will be shown when Announcement status is Published  for announcement
    Given I published "Competitive" type announcement having name "Announcement Runtime for Announcement Extend" and properties "default"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Announcement Runtime for Announcement Extend}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement Runtime for Announcement Extend}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Extend Dates" in page detail
    And I navigate to "Collab" sub tab
    And I enter value "test @Sarah PM" in my feed section and share the post
    And I refresh the page
    And I wait for "30" seconds
    And I enter value "testing collab @Sarah PM" in my feed section and share the post
    Then I softly see "Sarah PM" inside flex table with id "---announcement:-:myFeedTableId---"
    Then I softly see "test" inside flex table with id "---announcement:-:myFeedTableId---"
    Then I softly see "testing collab" inside flex table with id "---announcement:-:myFeedTableId---"
    And I click on hyperlink containing value "More Options"
    And I click on hyperlink containing value "Delete"
    And I click modal button "OK"
    Then I softly do not see "testing collab" inside flex table with id "---announcement:-:collabMessages---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject | Body             |
      | internal.user.product@gmail.com | jitu    | this is bodyless |
    Then I softly see the following messages in the page details :
      | Email sent succesfully. |
    And I close "Send Email" modal by clicking the top right x button
    And I click on advance filter "#advfCommunicationHistory" of table id "---announcement:-:collabMessages---"
    And I enter advance filter values inside id "advfCommunicationHistory"
      | Subject | Contains | jitu |
    Then I softly see "jitu" inside flex table with id "---announcement:-:collabMessages---"

  @75524 @publishedAllowToDownloadPDF @skipOnJenkins
  Scenario: To verify system allow to download PDF for Announcement after publishing it
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for pdf Tests" and properties "default"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Announcement for pdf Tests}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Announcement for pdf Tests}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Menu" in the page details
    And I select "Download As PDF" from dropdown
    And I download the file
    And I see "{SavedValue:Automation Announcement for pdf Tests}" on page "1" of "govgrants" pdf file

  @75632 @75621 @searchFunctionalityForMessagesMyFeedInCollab @keerti @buglogged95462
  Scenario: To verify search functionality for messages section in collab tab for announcement
  | To verify entered My Feed from the collab tab section of announcement is getting displayed on home phase.
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Collab" sub tab
    And I enter value "Hi @{SavedValue:PM Username}" in my feed section and share the post
    Then I softly see "{SavedValue:PM Username}" inside flex table with id "---announcement:-:myFeedTableId---"
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                              | Subject | Body             |
      | internal.user.product@gmail.com | jitu    | this is bodyless |
    Then I softly see the following messages in the page details :
      | Email sent succesfully. |
    And I close "Send Email" modal by clicking the top right x button
    When I perform quick search for "jitu" in "---announcement:-:collabMessages---" panel
    Then I softly see "jitu" inside flex table with id "---announcement:-:collabMessages---"
    And I navigate to "Home" tab
    Then I softly see "{SavedValue:PM Username}" inside flex table with id "---announcement:-:homeCollabFeedId---"
    Then I softly see "Hi" inside flex table with id "---announcement:-:homeCollabFeedId---"

  @78086 @validatingReviewersForSMEAndManagementReviewForm @meenakshi
  Scenario: To validate the Program review steps are copied to Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer      |
      | Automation FO |
    And I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Automation FO" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I expand nested table containing column value "Management Review"
    Then I softly see value "Automation EXE" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"
