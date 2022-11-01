@announcement @commonAnnouncements @grantor-regression @grantor-parallel-regression @regression
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
  Scenario: To Validate system generates validation message for  by keeping the "Subrecipient Match(%)" field as blank while creating Announcement
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal3" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | If you select Subrecipient Match Required setting as Yes then you need to set value for Required Match % |

  @70553 @70604 @validationForNoFocusAreaAndNOObjective @smoke @monu
  Scenario: To Verify thatIf user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
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

  @75457 @validationDetailsOfPublishedCompetitiveAnnouncement @smoke @aashish
  Scenario: To Verify that If user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
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
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    When I enter value "45" into field "fieldPreApplicationDueDate__c"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    When I click on "Edit" in the page details
    And I navigate to "Financials" sub tab
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
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
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 150.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 25              |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 50.00%. |
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
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 0.00%. |
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
      | Overview Tab - Application Due Date cannot be in the past. |

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
    Then I see value "25.00%" for title "Form Weight (%)" against the value "Program Review" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I see value "25.00%" for title "Form Weight (%)" against the value "Fiscal Review" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I see value "50.00%" for title "Form Weight (%)" against the value "Compliance Review" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I refresh the page
    And I expand nested table containing column value "SME Review"
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
    And I pause execution for "2" seconds
    And I click on "Save" in the page details
    And I expand nested table containing column value "SME Review"
    Then I softly see "Form Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 75              |
      | Program Review | 75              |
    And I pause execution for "2" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 150.00%. |
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 20              |
      | Program Review | 20              |
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 40.00%. |
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 0               |
      | Program Review | 0               |
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 0%. |
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 60              |
      | Program Review | 40              |
    And I pause execution for "3" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 70              |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Weight (%) | Form Name           |
      | 70.00%          | Program Review Form |
    And I pause execution for "3" seconds
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
    And I pause execution for "3" seconds
    Then I softly see value "Program Income updated" for title "Section Header" inside table "---announcement:-:reviewPanelTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header |
      | 10%                | Program Income |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 50                 |
      | Match          | 60                 |
      | Program Income | 70                 |
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review - Fiscal Review: The total section weight must equal 100% or 0%. It is currently 180%. |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 0                  |
      | Match          | 0                  |
      | Program Income | 0                  |
    And I pause execution for "2" seconds
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
    And I pause execution for "3" seconds
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
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step. It is currently 60.00%.       |
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%. It is currently 80%. |
    And I pause execution for "3" seconds
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 70              |
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Weight (%) | Form Name           |
      | 70.00%          | Program Review Form |
    And I pause execution for "3" seconds
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I click on "Review Form" icon for "Program Review Form" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Weight (%) | Section Header   |
      | 15%                | Capability Forms |
    And I pause execution for "3" seconds
    Then I softly see value "Capability Forms" for title "Section Header" inside table "---announcement:-:reviewPanelTableId---"
    And I expand nested table containing column value "1"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question             | Max Score |
      | 1              | Review form question | 50        |
    And I pause execution for "3" seconds
    Then I softly see value "Review form question" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "Edit" :
      | Question Order | Question                    | Type | Max Score |
      | 1              | Review form question Edited | Date | 40        |
    And I pause execution for "3" seconds
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
    And I pause execution for "2" seconds
    Then I softly see value "Fiscal Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Program Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Compliance Review" for title "Form Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Required?" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Reviewer" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Email" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "Organization Name" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see "# of Applications Assigned" in flex table header "---announcement:-:AnnouncementReviewPanel---"
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 50                 |
      | Environment    | 25                 |
      | Permits        | 25                 |
    And I pause execution for "2" seconds
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
   # And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
   # And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "2" seconds
    #And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    And I refresh the page
    And I click on top right button "Validate" in flex table with id "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I expand nested table containing column value "SME Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    And I refresh the page
    And I expand nested table containing column value "SME Review"
    Then I softly see value "{SavedValue:PM Username}" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "pm.automation@yopmail.com" for title "Email" inside table "---announcement:-:AnnouncementReviewPanel---"
    Then I softly see value "Test Automation Organization" for title "Organization Name" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I click on "Remove from Form" icon for "Automation PM" inside flex table with id "---announcement:-:AnnouncementReviewPanel---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:AnnouncementReviewPanel---"
   # Then I softly see the following messages in the page details :
   #   | Record deleted successfully. |

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
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    And I click on advance filter "#advfGrantorAnnouncementRolesandResponsibilities" of table id "---announcement:-:approversTableId---"
    And I enter advance filter values inside id "advfGrantorAnnouncementRolesandResponsibilities"
      | Announcement | equals to | Step 4 |
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
    And I save the value from row "1" for column name "EGMS ID" as "annId" from flex table "---announcement:-:opportunityNotQtableId---"
    And I click on advance filter "#advfnyqae" of table id "---announcement:-:opportunityNotQtableId---"
    And I enter advance filter values inside id "advfnyqae"
      | EGMS ID | Contains | {SavedValue:annId} |
    Then I softly see value "{SavedValue:annId}" for title "EGMS ID" inside table "---announcement:-:opportunityNotQtableId---"
    And I refresh the page
    And I click on advance filter "#advfnyqae" of table id "---announcement:-:opportunityNotQtableId---"
    And I enter advance filter values inside id "advfnyqae"
      | EGMS ID | Contains | I am laughing |
    Then I softly see "No records found" inside flex table with id "---announcement:-:opportunityNotQtableId---"
    And I refresh the page
    And I click toggle button to select "Not Yet Qualified Opportunities - Closed"
    #Then I softly see "No records found" inside flex table with id "---announcement:-:opportunityNotQtableId---"
    And I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:annId}" in "---announcement:-:opportunityNotQtableId---" panel
    Then I softly see value "{SavedValue:annId}" for title "EGMS ID" inside table "---announcement:-:opportunityNotQtableId---"

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

  @73857 @75635 @75624 @publishingExtendDatedButtonDisplay @buglogged95462 @wip
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

  @75632 @75621 @searchFunctionalityForMessagesMyFeedInCollab @keerti @buglogged95462 @wip
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
  #  And I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementReviewPanel---" by clicking "Add" :
      | Reviewer       |
      | Automation EXE |
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When  I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Automation FO" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"
    And I expand nested table containing column value "Management Review"
    Then I softly see value "Automation EXE" for title "Reviewer" inside table "---announcement:-:AnnouncementReviewPanel---"

  @139787 @VerifyInheritatedApproverAtAnnouncementFromProgram_CompetitiveAnnouncement-RnRFunctionality @monu
  Scenario Outline:  verify  approver get inherited from program level to announcement
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program | Announcement |
      | {SavedValue:EXE Username} | Step 1  | Step 1       |
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" inside table "---program:-:approverTableId---"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    When I save the field labeled "EGMS ID" as "ActivatedProgramForAnnouncement"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter in modal value "{SavedValue:ActivatedProgramForAnnouncement}" into field "fieldProgram__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Announcement" inside table "---announcement:-:approversTableId---"

    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @169907 @Verifyuserabletosee"Preview"icon"Forms"section"PreviewPackage"Modalforannouncementrecord. @Sprint-7 @Vrishali
  Scenario: Verify user  should able to see the "Preview" icon  in "Forms" section on "Preview Package" Modal for announcement record.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I save the field labeled "Program Name" as "Automation Runtime Internal Program"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Construction                                | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Pre-application Form" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---program:-:previewPackageTableId---"
    When I click on "Preview" icon for "Standard Pre-Application form" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    Then I see new tab is opened

  @169906 @usershouldabletoseethe"Preview"iconin"Forms"sectionon"PreviewPackage"Modalforannouncementrecord. @Sprint-7 @Vrishali
  Scenario: Verify user  should able to see the "Preview" icon  in "Forms" section on "Preview Package" Modal for announcement record.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I save the field labeled "Program Name" as "Automation Runtime Internal Program"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Construction                                | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Pre-application Form" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---program:-:previewPackageTableId---"

  @169905 @Usershouldabletoseethe"Preview"iconin"Forms"sectionon"PreviewPackage"ModalforGrantorpre-applicationformforannouncementrecord. @Sprint-7 @Vrishali
  Scenario: Verify user should able to see the "Preview" icon in "Forms" section on "Preview Package" Modal for  Grantor pre-application form for announcement record.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I save the field labeled "Program Name" as "Automation Runtime Internal Program"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Construction                                | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    When I click on "Preview" icon for "Grantor Pre-application Form" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---program:-:previewPackageTableId---"

  @169904 @usershouldabletoopen/see(OnSamewindow)GrantorPre-applicationformwhenuserclickon"Preview"actionforAnnouncementrecord. @Sprint-7 @Vrishali
  Scenario: Verify user should able to open/see(On Same window) Grantor Pre-application form when user  click on "Preview" action for Announcement record.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I save the field labeled "Program Name" as "Automation Runtime Internal Program"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Construction                                | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    And I click on "Preview" icon for "Grantor Pre-application Form" inside flex table with id "---announcement:-:businessFormlistTableId---" without waiting for record
    Then I softly see "Preview Package" opens in overLay window

  @169903 @Verifyuserabletosee"Preview"actionof"GrantorPre-applicationform"atcreatedstateforAnnouncementrecord. @Sprint-7 @Vrishali
  Scenario: Verify user should able to see "Preview" action of "Grantor Pre-application form" at created state for Announcement record.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I save the field labeled "Program Name" as "Automation Runtime Internal Program"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Construction                                | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"
    Then I softly can see row level action button "Preview" against "Grantor Pre-application Form" in flex table with id "---announcement:-:businessFormlistTableId---"

  @169900 @Verifyusershouldabletoseenew"GrantorPre-applicationform"undersetupof"Announcement"record @Sprint-7 @Vrishali
  Scenario: Verify user should able to see new "Grantor Pre-application form" under the setup tab of  "Announcement" record
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I save the field labeled "Program Name" as "Automation Runtime Internal Program"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Construction                                | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---announcement:-:businessFormlistTableId---"

  @174348 @Versionnumbershoulddisplay1forGrantorPre-applicationformundertheversionnumbercolumn @Sprint-7 @Vrishali
  Scenario: Version number  should display  1 for Grantor Pre-application form under the version number column
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I save the field labeled "Program Name" as "Automation Runtime Internal Program"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I pause execution for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I switch to iframe with id "---program:-:addFilesIframeId---"
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Construction                                | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    And I perform quick search for "Grantor Pre-application Form" in "---announcement:-:businessFormlistTableId---" panel
    Then I softly see value "1" for title "Version Number" inside table "---announcement:-:businessFormlistTableId---"

  @194677 @194682 @194683 @194690 @194685 @ValidateusershouldabletoseethenewmoduleAnnouncementmodulewhenuserenterthesourceuser&targetuser @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate user should able to click on play button after selecting the source & target user with the same profile PM
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I pause execution for "3" seconds
    Then I softly see " Reassign Ownership" page block displayed
    Then I see the text containing "Announcement"
    #194682
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    Then I softly see "Announcements Available for Reassignment " page block displayed
    #194683
    Then I softly see "Announcements Available for Reassignment " page block displayed
    Then I softly see "Announcements Owned by Target User " page block displayed
    #194690
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see the following messages in the page details contains:
      | Please select atleast one record |
    #194685
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"

  @194692 @Validateaftertransfertorecordusershouldabletoseethetheserecordintargetusertable @sprint-4 @vaibhav @reassignment
  Scenario: Validate after transfer to record user should able to see the these record in target user table
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"

  @194694 @194714 @194712 @Validateclickontransferredbuttonthenusershouldabletoseethewarningmessage @sprint-4 @vaibhav @reassignment @ownershipcheck
  Scenario: Validate click on transferred button then user should able to see the warning message
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    #194714
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "No" on modal confirmation box
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminOwnerReplaceTableId---"
    #194712
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    Then I softly see the following messages in the page details contains:
      | Transfer is in progress, kindly wait for email confirmation. |

  @194722 @ValidateownershipischangedthenonlyAnnouncementownerischanged @sprint-4 @vaibhav @reassignment
  Scenario: Validate  ownership is changed then only Announcement owner is changed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---announcement:-:announcementOwner---"

  @194741 @Validatenewownercanchangetheextenddate&unpublishtheannouncementonlyannouncementisinpublishedstate @sprint-4 @vaibhav @reassignment @ownershipcheck
  Scenario: Validate new owner can change the extend date & unpublish the announcement only if announcement is in published state
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly can see top right button "Extend Dates" in page detail
    Then I softly can see top right button "Unpublish" in page detail

  @194742 @Validateoldownershouldonlyseetheannouncementrecord @sprint-4 @vaibhav @reassignment
  Scenario: Validate old owner should only see the announcement record
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I can see row level action button "View" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @194755 @Validateonlyownerofannouncementrecordcaninitiatethereview @sprint-4 @vaibhav @reassignment
  Scenario: Validate only owner of announcement record can initiate the review
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
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
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @194756 @Validateowneristransferredbeforeinitiatingthereviewonlynewreassignedownershouldbeabletoinitiatethereview @sprint-4 @vaibhav @reassignment
  Scenario: Validate owner is transferred before initiating the review only new reassigned owner should be able to initiate the review
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
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
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @194760 @Validateapplicationsorpreapplicationattachedtothatannouncementbeforeownershiptransfer @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate applications or pre-application attached to that announcement before ownership transfer
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal4" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I click on "Publish" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "Green"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Accept" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppId}" in "---preApplication:-:recipientPreApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:preAppId}" inside flex table with id "---preApplication:-:recipientPreApplicationsTableId---"
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
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
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM1" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @194763 @Validateownershipreassignmentofannouncementfieldhistoryshouldgetupdated @sprint-4 @vaibhav @reassignment
  Scenario: Validate ownership reassignment of announcement field history should get updated
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see value "Automation EXE1" for title "New Value" inside table "---announcement:-:annFieldHistory---"
    Then I softly see value "Automation EXE" for title "Old Value" inside table "---announcement:-:annFieldHistory---"

  @196847 @Validateuserapprovedtheannouncement&reassignownershiptonewuserthenpublishoptionshoulddisplaytonewowner @sprint-4 @vaibhav @reassignment @ownershipcheck
  Scenario: Validate user approved the announcement & reassign ownership to  new user then publish option should display to new owner
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly cannot see top right button "Publish" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail

  @196852 @ValidateuseraddedtheYesNofunctionalitybeforereassignmentownershipthenafterownershipnewownerhavingtheaccessofthisparticularsettings @sprint-4 @vaibhav @reassignment
  Scenario: Validate user added the Yes No functionality before reassignment ownership then after ownership new owner having the access of this particular settings
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:kpiflextableid---"

  @196862 @ValidateusershouldnotabletoreassignownershipofAnnouncementrecordtosameprofilebutdifferentorganization @sprint-4 @vaibhav @reassignment
  Scenario: Validate user should not able to reassign ownership of Announcement record  to same profile but different organization
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Victor EXE" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    Then I softly see the following messages in the page details contains:
      | Ownership cannot be transferred across profiles and organizations. |

  @196887 @Validateusershouldnotabletoseetheinactiveinternaluserintargetuser @sprint-4 @vaibhav @reassignment
  Scenario: Validate user should not able to see the inactive internal user in  target user
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I enter value "User FD" into field "s2id_autogen1"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result

  @197927 @Validateannouncementiscreated&changetheownershipofannouncementthennewbuttonofpeerreviewisdisplaytothenewowner @sprint-4 @vaibhav @reassignment
  Scenario: Validate announcement is created & change the ownership of announcement then new button of peer review is display to the new owner
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---announcement:-:reviewersTableId---"

  @197931 @Validateafterapprovedtheannouncementwhenuserchangetheownershipofannouncementthenpublishbuttonshoulddisplaytothenewowner @sprint-4 @vaibhav @reassignment
  Scenario: Validate after approved the announcement when user change the ownership of  announcement then publish button should display to the new owner
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail

  @197932 @197934 @197935 @197937 @Validateaftercreatedannouncementuserchangedtheownershipofannouncementthenalloverviewtabbuttonaccessshouldgettothenewowner @sprint-4 @vaibhav @reassignment
  Scenario: Validate after created announcement user changed the ownership of announcement then all overview tab button access should get to the new owner
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "fieldAnnouncementName__c" is in edit mode
    Then I softly see fields "fieldAnnouncementType__c" is in edit mode
    Then I softly see fields "fieldOrganization__c" is in edit mode
    Then I softly see fields "fieldAdministrationBureauUnit__c" is in edit mode
    Then I softly see fields "fieldMaxApplicationsAllowed__c" is in edit mode
    Then I softly see fields "fieldAreExpensesBuildIUpLevel__c" is in edit mode
    Then I softly see fields "fieldIsAdvancePermitted__c" is in edit mode
    Then I softly see fields "fieldIsNegotiationsAllowed__c" is in edit mode
    Then I softly see fields "fieldAnnouncementDescription__c" is in edit mode
    Then I softly see fields "fieldEligibleApplicantTypes__c" is in edit mode
    Then I softly see fields "fieldApplicationDueDate__c" is in edit mode
    Then I softly see fields "fieldQAAvailability__c" is in edit mode
    Then I can see top right button "Associate" in flex table with id "---announcement:-:relatedAnnouncementTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    Then I can see top right button "New" in flex table with id "---announcement:-:contactTableId---"
    #197934
    And I navigate to "Financials" sub tab
    Then I softly see fields "fieldAwardFloor__c" is in edit mode
    Then I softly see fields "fieldAwardCeiling__c" is in edit mode
    Then I softly see fields "fieldTotalCommittedAmount__c" is in edit mode
    Then I can see top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I can see top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    #197935
    When I navigate to "Setup" sub tab
    Then I can see top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---announcement:-:kpiflextableid---"
    Then I can see top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I can see top right button "New" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    #197937
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---announcement:-:reviewersTableId---"
    Then I softly can see top right button "New" in flex table with id "---announcement:-:approversTableId---"
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I softly can see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"

  @194693 @ValidatePMuserIcanseemyownpendingtasksinMyTasksectionandcanreassignownershiptaskstotargeuser @sprint-4 @vaibhav @reassignment @taskreassign
  Scenario: Validate PM user I can see my own pending tasks in 'My Task' section and can reassign ownership tasks to target user
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @195050 @ValidatePOuserIcanseemyownpendingtasksinMyTasksectionandcanreassignownershiptaskstotargeuser @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate PO user I can see my own pending tasks in 'My Task' section and can reassign ownership tasks to target user
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @195051 @ValidateEXEuserIcanseemyownpendingtasksinMyTasksectionandcanreassignownershiptaskstotargeuser @sprint-4 @vaibhav @reassignment @taskreassign
  Scenario: Validate EXE user I can see my own pending tasks in 'My Task' section and can reassign ownership tasks to target user
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @195195 @ValidateusercancheckthetaskfromReassignMyCurrentTasktableandreassignthemtothenewuserofsameprofileandsameorganization @sprint-4 @vaibhav @reassignment
  Scenario: Validate user can check the task from Reassign My Current Task table and reassign them to the new user of same profile and same organization
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @195196 @Validateusercannotreassignownershiptasktothenewuserwithdifferentprofileandsameorganization @sprint-4 @vaibhav @reassignment
  Scenario: Validate user can not reassign ownership task to the new user with different profile and same organization
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Associate" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result

  @195199 @ValidateusercannotreassignownershiptasktothenewuserwithSameprofileanddifferentorganization @sprint-4 @vaibhav @reassignment
  Scenario: Validate user can not reassign ownership task to the new user with Same profile and different organization
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Associate" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Sarah PM"
    And I pause execution for "4" seconds
    Then I softly see "No matches found" inside auto search result

  @195201 @ValidatependingtaskshouldbegeneratedforPOasnewownerofAnn @sprint-4 @vaibhav @reassignment @taskreassign
  Scenario: Validate pending task should be generated for PO as new owner of Ann
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    When I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"

  @195215 @ValidatePMasoldAnnownercanonlyviewAnnrecordoncehereassignAnnownershiptasktonewuser @sprint-4 @vaibhav @reassignment
  Scenario: Validate PM as old Ann owner can only view Ann record once he reassign Ann ownership task to new user
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I can see row level action button "View" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I cannot see row level action button "Edit" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:AnnEGMSID}" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @195225 @ValidatenewAnnownershouldbedisplayforownersectionunderresponsibilitytabafterownershiptaskreassigntonewuser @sprint-4 @vaibhav @reassignment
  Scenario: Validate new Ann owner should be display for owner section under responsibility tab after ownership task reassign to new user
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM1 | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM" for title "Name" inside table "---announcement:-:announcementOwner---"

  @195229 @ValidatevalidationmessageshouldbedisplayifusertrytoreassignAnnownershiptasktohimself @sprint-4 @vaibhav @reassignment
  Scenario: Validate validation message should be display if user try to reassign Ann ownership task to him self
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM1 | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM" into field "s2id_autogen3"
    Then I softly see confirmation box with body "Source User and Target User cannot be same.Please select different Source and Target Users" is displayed

  @195230 @ValidateoldAnnownershouldnotabletoseeAnntaskinMyTasktableonceownershiptaskreassigntootheruser @sprint-4 @vaibhav @reassignment
  Scenario: Validate old Ann owner should not able to see Ann task in My Task table once ownership task reassign to other user
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM1 | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @195265 @ValidatepreapptaskassigntonewAnnownerPOaftersubmittograntorifpreappcreatedonnewAnnownerafterownershipreassignment  @sprint-4 @vaibhav @reassignment
  Scenario: Validate preapp task assign to new Ann owner PO after submit to grantor if preapp created on new Ann owner after ownership reassignment
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal4" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "preAppId"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When  I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:budgetCategoryGridTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:flexGridPreAppContactTableId---"
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:preAppId}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:preAppId}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"

  @195276 @ValidateoldownerofapplicationinternalshouldnotabletoproccedfurtherreviewinitiationprocessifappcreatedonnewownerafterAnnownershipreassignment @sprint-4 @vaibhav @reassignment @ownvai
  Scenario: Validate old owner of application internal should not able to procced further review initiation process if app created on new owner after Ann ownership reassignment
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
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
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly cannot see row level action button "Initiate Review Process" against "{SavedValue:AnnEGMSID}" in flex table with id "---applicationReview:-:announcementListTableId---"

  @197929 @ValidateAnnownerunpublishAnnandreassignownershiptonewuserforpublishthenpendingtaskshouldgeneratefornewowner @sprint-4 @vaibhav @reassignment
  Scenario: Validate Ann owner unpublish Ann and reassign ownership to new user for publish then pending task should generate for new owner
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    And I click on "Unpublish" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    Then I see value "Publish Announcement" for title "Task Type" inside table "---home:-:internalHomePendingTaskTableId---"

  @198424 @ValidatefieldhistoryshouldbeupdateafterAnnownershiptaskreassigntootheruser @sprint-4 @vaibhav @reassignment
  Scenario: Validate field history should be update after Ann ownership task reassign to other user
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Publish" in page detail
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    And I navigate to "History" sub tab
    Then I softly see value "Automation PM1" for title "New Value" against the value "Owner" inside table "---announcement:-:annFieldHistory---"
    Then I softly see value "Automation PM" for title "Old Value" inside table "---announcement:-:annFieldHistory---"

  @195677 @Validatethatnewapproversnameshouldbeupdatentheresponsibilitytabwhenapprovaltaskisreassigned @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate that new approver's name should be update in the responsibility tab when approval task is reassigned
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM1 | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"

  @217675 @ValidateAnnValidateapprovercanreassignthetaskifhe/shewasdefinedonthecurrentmodule @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Ann Validate approver can reassign the task if he/she was defined on the current module
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 3       |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter values into fields
      | Value                                       | Field                      |
      | Automation Runtime Competitive Announcement | AnnouncementName__c        |
      | {SavedValue:ProgramEGMSID}                  | Program__c                 |
      | Non-Construction                            | Budget_Category_Package__c |
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 2       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "{SavedValue:PO Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "{SavedValue:FO Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 3" for title "Announcement" against the value "{SavedValue:FD Username}" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Announcement" against the value "{SavedValue:FO Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation FO1" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see value "Automation FO1" for title "Name" inside table "---program:-:approverTableId---"

  @221968 @Validatestep2approverisinsertedforAnncolumnwhenapprovaltaskisreassigned @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate step2 approver is inserted for Ann column when approval task is reassigned
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 2       | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Announcement" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Post Award Reporting" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Payment Request" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Monitoring" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "{SavedValue:PM Username}" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @224225 @ValidatePMuserontaskreassignmentpageexistingmessageshouldhaveappropriateinformationregardingQueueBasedTasks @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate PM user verify on task reassignment page existing message should have appropriate information regarding Queue Based Tasks
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    Then I do not see "Reassign" inside "My Tasks" is displayed
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly see the text containing :
      | Pre-Application and Applications Tasks which are assigned to the internal user will not be visible in the Task Reassignment page. These tasks are associated with Announcement Owner. To reassign these tasks, go to the Ownership Reassignment page and transfer the ownership of desired announcement. Queue based tasks(Related to User registration and Organizational Risk assessment) which are assigned to this user will not be shown here. Please check the Pending Tasks table for such tasks. |

  @230020 @ValidateAnnnewownercanseeeditanddeleteiconforformsafterAnnownershipwillgetchange @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate Ann new owner can see edit and delete icon for forms after Ann ownership will get change
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I can see row level action button "Edit" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I can see row level action button "Delete" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I can see row level action button "Edit" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I can see row level action button "Delete" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    Then I cannot see row level action button "Edit" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"
    Then I cannot see row level action button "Delete" against "Pre-Screen" in flex table with id "---announcement:-:annReviewFormsTableId---"

  @195209 @ValidateemailshouldbegeneratedfornewowneronceoldownerreassignAnnownershiptasktonewuser @sprint-12-US-226646 @vaibhav @reassignment
  Scenario: Validate  email should be generated for new owner once old owner reassign Ann ownership task to new user
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation PM Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    And I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation PM Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @194721 @194718 @ValidateemailshouldgetreachedtoSApreviousownerwhenownershipofrecordischanged @sprint-11-US-224734 @vaibhav @reassignment
  Scenario: Validate email should get reached to "SA"(previous owner) when ownership of record is changed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I checkout to yopmail with mailid "govgrantsautomation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation ADMIN Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
     #194721
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:AnnEGMSID} Automation ADMIN Announcement

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @221973 @Validatetaskeassignmentdoesnothappenwhenausertriestoreassignhistasktoanotheruserisresponsiblefordifferentstepofsamemodule @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate task reassignment does not happen when a user tries to reassign his task to another user is responsible for different step of same module
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE | Step 1       | Step 2 | Step 2 | Step 2            | Step 2               | Step 2          | Step 2     | Step 2   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name            | Announcement | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE1 | Step 2       | Step 1               | Step 1          | Step 1     | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    |
      | Automation FO | Step 3       | Step 3 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID} Approve Funding Announcement Not Started Approve Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation EXE You cannot specify the same user for multiple steps for Announcement


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @221975 @ValidateAnnIfapproverandownerofaAnnaresamevalidateafterreassigningtheapprovaltaskownershipofrecordisnotchanged @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Ann If approver and owner of a Ann are same validate after reassigning the approval task ownership of record is not changed
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Closeout |
      | Automation PM1 | Step 1       | Step 1 | Step 1 | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Payment Request | Monitoring |
      | Automation EXE | Step 2       | Step 2          | Step 2     |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE" for title "Name" inside table "---announcement:-:announcementOwner---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation EXE1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Payment Request" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Monitoring" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation EXE" for title "Name" inside table "---announcement:-:announcementOwner---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation EXE1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Payment Request" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Monitoring" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"

  @221979 @ValidateAnnIfapprandownerofAnnaresameafterreassigningtheownershipofAnnrecordapprovernameshouldnotchanged @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Ann If approver and owner of a Ann are same validate after reassigning the ownership of Ann record approver name should not changed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Monitoring |
      | Automation EXE | Step 1       | Step 1     |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | Closeout |
      | Automation PM | Step 2       | Step 2   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    |
      | Automation PM1 | Step 3       | Step 3 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---announcement:-:announcementOwner---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "Closeout" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 3" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 3" for title "FDM" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @221985 @ValidateAnnIfapeerreviewerisalreadyaddedforsimilarroleandreviewertriestoreassignsuchtasktootherreviewerwithsameresponsibilityprogramreviewerreassignmentfails @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Ann If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (program reviewer)validate reassignment fails
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name            | Responsibility   | Description                 | Due Date |
      | Automation EXE1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I click on "Send for Review" icon for "Automation EXE1" inside table
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID} Review Grantor Announcemen Not Started Review Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation EXE Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE1 Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"

  @221992 @ValidateAnnstepshouldgetupdatedifDavidFOstep1approverreassignapprovertaskofsamerecordtoDanisFOwhosestepisNAforAnn @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Ann step should get updated if David FO step 1 approver reassign approver task of same record to Danis FO whose step is NA for Ann
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    |
      | Automation FO1 | NA           | Step 1 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation FO1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation FO" inside table "---announcement:-:approversTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"

  @223503 @ValidateAnnstep4approveisinsertedforAnncolumnwhenapprovaltaskisreassigned @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Ann step4 approver is inserted for Ann column when approval task is reassigned
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Award  |
      | Automation EXE | Step 1       | Step 1 |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PO | Step 2       | Step 1               | Step 1          | Step 1     | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    |
      | Automation FD | Step 3       | Step 3 |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 4       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 4" for title "Announcement" against the value "Automation FO1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation FO" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---announcement:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @224665 @ValidateAnnfailureemailshouldgeneratedforpeerreviewerandsuccessemailgeneratedforApproval @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Ann failure email should generated for peer reviewer and success email generated for Approval
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnBulkData" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement for Bulk"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 2       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnBulkData" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID2"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement for Bulk"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I click on "Send for Review" icon for "Automation PM1" inside table
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnBulkData" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID3"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement for Bulk"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID2}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID2}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID3}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID3}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:AnnEGMSID} Approve Funding Announcement Not Started Approve Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID2} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID2} Created for Program #{SavedValue:ProgramEGMSID} Automation PM Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID3} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID3} Created for Program #{SavedValue:ProgramEGMSID} Automation PM Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"

  @223430 @ValidateAnnouncementModulethetransferoftaskownershipisfail&Validatemailinyopmail @sprint-11-US-217998 @vaibhav @reassignment
  Scenario: Validate Announcement Module the transfer of task ownership is fail & Validate mail in yopmail
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I click on "Send for Review" icon for "Automation PM1" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation PM Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @223528 @ValidateAnnouncementModuleeifAnnouncementrecordisinsubmittedforreviewstate&submittedreviewbyreviewerafterchangingtheownershipofannouncementthenemailshouldbesendtothenewowner @sprint-11-US-217998 @vaibhav @reassignment
  Scenario: Validate Announcement Module if Announcement record is in submitted for review state & submitted review by reviewer after changing the ownership of announcement then email should be send to the new owner
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation PM1" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "s2id_autogen1"
    And I select value "Automation EXE1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation EXE" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    And I checkout to yopmail with mailid "exe1.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Announcement {SavedValue:AnnEGMSID} has been PeerReviewed
      """
    Then I see the mail text is as follows :
      """
      Hello Automation,
      This email is to notify you that Announcement {SavedValue:AnnEGMSID} has been peer reviewed.

      Announcement Details:
      Announcement Title: {SavedValue:Automation Runtime Announcement}
      Announcement Type: Competitive
      Associated Program Name: Automation Permanent Internal Program

      Log in to EGMS and click here to start reviewing the details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @224442 @ValidateReassignmentTaskallsimultaneousreassignmenttaskownershipshouldreassignedtonewowner&ValidatePass&failedtableinyopmail @sprint-11-US-217998 @vaibhav @reassignment
  Scenario: Validate Reassignment Task all simultaneous reassignment task ownership should reassigned to new owner & Validate Pass & failed table in yopmail
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
#    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    And I click on "Activate" in the page details
#    Then I softly see field "Status" as "Active"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 7        |
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility  | Description                 | Due Date |
      | Automation PM1 | Fiscal Reviewer | Automation Test Description | 7        |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I click on "Send for Review" icon for "Automation PM1" inside table
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime Direct Award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | Automation PM | Fiscal Reviewer | Automation Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 1     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:FO Username} | Step 2     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 3     |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name           | Site Visit |
      | Automation PM1 | Step 4     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Edit" icon for "---AUTOEnvData:-:fundingAccount---" inside flex table with id "---amendment:-:AmendmentFundingAccountTableId---" without waiting for record
    And I enter value "1000" into field "ActualEncumbrance__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:AmendmentFundingAccountTableId---"
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" without waiting for record
    And I enter value "{SavedValue:PBPSD}" into field "GATStartDate__c"
    And I enter value "{SavedValue:PBPED}" into field "GATEndDate__c"
    And I click on top right button "Save" in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation EXE | Step 1            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name          | Amendment Request |
      | Automation PM | Step 2            |
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name           | Amendment Request |
      | Automation PM1 | Step 3            |
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I click on advance filter "#advfGrantorTaskReassignment" of table id "---program:-:grantorTaskReassignTableId---"
    When I enter advance filter values inside id "advfGrantorTaskReassignment"
      | Due Date | Equals to | {Date:MM/dd/yyyy::d+7} |
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:SOWAMENDMENTREQUEST}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:ProgramEGMSID} Automation PM Program

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm.automation@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:AwardEGMSID} Review Grantor Award Not Started Review Subaward #{SavedValue:AwardEGMSID} for SAN DIEGO ELECTRICAL TRAINING TRUST Automation PM {Date:yyyy/MM/dd::d+7} 00:00:00


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:AnnEGMSID} Review Grantor Announcement Not Started Review Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID1} Automation PM Responsibilities Tab - A person with the same role cannot be added again.
      {SavedValue:SitevVisitId} Approve Site Visit Not Started Approve Site Visit for Organization SAN DIEGO ELECTRICAL TRAINING TRUST Automation PM You cannot specify the same user for multiple steps for Site Visit
      {SavedValue:SOWAMENDMENTREQUEST} Approve Amendment Request Not Started Approve Amendment Request for Subaward #{SavedValue:Automation Runtime Award for closeout} for SAN DIEGO ELECTRICAL TRAINING TRUST Automation PM You cannot specify the same user for multiple steps for Amendment Request


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @223181 @ValidateAnnouncementModuleusershouldabletoreassigntheownershiptonewuserofmorethan10records&1emailshouldbetriggeredforallrecords @sprint-11-US-217998 @vaibhav @reassignment
  Scenario Outline: Validate Announcement Module user should able to reassign the ownership to new user of more than 10 records & 1 email should be triggered for all records
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID1"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID2"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID3"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID4"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID5"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see field "Other Leverage" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Files and Forms" sub tab
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
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Competitive Announcement}"
    And I delete the record "{SavedValue:Automation Runtime Competitive Announcement}" from the object "FDM"
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
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:homePendingTasks---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    #pre-screen Review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>"
    When I click on "View" icon for "<Application Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    #FDM submit for Approval state
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime Competitive Announcement}" on announcement "{SavedValue:Automation Runtime Competitive Announcement}" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>"
    When I click on "View" icon for "<Application Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    Then I softly can see top right button "Funding Decision Memo" in page detail
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly see field "Status" as "Completed"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    When I check "<Application Name>" boxes in flex table with id "flexGridFundingDecisionMemoApplications"
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title                                        | Recommended Budget | Recommend for Funding | Comments    |
      | {SavedValue:Automation Runtime Competitive Announcement} | 500                | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PM Username} | Step 1 |
    Then I softly see that "{SavedValue:EXE Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID7"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE | Step 1       | Step 2 | Step 2 | Step 2            | Step 2               | Step 2          | Step 2     | Step 2   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name            | Announcement | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation EXE1 | Step 2       | Step 1               | Step 1          | Step 1     | Step 1   |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    |
      | Automation FO | Step 3       | Step 3 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "s2id_autogen1"
    And I select value "Automation PM1" into field "s2id_autogen3"
    And I Click on "Start" icon for "Automation PM" without tableid
    And I Click on "Reassign Records" icon for "Announcement" without tableid
    When I perform quick search for "Automation Runtime Competitive Announcement" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "All" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID1}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID2}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID3}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID4}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID5}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:AnnEGMSID5}" for title "Announcement ID" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    And I close the tab
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---announcement:-:reviewersTableId---"
    Then I softly see value "Automation SPI3" for title "Name" inside table "---announcement:-:approversTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---announcement:-:AnnouncementAttachmentTableId---"
    Then I can see top right button "Add" in flex table with id "---announcement:-:AnnouncementNotestableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID7}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID7}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I see value "Automation PM1" for title "Name" inside table "---announcement:-:announcementOwner---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly can see top right button "Previous Review Step" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "FDM" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Send to Owner" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM |
      | {SavedValue:PM Username} | NA  |
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name           | FDM    |
      | Automation PM1 | Step 1 |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I pause execution for "5" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

    Examples:
      | Announcement Name                                        | Application Name                                         |
      | {SavedValue:Automation Runtime Competitive Announcement} | {SavedValue:Automation Runtime Competitive Announcement} |

  @238053 @ValidateAnnouncementaddeddifferentuserSimonPMforsameroleprogramreviewerandreassignedthenthereassignmentgotsuccessfulforthenewuser @sprint-14-US-235915 @vaibhav @reassignment
  Scenario: Validate Announcement added a different user Simon PM for same role program reviewer and reassigned then the reassignment got successful for the new user
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FO | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Failed | Rating__c         |
      | Failed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Automation FO1" inside table
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @238054 @ValidateannouncementwhenuseraddeddifferentuserSarahPMfordifferentrolefiscalreviewerandreassignedthereassignmentgotsuccessfulforthenewuser @sprint-14-US-235915 @vaibhav @reassignment
  Scenario: Validate announcement  when user added a different user Sarah PM for different role <fiscal reviewer> and reassigned the reassignment got successful for the new user
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name            | Responsibility  | Description                 | Due Date |
      | Automation EXE1 | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"

  @238056 @238057 @Validateannouncementoldercommentsarenoteditabletoinitialandreassignereviewerwhenresendforreviewisperformed @sprint-14-US-235915 @vaibhav @reassignment
  Scenario: Validate announcement older comments are not editable to initial and reassigned reviewer when resend for review is performed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation FO | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Failed | Rating__c         |
      | Failed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Automation FO1" inside table
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name           | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name            | Responsibility  | Description                 | Due Date |
      | Automation EXE1 | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Enter Review" against "Automation FO" in flex table with id "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see value "Automation FO1" for title "Name" inside table "---announcement:-:reviewersTableId---"
    #238057
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PO | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation PO" inside table
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:homePendingTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:homePendingTableId---"
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PO" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Failed | Rating__c         |
      | Failed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Resend for Review" icon for "Automation PO" inside table
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @223509 @ValidateAnnthecorrectstep&reviewermappingisdoneonindividualrecordforrespectiveassignmentwhenrecordswithsimilartasktypefordifferentstepandresponsibilitiesareselectedandprocessedreassignedsimultaneously @sprint-11-US-218319 @vaibhav @reassignment
  Scenario: Validate Ann the correct step & reviewer mapping is done on individual record for respective assignment when records with similar task type for different step and responsibilities are selected and processed/ reassigned simultaneously
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    |
      | Automation PM | Step 1       | Step 2 |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID1"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | Amendment Request | Payment Request |
      | Automation PM | Step 2       | Step 2            | Step 3          |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name            | Announcement |
      | Automation EXE1 | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    #Ann-3
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID2"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Amendment Request |
      | Automation PM1 | Step 2       | Step 1            |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 3       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID2}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID2}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID3"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement | Payment Request |
      | Automation PM1 | Step 2       | Step 3          |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 3       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 4       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID4"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 7        |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Automation Permanent Internal Program" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Automation Permanent Internal Program" inside flex table with id "---program:-:programsTableId---"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID5"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name          | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 7        |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I click on advance filter "#advfGrantorTaskReassignment" of table id "---program:-:grantorTaskReassignTableId---"
    When I enter advance filter values inside id "advfGrantorTaskReassignment"
      | Due Date | Equals to | {Date:MM/dd/yyyy::d+7} |
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID1}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID2}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID3}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID4}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I perform quick search for "{SavedValue:AnnEGMSID5}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID5}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
    And I checkout to yopmail with mailid "pm1.automation@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:AnnEGMSID} Approve Funding Announcement Not Started Approve Announcement #{SavedValue:AnnEGMSID} Created for Program #{SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 2" for title "FDM" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "Step 1" for title "Amendment Request" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID1}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID1}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID2}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID2}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 3" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID3}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID3}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 4" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID4}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID4}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID4}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID4}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---announcement:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID5}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID5}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    Then I softly see that "Submitted" has been added in flextable with Id "---announcement:-:reviewersTableId---"