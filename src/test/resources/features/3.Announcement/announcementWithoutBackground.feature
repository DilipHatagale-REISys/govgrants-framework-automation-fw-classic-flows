@announcement @commonAnnouncements @regression
Feature: Validate all common scenarios in the  Announcement tab (Announcement without background)

  @70878 @validationOverrideProgramSetting @aashish
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
    And I enter value "No" into field "fieldFocusAreaRequired__c"
    And I click modal button "Save and Continue"
    Then I see field "Focus Area Required?" as "No"

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
    And I collect all the soft asserts

  @70999 @70997 @70980 @71010 @71011 @71012 @71022 @71023 @71037 @71027 @validationForErrorMessageOfPreApplication @aashish
  Scenario: To validate system generated error message when Pre Application Due Date is greater than Application Due Date while submitting information
    Given I delete the record "Automation Competitive Announcement" from the object "Announcement"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I pause execution
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
    And I collect all the soft asserts

  @71150 @71151 @71152 @verifyTotalReviewFormWeight @aashish
  Scenario: To validate system generated error message when total Review Form  weight(%) is more than 100 % while creating Announcement
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
    When I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Step Name         | Step Weight (%) |
      | Management Review | 50              |
      | SME Review        | 50              |
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 75              |
      | Program Review | 75              |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 150.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 20              |
      | Program Review | 20              |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 40.00%. |
    And I click on "Edit" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "SME Review"
    And I edit the following rows inline in flex table with id "---announcement:-:preScreenReviewFormTableId---" by clicking "Edit" :
      | Form Name      | Form Weight (%) |
      | Fiscal Review  | 0               |
      | Program Review | 0               |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - The total Review Step weight must equal 100%, it is currently 0.00%. |
    And I collect all the soft asserts