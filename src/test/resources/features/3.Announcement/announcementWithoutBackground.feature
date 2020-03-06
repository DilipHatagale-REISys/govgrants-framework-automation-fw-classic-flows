@announcement @commonAnnouncements @regression
Feature: Validate all common scenarios in the  Announcement tab (Announcement without background)

  @70878 @70373 @70821 @validationOverrideProgramSetting @aashish
  Scenario: To Verify that user can override program settings at Announcement level
    Given I delete the record "Automation Competitive Announcement" from the object "Announcement"
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

  @70369 @validationForSubrecipientMatch @smoke @aashish
  Scenario: To Validate system generates validation message for  by keeping the "Subrecipient Match(%)" field as blank while creating Announcement
    Given I delete the record "Automation Formula Announcement" from the object "Announcement"
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

  @70553 @70604 @validationForNoFocusArea @smoke @aashish
  Scenario: To Verify that If user selected focus area as NO then at announcement level then no other focus area are allowed to add while creating the Announcement
  | To Verify that If user selected objective as NO then at announcement level then no other objective are allowed to add while creating the Announcement
    Given I delete the record "Automation Formula Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal4" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    Then I softly do not see "Related Focus Areas" page block displayed
    Then I softly do not see "Objectives" page block displayed

  @70999 @70997 @70980 @71010 @71011 @71012 @71022 @71023 @71037 @71027 @validationForErrorMessageOfPreApplication @aashish
  Scenario: To validate system generated error message when Pre Application Due Date is greater than Application Due Date while submitting information
    Given I delete the record "Automation Competitive Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    Then I softly see value "Pre-Screen Review" for title "Step Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see value "SME Review" for title "Step Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see value "Management Review" for title "Step Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 20              |
    Then I softly see value "20%" for title "Step Weight (%)" inside table "---announcement:-:preScreenReviewFormTableId---"
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 75              |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 150.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 25              |
      | SME Review        | 25              |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 50.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
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
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    And I click on "Delete" icon for "Pre-Screen Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly do not see value "Pre-Screen Review" for title "Step Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    And I navigate to "Overview" sub tab
    And I enter value "30" into field "fieldApplicationDueDate__c"
    And I enter value "40" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Pre-Application Due Date cannot be after Application Due Date |
    And I enter value "20" into field "fieldPreApplicationDueDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "PreApplication Due Date" as "PDD"
    Then I softly see field "PreApplication Due Date" as "{SavedValue:PDD}"
    And I click on "Edit" in the page details
    And I enter value "-5" into field "fieldPreApplicationDueDate__c"
    And I enter value "-5" into field "fieldApplicationDueDate__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Overview Tab - Pre-Application Due Date cannot be in the past. |
      | Overview Tab - Application Due Date cannot be in the past.     |

  @71445 @71580 @71593 @userCanValidateGeratedErrorMessage @aashish @bugged
  Scenario: To validate system generates error message,when user giving form weight but review steps weight is 0 in Announcement
    Given I delete the record "Automation Directed Announcement" from the object "APPLICATION REVIEWS"
    Given I delete the record "Automation Directed Announcement" from the object "PreApplication"
    Given I delete the record "Automation Directed Announcement" from the object "Application"
    And I delete the record "Automation Directed Announcement" from the object "Qualified Announcement"
    Given I delete the record "Automation Directed Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 100             |
      | SME Review        | 0               |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    And I click on top right button "Save" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly can see top right button "New" in flex table with id "---announcement:-:reviewPanelTableId---"

  @71150 @71578 @71303 @71051 @71054 @71497 @71500 @71503 @71523 @71518 @71151 @71152 @71540 @71153 @71056 @71314 @71307 @verifyTotalReviewFormWeight @aashish @smoke
  Scenario: To validate system generated error message when total Review Form  weight(%) is more than 100 % while creating Announcement
    Given I delete the record "Automation Directed Announcement" from the object "APPLICATION REVIEWS"
    Given I delete the record "Automation Directed Announcement" from the object "PreApplication"
    Given I delete the record "Automation Directed Announcement" from the object "Application"
    And I delete the record "Automation Directed Announcement" from the object "Qualified Announcement"
    Given I delete the record "Automation Directed Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
    And I click on "Save" in the page details
    And I expand nested table containing column value "SME Review"
    Then I softly see "Form Name" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 75              |
      | Program Review | 75              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step, it is currently 150.00%. |
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 20              |
      | Program Review | 20              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step, it is currently 40.00%. |
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 0               |
      | Program Review | 0               |
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review: The total Review Form weight must equal 100% for a weighted step, it is currently 0%. |
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 60              |
      | Program Review | 40              |
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Program Review | 70              |
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Weight (%) | Form Name           |
      | 70.00%          | Program Review Form |
    Then I softly see value "Program Review Form" for title "Form Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Delete" icon for "Program Review Form" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    Then I softly do not see value "Program Review Form" for title "Form Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
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
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%, it is currently 180%. |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 0                  |
      | Match          | 0                  |
      | Program Income | 0                  |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Program Income section because it does not have a weight. |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Match section because it does not have a weight.          |
      | Setup Tab - SME Review - Fiscal Review: A score cannot be associated to a question in the Budget section because it does not have a weight.         |
      | Setup Tab - SME Review - Fiscal Review: A weighted form must contain weighted sections.                                                             |
    And I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 25                 |
      | Match          | 25                 |
      | Program Income | 50                 |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    And I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    And I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 30                 |
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I close modal by clicking the top right x button
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Setup Tab - Management Review - Management Review: The total section weight must equal 100% or 0%, it is currently 80%. |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "SME Review"
    And I click on "Review Form" icon for "Program Review Form" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
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
    And I click on "Delete" icon for "Review form question Edited" inside flex table with id "---announcement:-:reviewPanelQuestionsTableId---"
    Then I softly do not see value "Review form question Edited" for title "Question" inside table "---announcement:-:reviewPanelQuestionsTableId---"

  @71293 @71295 @71440 @71416 @verifyUserCanAddReviewers @aashish
  Scenario: To verify that user is allow to add reviewers to review forms while creating Announcement | To verify default review forms & reviewer section are populated on Draft announcement
    Given I delete the record "Automation Directed Announcement" from the object "APPLICATION REVIEWS"
    Given I delete the record "Automation Directed Announcement" from the object "PreApplication"
    Given I delete the record "Automation Directed Announcement" from the object "Application"
    And I delete the record "Automation Directed Announcement" from the object "Qualified Announcement"
    Given I delete the record "Automation Directed Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Pre-Application Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I navigate to "Setup" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 0               |
      | SME Review        | 100             |
    And I click on "Save" in the page details
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Fiscal Review" for title "Form Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see value "Program Review" for title "Form Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see value "Compliance Review" for title "Form Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Form Name" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Form Weight (%)" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Minimum Number of Reviews per Application" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Required?" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Actions" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Reviewer" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Email" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "Organization Name" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see "# of Applications Assigned" in flex table header "---announcement:-:preScreenReviewFormTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name         | Form Weight (%) |
      | Fiscal Review     | 25              |
      | Program Review    | 25              |
      | Compliance Review | 50              |
    And I click on top right button "Save" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Saved Successfully! |
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | There are no errors with the review step templates. |
    When I enter the following values into flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Add" :
      | Reviewer |
      | David FO |
    Then I softly see value "David FO" for title "Reviewer" inside table "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see value "david.fo@yopmail.com" for title "Email" inside table "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see value "Department of Health" for title "Organization Name" inside table "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Remove from Form" icon for "David FO" inside flex table with id "---announcement:-:preScreenReviewFormTableId---"
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |

  @70861 @70858 @profileNotAllowedToCreateAnnouncement @aashish @bugged
  Scenario Outline: Verify user having FO/FD Profile are not allowed to create announcements
    When I login to "As a Grantor" app as "<users>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I can see top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Examples:
      | users |
      | FO    |
      | FD    |