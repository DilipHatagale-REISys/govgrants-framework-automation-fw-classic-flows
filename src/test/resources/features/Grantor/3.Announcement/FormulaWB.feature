@FormulaWB @grantor-regression @grantor-parallel-regression @announcement @regression
Feature: Validate all scenarios in the Formula Announcement tab

  @195853 @ValidateAnnownerAdminusercanseeAddorganizationbuttonintheInvitedApplicantswhenFormulaannouncementisselectedwithallocationlevelisbyApplicant @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate Ann owner(Admin user) can see "Add organization" button in the Invited Applicants,when Formula announcement is selected, with allocation level is by Applicant
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @195859 @ValidateAnnownerPMusercanseeamodalAddOrganizationwithallactivesubrecipientsorganizationwhenuserclickonAddorganizationbuttonunderFormulaAnnouncement @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate Ann owner (PM user) can see a modal "Add Organization" with all active subrecipients organization when user click on "Add organization" button under Formula Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"

  @219083 @ValidateinfotextshouldbedisplayonapplicantsForFormulaAnnouncementwhenAllocationisbyApplicants @sprint-9-US-208408 @vaibhav @Allocation
  Scenario: Validate  info text should be display on applicants For Formula Announcement when Allocation is by Applicants.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    When I hovering mouse on help text icon inside page block detail "Applicants"
    Then I softly see "Verify that all invited applicants are eligible to submit an application based on the eligibility criteria associated with this announcement" shown as help text

  @204325 @ValidateusershouldabletoseetheinfotextonApplicantsinfoIcon @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate user should able to see the info text on Applicants info Icon
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    When I hovering mouse on help text icon inside page block detail "Applicants"
    Then I softly see "Verify that all invited applicants are eligible to submit an application based on the eligibility criteria associated with this announcement" shown as help text

  @195860 @ValidateAnnownerEXEusercanselectsingleormultipleS/RonclickonAddOrganizationbutton @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate Ann owner EXE user can select single or multiple S/R on click on Add Organization button
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I enter value "For Profit Organizations" into field "fieldEligibleApplicantTypes__c"
    When I enter value "State governments" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @195863 @195867 @ValidateAnnownerAdminusercanabletosees/rorganizationsanditsrelatedfocusareaisupdatedinthetableunderinvitedapplicantssectionwhenuserclickonAssociatebuttononmodal @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate Ann owner (Admin user) can able to see s/r organizations and its related focus area is updated in the table under invited applicants section when user click on 'Associate' button on modal
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I enter value "For Profit Organizations" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    #195867
    Then I softly see "EGMS ID" in flex table header "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see "Applicants" in flex table header "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see "Actions" in flex table header "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @195864 @204382 @ValidateAnnownerPMusercanabletoseefocusareainthetableunderinvitedapplicantssectionwhenallocationlevelisbyApplicantandfocusareaisselected @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate Ann owner (PM user) can able to see focus area in the table under invited applicants section when allocation level is by Applicant and focus area is selected
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I enter value "For Profit Organizations" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    #204382
    And I click on "Remove" icon for "Automation Permanent Focus Area2" inside flex table with id "---announcement:-:AnnouncementServiceArea1TableId---" without waiting for record
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"

  @195866 @ValidateAnnownerAdminusercannotabletoseefocusareacolumninthetableunderinvitedapplicantssectionwhenallocationlevelisbyApplicantisselected @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate Ann owner (Admin user) can not able to see focus area column in the table under invited applicants section when allocation level is by Applicant is selected
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    When I enter value "For Profit Organizations" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly do not see "Focus Areas" in flex table header "---announcement:-:formulaInvitedApplicatsTableId---"

  @204386 @204387 @ValidatePMuserdeleteanyfocusareafromtheFocusareassectionthatFocusarearowfromtheApplicantssectionshouldgetremovedautomaticallyforallapplicants&subtotalshouldgetupdated @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate PM user delete any focus area from the "Focus areas" section,that Focus area row from the "Applicants" section should get removed automatically (for all applicants) & subtotal should get updated
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                            | Allocation Amount |
      | Automation Permanent Focus Area  | 100               |
      | Automation Permanent Focus Area2 | 100               |
    Then I see value "$200" for title "Allocation Amount" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I click on "Remove" icon for "Automation Permanent Focus Area2" inside table with table id "---announcement:-:AnnouncementServiceArea1TableId---" without processing
    #204387
    Then I see confirmation box with body "This Focus area will also get removed from the Applicants table, Are you sure you want to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    #204386
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I see value "$100" for title "Allocation Amount" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"

  @204408 @204412 @ValidatewhenuseraddanyfocusareaintheFocusareassectionthenthatFocusarearowintheApplicantssectionshouldgetupdatedautomaticallywith"0"allocationamountforallapplicantswhichcanbelaterinlineedited @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate when user add any focus area in the "Focus areas" section, then that Focus area row in the "Applicants" section should  get updated automatically with "0" allocation amount for all applicants, which can be later inline edited
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Title                            | Allocation Amount |
      | Automation Permanent Focus Area2 | $0                |
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    #204412
    Then I softly cannot see row level action button "Delete" against "Automation Permanent Focus Area2" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"

  @204415 @ValidateuserclickofRemoveSelectedonthisclickanewcolumnshouldappear&usercanmulti-selecttheorganizatio&candeleteselected @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate user click of 'Remove Selected',on this click a new column should appear & user can multi-select the organization & can delete selected
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I click on "Remove" icon for "Automation Permanent Focus Area2" inside table with table id "---announcement:-:AnnouncementServiceArea1TableId---" without processing
    Then I see confirmation box with body "This Focus area will also get removed from the Applicants table, Are you sure you want to proceed?" is displayed

  @TBE @204414 @ValidatewhenAnnouncementispublishedthenemailshouldgettriggered @sprint-11-US-201040 @komal @Allocation
  Scenario: Validate when Announcement is published then email should get triggered
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    #204414
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    Then I refresh the page
    And I see the mail subject is as follows :
      """
#      TODO: Mail subject to be confirmed
      """
    Then I see the mail text is as follows :
      """
#      TODO: Mail body to be confirmed
      """

  @219086 @ValidateAdminusershouldabletoseethetwocolumnsinpublishedstateforFormulaAnnouncementwhenAllocationisbyApplicants @sprint-8-US-208408 @vaibhav @Allocation
  Scenario: Validate Admin user should able to see the two columns in published state for Formula Announcement when Allocation is by Applicants.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
    When I click "Associate" after selection of "Automation ADMIN1" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name              | Announcement |
      | Automation ADMIN1 | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |

  @219088 @219090 @ValidateAdminusershouldabletoseethetwocolumnsinApprovedstateforFormulaAnnouncementwhenAllocationisbyApplicants @sprint-8-US-208408 @vaibhav @Allocation
  Scenario: Validate Admin user should able to see the two columns in Approved state for Formula Announcement when Allocation is by Applicants
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
    When I click "Associate" after selection of "Automation ADMIN1" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name              | Announcement |
      | Automation ADMIN1 | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    #219090
    And I click on "Publish" in the page details
    And I pause execution for "5" seconds
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |

  @219106 @219107 @219163 @ValidatePOuserclickontheAddOrganizationbuttonthenuserseemodalwithalltheactiveS/RnamesforformulaAnnouncement @sprint-8-US-208408 @vaibhav @Allocation
  Scenario: Validate PO user click on the "Add Organization" button then user see modal with all the active S/R names for formula Announcement
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #219107
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly see the following messages in the page details contains:
      | Selected Applicants are associated successfully. |
    #219163
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click table top right button "Remove Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see confirmation box with body "This action will remove the selected organization(s), Are you sure you want to proceed?" is displayed
    And I click "Yes" on modal confirmation box
    And I refresh the page
    Then I softly do not see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:formulaInvitedApplicatsTableId---"

  @219111 @ValidatePMusershouldremovethes/rbyclickingtheremoveicon&successmessageshouldbedisplayforFormulaAnnouncement @sprint-8-US-208408 @vaibhav @Allocation
  Scenario: Validate PM user should remove the s/r by clicking the remove icon & success message should be display for Formula Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click table top right button "Remove Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see confirmation box with body "This action will remove the selected organization(s), Are you sure you want to proceed?" is displayed

  @219165 @ValidatefocusareatableshoulddisplayabovetheApplicantSectionforformulaAnnouncement @sprint-8-US-208408 @vaibhav @Allocation
  Scenario: Validate focus area table should display above the Applicant Section for formula Announcemen
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly can see page block "Focus Areas"

  @219184 @ValidateusershouldnotbeabletoaddmorethanonebudgetperiodforformulaAnnouncement @sprint-8-US-208408 @vaibhav @Allocation
  Scenario: Validate user should not be able to add more than one budget period for formula Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
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
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see the following messages in the page details contains:
      | In the Formula announcements budgeting can be done only for first budget period. |

  @219089 @ValidateAdminusershouldabletoseethetwocolumnsinClosedstateforFormulaAnnouncementwhenAllocationisbyApplicants @sprint-8-US-208408 @vaibhav @Allocation
  Scenario: Validate Admin user should able to see the two columns in Closed state for Formula Announcement when Allocation is by Applicants
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "---AUTOEnvData:-:Automation_Formula_Closed_Announcement_By_Applicant---" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "---AUTOEnvData:-:Automation_Formula_Closed_Announcement_By_Applicant---" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I pause execution for "5" seconds
    Then I softly see field "Status" as "Closed"
    When I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |

  @219623 @ValidateSPIUserNameshoulbechangetoBudgetSummaryfromFinancialDetailsforformulaAnnouncementonqualified/NotyetqualifiedOpportunitypagelayouts @sprint-9-US-204998 @vaibhav @Allocation
  Scenario: Validate SPI User Name should be change to Budget Summary from Financial Details for formula Announcement on qualified/Not yet qualified Opportunity page layouts
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"

  @219625 @ValidateSPIUserforformulaannouncementswithallocationlevelByApplicantandFocusAreabudgetsummarysectiondisplayincludingfocusare&AllocationamountfieldQualified&NotyetQualifiedpage @sprint-9-US-204998 @vaibhav @Allocation
  Scenario: Validate SPI User for formula announcements with allocation-level = By Applicant and Focus Area budget summary section display including focus area & Allocation amount field (Qualified & Not yet Qualified  page )
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Focus Area | Allocation Amount |
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Focus Area | Allocation Amount |
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Focus Area | Allocation Amount |

  @219626 @226771 @ValidateSPAUserforformulaannouncementAllocationAmountSectionshouldbehide @sprint-9-US-204998 @vaibhav @Allocation
  Scenario Outline: Validate SPA User_for formula announcement Allocation Amount Section should be hide(Qualified/Not Yet Qualified opportunity page)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Allocation Amount"
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Allocation Amount"
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly cannot see page block "Allocation Amount"
    Examples:
      | userType |
      | SPA      |
      | IND      |

  @220898 @ValidateuseraddsamefocusareatodifferentOrganizationthenonlyrespectivefocusareashoulddisplaytothisorganization @sprint-9-US-204998 @vaibhav @Allocation
  Scenario: Validate user add same focus area to different Organization then only respective focus area should display to this organization
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see value "Automation Permanent Focus Area" for title "Focus Area" inside table "---applicationIntake:-:budgetSummaryTableId---"
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see value "Automation Permanent Focus Area" for title "Focus Area" inside table "---applicationIntake:-:budgetSummaryTableId---"
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see value "Automation Permanent Focus Area" for title "Focus Area" inside table "---applicationIntake:-:budgetSummaryTableId---"

  @226893 @ValidateSPI/SPAUserforformulaannouncementinbudgetsummarysectionAllocationAmountfieldshouldbedisplaywithallocationlevel-ByApplicant @sprint-9-US-204998 @vaibhav @Allocation
  Scenario: Validate SPI/SPA User for formula announcement in budget summary section Allocation Amount field should be display with allocation level-By Applicant
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Allocation Amount |
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Allocation Amount |
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Financials" sub tab
    Then I softly can see page block "Budget Summary"
    Then I see the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Allocation Amount |

  @197144 @196665 @225801 @226417 @226435 @VerifyAnnowner(PMuser)OnceS/Risassociated,theinvitedapplicant'ssectiontableshouldupdateandauto-populatealltheassociatedfocusareas(onlythosefocusareaswhicharealreadyassociatedwiththeannouncement) @sprint-11-US-201040 @komal @Allocation
  Scenario: Verify Ann owner(PM user)  Once S/R is associated, the invited applicant's section table should update and auto-populate all the associated focus areas (only those focus areas which are already associated with the announcement)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    #197144
    Then I softly can see page block "Applicants"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    #196665
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementServiceArea1TableId---" :
      | Title                            | Organization Name            |
      | Automation Permanent Focus Area  | Test Automation Organization |
      | Automation Permanent Focus Area2 | Test Automation Organization |
    #225801 #226417
    And I click on "Remove" icon for "Automation Permanent Focus Area" inside table
    And I click on "Remove" icon for "Automation Permanent Focus Area2" inside table
    Then I softly see the following messages in the page details contains:
      | As allocation is "By Applicant and Focus Area", Focus area table must contain at least one focus area if Organizations are associated with the Announcement. |
    #226435
    And I click on "Edit" in the page details
    And I click table top right button "Remove Selecteds" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see confirmation box with quotes in body "Unsaved data will be lost due to page refresh on "Remove Selected" button . Please save the record to continue." is displayed

  @219187 @219235 @FormulaAnn_VerifyasPMIshouldseevalidationmessageifIselectallocationlevel=byapplicantandfocusareaandfocusarea=No @sprint-10-US-203669 @komal @Allocation
  Scenario: Formula Ann_ Verify as PM I should see validation message if I select allocation level = by applicant and focus area and focus area = No
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    #219187
    And I enter value "No" into field "FocusAreaRequired__c"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details contains:
      | If Focus Area is Not Required, Allocation Level must be 'N/A', or 'By Applicant'. |
    #219235
    And I enter value "N/A" into field "fieldAllocationlevel__c"
    And I enter value "Yes" into field "FocusAreaRequired__c"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details contains:
      | For a formula announcement, the Allocation Level must be one of the following - By Applicant or By Applicant and Focus Area. |

  @226440 @226431 @VerifyifUsergetswarningmessageiftriedtoclickonrowlevelremovebuttonwithoutsavingrecord"ThisactionwilldeletetheOrgandassociatedFAandUnsaveddatawillbelostduetopagerefresh.Pleasesavetherecordtocontinue" @sprint-11-US-201040 @komal @Allocation
  Scenario: Verify if User gets warning message if tried to click on row level remove button without saving record "This action will delete the Org and associated FA and Unsaved data will be lost due to page refresh . Please save the record to continue".
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    #226431 -TBE
    And I click table top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see confirmation box with quotes in body "Unsaved data will be lost due to page refresh on "Add Organization" button . Please save the record to continue." is displayed
    And I click "Yes" on modal confirmation box
    #226440
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I click on "Removes" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table with table id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without processing
    Then I see confirmation box with body "This action will delete the Organization and associated focus areas and Unsaved data will be lost due to page refresh . Please save the record to continue." is displayed

  @TBE @226416 @VerifyIfuseraddingonefocusarea,thenatleastonefocusareamustbepresentinthefocusareasection,otherwise,showtheerrormessageonAddorganizations @sprint-11-US-201040 @komal @Allocation
  Scenario: Verify If user adding one focus area, then at least one focus area must be present in the focus area section, otherwise, show the error message on Add organizations .
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_ProgWithNoFA" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    #226416
    Then I softly see the following messages in the page details contains:
      | Please associate at least one Focus Area before adding Organization  As Allocation level is by  "By Applicant and Focus Area". |
