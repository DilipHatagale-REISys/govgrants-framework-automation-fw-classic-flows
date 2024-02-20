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
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    When I enter value "State Governments" into field "fieldEligibleApplicantTypes__c"
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
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
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
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
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
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
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
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
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
    And I click "Yes" on modal confirmation box

  @204414 @197148 @ValidatewhenAnnouncementispublishedthenemailshouldgettriggered @sprint-8-US-206947 @vaibhav @Allocation
  Scenario: Validate when Announcement is published then email should get triggered
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
    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
     #204414
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    Then I refresh the page
    And I pause execution for "120" seconds
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: New Opportunity #{SavedValue:AnnEGMSID}hasbeen Published
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that Opportunity #{SavedValue:AnnEGMSID} has been published.

      Opportunity Details:

      Opportunity Title: {SavedValue:Automation Runtime Formula Announcement}

      Opportunity Type: Formula

      Focus Areas Allocation Amount
      Automation Permanent Focus Area 1000

      Log in to EGMS and click on click here to access the assigned record.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "Automation ADMIN1" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "Automation ADMIN1" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
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
    When I navigate to "Overview" sub tab
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
    And I pause execution for "3" seconds
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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

  @219089 @ValidateAdminusershouldabletoseethetwocolumnsinClosedstateforFormulaAnnouncementwhenAllocationisbyApplicants @sprint-8-US-208408 @vaibhav @Allocation @wip
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
    When I login to "Grants Portal" app as "SPI3" user
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
    When I login to "Grants Portal" app as "SPI3" user
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

  @219626 @ValidateSPAUserforformulaannouncementAllocationAmountSectionshouldbehide @sprint-9-US-204998 @vaibhav @Allocation
  Scenario Outline: Validate SPA User_for formula announcement Allocation Amount Section should be hide(Qualified/Not Yet Qualified opportunity page)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
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

  @226771 @INDUserforformulaannouncementAllocationAmountSectionshouldbehideQualifiedNotYetQualifiedopportunitypage @sprint-9-US-204998 @vaibhav @Allocation
  Scenario Outline: IND User_for formula announcement Allocation Amount Section should be hide(Qualified/Not Yet Qualified opportunity page
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<userType>" user
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
      | IND      |

  @220898 @ValidateuseraddsamefocusareatodifferentOrganizationthenonlyrespectivefocusareashoulddisplaytothisorganization @sprint-9-US-204998 @vaibhav @Allocation
  Scenario: Validate user add same focus area to different Organization then only respective focus area should display to this organization
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
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

  @226893 @ValidateSPISPAUserforformulaannouncementinbudgetsummarysectionAllocationAmountfieldshouldbedisplaywithallocationlevelByApplicant @sprint-9-US-204998 @vaibhav @Allocation
  Scenario Outline: Validate SPI/SPA User for formula announcement in budget summary section Allocation Amount field should be display with allocation level-By Applicant
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
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
    Then I softly see "Budget Summary" page block displayed
    Then I see the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Allocation Amount |

    Examples:
      | User |
      | SPI3 |

  @219624 @INDUserVerifyforformulaannouncementinbudgetsummarysectionAllocationAmountfieldshouldbedisplaywithallocationlevelByApplicantQualified&NotyetQualifiedpage @sprint-9-US-204998 @vaibhav @Allocation
  Scenario Outline: IND UserVerify for formula announcement in budget summary section Allocation Amount field should be display with allocation level-By Applicant. (Qualified & Not yet Qualified  page )
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
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
    Then I softly see "Budget Summary" page block displayed
    Then I see the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Allocation Amount |

    Examples:
      | User |
      | IND  |

  @197144 @196665 @225801 @226417 @226435 @VerifyAnnownerPMuserOnceSRisassociatedtheinvitedapplicantssectiontableshouldupdateandautopopulatealltheassociatedfocusareasonlythosefocusareaswhicharealreadyassociatedwiththeannouncement @sprint-11-US-201040 @komal @Allocation
  Scenario: Verify Ann owner pM user Once SR is associated, the invited applicant's section table should update and autopopulate all the associated focus areas (only those focus areas which are already associated with the announcement)
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
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    #196665
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
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

  @219187 @219235 @FormulaAnnVerifyasPMIshouldseevalidationmessageifIselectallocationlevelbyapplicantandfocusareaandfocusareaNo @sprint-10-US-203669 @komal @Allocation
  Scenario: Formula Ann as PM I should see validation message if I select allocation level by applicant and focus area and focus area No
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

  @226440 @226431 @VerifyifUsergetswarningmessageiftriedtoclickonrowlevelremovebuttonwithoutsavingrecordThisactionwilldeletetheOrgandassociatedFAandUnsaveddatawillbelostduetopagerefreshPleasesavetherecordtocontinue @sprint-11-US-201040 @komal @Allocation
  Scenario: Verify if User gets warning message if tried to click on row level remove button without saving record "This action will delete the Org and associated FA and Unsaved data will be lost due to page refresh Please save the record to continue".
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
    #226431
    And I click table top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see confirmation box with quotes in body "Unsaved data will be lost due to page refresh on "Add Organization" button . Please save the record to continue." is displayed
    And I click "Yes" on modal confirmation box
    And I refresh the page
    #226440
    When I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I click on "Removes" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table with table id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without processing
    Then I see confirmation box with body "This action will delete the Organization and associated focus areas and Unsaved data will be lost due to page refresh . Please save the record to continue." is displayed

 @226416 @VerifyIfuseraddingonefocusareathenatleastonefocusareamustbepresentinthefocusareasectionotherwiseshowtheerrormessageonAddorganizations @sprint-11-US-201040 @komal @Allocation
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
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    #226416
#    TODO: Message disappearing shortly [exact validation message to be updated]
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Please associate at least one Focus Area before adding Organization As Allocation level is by "By Applicant and Focus Area". |

  @222141 @222105 @VerifyPMusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinapprovedstateformulaannouncementswithallocationlevelByApplicant @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PM user can see row level edit action in the applicant section when formula announcement is in Created/approved state(formula announcements with allocationlevel By Applicant)
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
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    #222105
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #222141
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1100             |
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

  @222329 @VerifyPMusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinapprovedstateformulaannouncementswithallocationlevelByApplicant @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PM user can see row level edit action in the applicant section when formula announcement is in created state(formula announcements with allocationlevel  By Applicant)
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    #222329
    Then I softly see status in Progress-bar is "Created" and is "green"
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

  @222117 @222153 @VerifyPMusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinpublishedstateformulaannouncementswithallocationlevelByApplicant @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PM user can see row level edit action in the applicant section when formula announcement is in published Under Revision state(formula announcements with allocation level By Applicant)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #222117
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1100             |
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #222153
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Remove" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

  @222111 @222106 @VerifyPMusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinreviewedstateformulaannouncementswithallocationlevelByApplicant @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PM user  can see row level edit action in the applicant section when formula announcement is in reviewed state(formula announcements with allocationlevel By Applicant)
    Given I login to "As a Grantor" app as "PM" user
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
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    #222106
    Then I see status in Progress-bar is "Submitted for Review" and is "green"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Remove" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #222111
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
    When I navigate to "Overview" sub tab
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Remove" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

  @222349 @VerifyPMusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinsubmittedforreviewstateformulaannouncementswithallocationlevelByApplicant&FocusArea @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PM user  can see row level edit action in the applicant section when formula announcement is in submitted for review state(formula announcements with allocationlevel By Applicant & Focus Area)
    Given I login to "As a Grantor" app as "PM" user
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    #222349
    Then I see status in Progress-bar is "Submitted for Review" and is "green"
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see row level action button "Remove" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I click on "Remove" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @221687 @221700 @221694 @VerifyPMusershouldabletoseetheAddOrganizationbuttonshouldbehiddenonsubmitforapprovalstate @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PM user should able to see the Add Organization button should be hidden on submit for approval state
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I navigate to "Overview" sub tab
    #221687
    Then I softly cannot see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #221700
    Then I softly cannot see top right button "Remove Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #221694
    Then I softly cannot see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

  @222009 @222007 @222022 @VerifyPOusercannotdeleteinvitedorganizationsforformulaAnnouncementwhenannouncementisinApprovedstate @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PO user cannot delete invited organizations for formula Announcement when announcement is in Approved state.
    When I login to "As a Grantor" app as "PO" user
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name           | Announcement |
      | Automation EXE | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #222009
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Remove Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #222007
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "Green"
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly cannot see top right button "Remove Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #222022
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    Then I softly cannot see top right button "Remove Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @222464 @222465 @222468 @VerifyusercannotdeletetheassociatedfocusareawhenAnnouncementisinApprovedPublishedUnpublishedState @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify user cannot delete the associated focus area when Announcement is in Approved Published Unpublished state.
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
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
     When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #222464
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    #222465
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "Green"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    #222468
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    And I click on "Remove" icon for "Automation Permanent Focus Area" inside table
    Then I softly see the following messages in the page details contains:
      | As allocation is "By Applicant and Focus Area", Focus area table must contain at least one focus area if Organizations are associated with the Announcement. |

  @222370 @VerifyusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinApprovedstateformulaannouncementswithallocationlevelByApplicant&FocusArea @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify user can see row level edit action in the applicant section when formula announcement is in Approved state(formula announcements with allocation level By Applicant & Focus Area)
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
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation FO | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #222370
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I navigate to "Overview" sub tab
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"

  @222369 @222380 @VerifyusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinPublishedUnderRevisionStateformulaannouncementswithallocationlevelByApplicantFocusArea @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify user  can see row level edit action in the applicant section when formula announcement is in Published/Under Revision state(formula announcements with allocation level By Applicant & Focus Area)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #222369
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    #222380
    And I refresh the page
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"

  @222356 @VerifyUsercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinreviewedstateformulaannouncementswithallocationlevelByApplicantFocusArea @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify user can see row level edit action in the applicant section when formula announcement is in reviewed state(formula announcements with allocation level By Applicant & Focus Area)
    Given I login to "As a Grantor" app as "EXE" user
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
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
    When I navigate to "Overview" sub tab
    #222356
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I check "SAN DIEGO ELECTRICAL TRAINING TRUST" boxes in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly can see row level action button "Remove" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on "Remove" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @221965 @221970 @221971 @221974 @222023 @222036 @VerifyEXEusershouldabletoaddorganizationforformulaAnnouncementwhenannouncementisincreatedsubmittedforreviewreviewedApprovedpublishedunderrevisionstate @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify EXE user should able to add organization for formula Announcement when announcement is in created/submitted for review reviewed Approved published under revision state.
    Given I login to "As a Grantor" app as "EXE" user
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
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                      | Announcement |
      | {SavedValue:EXE Username} | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on "Edit" in the page details
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    #221965
    Then I softly see status in Progress-bar is "Created" and is "green"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #221970
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I see status in Progress-bar is "Submitted for Review" and is "green"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #221971
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #221974
    And I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #222023
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #222036
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    Then I softly can see top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @222058 @222060 @222064 @VerifyAdminusercandeletesingleinvitedorganizationormultipleorganizationsforformulaAnnouncementwhenannouncementisinisincreatedsubmittedforreviewreviewedstate @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify Admin user can delete single invited organization or multiple organizations  for formula Announcement when announcement is in created/submitted for review/reviewed state
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
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    #222058
    When I navigate to "Overview" sub tab
    Then I see status in Progress-bar is "Created" and is "Green"
    Then I softly can see top right button "Remove Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #222060
    And I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I see status in Progress-bar is "Submitted for Review" and is "green"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Remove Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #222064
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    When I close "Enter Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:AnnEGMSID}" inside table
    When I click on "Complete Review" in the page details
    Then I see status in Progress-bar is "Reviewed" and is "green"
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Remove Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

  @226434 @222201 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisApprovedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is Approved then user should see the updated final allocation is reflected in the corresponding application (before award creation).
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
#    And I click on "Unpublish" in the page details
#    Then I softly see field "Status" as "Under Revision"
#    When I navigate to "Overview" sub tab
#    When I click on "Edit" in the page details
#    When I navigate to "Overview" sub tab
#    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
#    And I enter value "Test" into field "fieldAnnouncementDescription__c"
#    When I navigate to "Financials" sub tab
#    And I enter value "Justified" into field "fieldJustification__c"
#    When I click on "Save" in the page details
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
#      | Name                     | Announcement |
#      | {SavedValue:PM Username} | Step 1       |
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
#    And I "Approve" in the approval decision
#    Then I softly see status in Progress-bar is "Approved" and is "Green"
#    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    And I created approved FDM on application "<Announcement Name>"
    And I wait for "10" seconds
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Application Status | Allocated Amount |
      | Reviewed           | 2000             |
    Then I softly see the following messages in the page details contains:
      | "Allocation Amount" update is not allowed for organization, As Application's FDM is approved. |
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    #226434 #222201
    Then I softly see field "Allocation Amount" as "$1,000"
    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @226438 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisApprovedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is Approved then user should see the updated final allocation is reflected in the corresponding application (before award creation).
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter value "Yes" into field "fieldDetailedBudgetingRequired__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    And I created approved FDM on application "<Announcement Name>"
    And I wait for "10" seconds
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    Then I softly see the following messages in the page details contains:
      | "Allocation Amount" update is not allowed for organization, As Application's FDM is approved. |
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    #226438
    Then I softly see field "Allocation Amount" as "$1,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222215 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusispublishedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is published then user should see the updated final allocation is reflected in the corresponding application (before award creation).
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    And I created approved FDM on application "<Announcement Name>"
    And I wait for "7" seconds
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"
    Then I softly see field "Budgeted Amount" as "$2,000.00"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222298 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusispublishedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is published then user should see the updated final allocation is reflected in the corresponding application (before award creation)
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    And I created approved FDM on application "<Announcement Name>"
    And I wait for "7" seconds
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @226436 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisApprovedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is Approved then user should see the updated final allocation is reflected in the corresponding application (before award creation).
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_NEGOTIATION_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 5000             |
    Then I softly see the following messages in the page details contains:
      | "Allocation Amount" update is not allowed for organization, As Application is Promoted to FDM. |
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    #226436
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @226439 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisApprovedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is Approved then user should see the updated final allocation is reflected in the corresponding application (before award creation).
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 5000              |
    Then I softly see the following messages in the page details contains:
      | "Allocation Amount" update is not allowed for organization, As Application is Promoted to FDM. |
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    #226439
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222275 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusispublishedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforepromotingtoFDM @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is published then user should see the updated final allocation is reflected in the corresponding application (before promoting to FDM )
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_NEGOTIATION_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    #222275
    Then I see the sub-header is "Management Review" in the page details
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222304 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusispublishedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforepromotingtoFDM @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is published then user should see the updated final allocation is reflected in the corresponding application (before promoting to FDM )
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NEGOTIATION_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "Management Review" in the page details
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222303 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisunderrevisionthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is under revision then user should see the updated final allocation is reflected in the corresponding application (before award creation)
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    Then I softly see the following messages in the page details contains:
      | "Allocation Amount" update is not allowed for organization, As Application's FDM is approved. |
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$1,000"
    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222277 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisunderrevisionthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforepromotingtoFDM @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is under revision then user should see the updated final allocation is reflected in the corresponding application (before promoting to FDM )
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_NEGOTIATION_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    And I enter value "Yes" into field "fieldDetailedBudgetingRequired__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 2000         | 100        | 100            |
    When I close "Add Line Items" modal by clicking the top right x button
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "Management Review" in the page details
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222305 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisunderrevisionthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforepromotingtoFDM @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is under revision then user should see the updated final allocation is reflected in the corresponding application (before promoting to FDM )
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "Management Review" in the page details
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222556 @222555 @222479 @VerifyupdatedvaluesofAllocationAmountshouldgetupdatedinopportunityandQualifiedopportunityaswell @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify updated values of Allocation Amount should get updated in opportunity and Qualified opportunity as well.
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_NEGOTIATION_NO-Automation PM user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition2" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I save the field labeled "EGMS ID" as "NegoEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:NegoEGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:NegoEGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 2000   | 100        | 100            |
    When I click on "Save" in the page details
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted" and is "green"
    #222556
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I navigate to "Financials" sub tab
    Then I see value "$2,000" for title "Allocation Amount" inside table "---applicationIntake:-:formulaAllocatedAmountTableId---"
    When I click on "Qualify" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    And I navigate to "Financials" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Financials" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"
    #222555 #222479
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I save the value from row "1" for column name "Last Updated" as "lastUpdateDateTime" from flex table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                          | Last Updated By | Last Updated                    |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | Automation PM   | {SavedValue:lastUpdateDateTime} |
    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222261 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisunderrevisionthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is under revision then user should see the updated final allocation is reflected in the corresponding application (before promoting to FDM )
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value "For-profit organizations" into field "fieldEligibleApplicantTypes__c"
    And I enter value "Test" into field "fieldAnnouncementDescription__c"
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    And I created approved FDM on application "<Announcement Name>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"
#    TODO: Implementation of below flow is pending
#    Again I have created 1 application from different org
#    And I submit the application to grantor
#    And I changed the Allocation Amount in Under revision state
#    And I go to the related tab & open  pre-screen Review.
#    And Open respective Appliation
#    Then I see updated final allocation is reflected in the corresponding application

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @222010 @VerifyPOusercannotdeleteinvitedorganizationsforformulaAnnouncementwhenannouncementisinclosedstate. @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PO user cannot delete invited organizations for formula Announcement when announcement is in closed state.
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Closed and Archived Announcements"
    When I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_PreScreenReviewCompleted}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_PreScreenReviewCompleted}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #222010
    Then I softly cannot see top right button "Remove Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"

   @222142 @222278 @VerifyPMusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinclosedstateformulaannouncementswithallocationlevelByApplicant @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PM user  can see row level edit action in the applicant section when formula announcement is in closed state(formula announcements with allocation level By Applicant)
  | Verify if user wants update the final allocation for a given organization & if the announcement status is closed then user should see the updated final allocation is reflected in the corresponding application (before promoting to FDM ) |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Closed and Archived Announcements"
    When I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_PreScreenReviewCompleted}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_PreScreenReviewCompleted}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #222142
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #222278
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_PreScreenReviewCompleted}"
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_PreScreenReviewCompleted}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

  @222259 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisClosedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify if user wants update the final allocation for a given organization & if the announcement status is Closed then user should see the updated final allocation is reflected in the corresponding application (before award creation)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_FDMApproved}"
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicant_FDMApproved}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

  @222467 @222376 @222306 @VerifyusercannotdeletetheassociatedfocusareawhenAnnouncementisinclosedstate @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify user cannot delete the associated focus area when Announcement is in closed state.
  | Verify user  can see row level edit action in the applicant section when formula announcement is in Closed state(formula announcements with allocation-level = By Applicant & Focus Area) |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Closed and Archived Announcements"
    When I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_PreScreenReviewCompleted}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_PreScreenReviewCompleted}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #222467
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    #222376
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    #222306
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_PreScreenReviewCompleted}"
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_PreScreenReviewCompleted}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

  @222301 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisClosedthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify if user wants update the final allocation for a given organization & if the announcement status is Closed then user should see the updated final allocation is reflected in the corresponding application (before award creation)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_FDMApproved}"
    When I click on "View" icon for "{AUTOEnvData:ClosedStateFormulaAnn_ByApplicantAndFocusArea_FDMApproved}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Allocation Amount" as "$2,000"

  @222469 @222158 @VerifyusercannotdeletetheassociatedfocusareawhenAnnouncementisinArchivedstate. @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify user cannot delete the associated focus area when Announcement is in Archived state.
  | Verify PM user  can see row level edit action in the applicant section when formula announcement is in Archived state(formula announcements with allocation-level = By Applicant)|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Closed and Archived Announcements"
    When I perform quick search for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicant}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicant}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #222469
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    #222158
    Then I softly can see row level action button "Edit" against "SAN DIEGO ELECTRICAL TRAINING TRUST" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

  @222020 @VerifyPOusercannotdeleteinvitedorganizationsforformulaAnnouncementwhenannouncementisinArchivedstate. @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify PO user cannot delete invited organizations for formula Announcement when announcement is in Archived state.
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Closed and Archived Announcements"
    When I perform quick search for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicant}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicant}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #222020
    Then I softly cannot see top right button "Remove Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @222381 @VerifyusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinArchivedstateformulaannouncementswithallocationlevelByApplicantFocusArea @sprint-11-US-201558 @komal @Allocation
  Scenario: Verify user can see row level edit action in the applicant section when formula announcement is in Archived state(formula announcements with allocationlevel By Applicant & Focus Area)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Closed and Archived Announcements"
    When I perform quick search for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #222381
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

  @225549 @225427 @PMUserVerifywhennegotiationisinitiatedduringpromotedtoFDMthenitshouldmustmandatoryforusertoselecttheBudgetBudgetDetailspicklistvalueforNegotiationfieldwhenthebudgetedAmountisnotequaltotheAllocationAmount @sprint-11-US-203558 @komal @Allocation
  Scenario Outline: PM User when negotiation is initiated during promoted to FDM  then it should must mandatory for user to select the "Budget Budget Details " picklist value  for Negotiation field when the budgeted Amount is not equal to the Allocation Amount
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO-Automation <User> user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "BUDGETCATEGORY_NO_FOCUSAREA"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    #225427
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I softly see the following messages in the page details contains:
      | The Budgeted amount must be equal to the Allocation amount for the following Application IDs. Please send these applications back for revision. |
    And I refresh the page
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Send to Subrecipient" in the page details
    #225549
    And I softly see the following messages in the page details contains:
      | Negotiations Tab - The Budgeted Amount must be equal to the Allocation Amount in the application. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field before sending the application back for revision. |

    Examples:
      | User  | Announcement Name                                    |
      | PM    | {SavedValue:Automation Runtime Formula Announcement} |
      | ADMIN | {SavedValue:Automation Runtime Formula Announcement} |

  @225429 @225421 @PMUserVerifywhennegotiationisinitiatedduringpromotedtoFDMthenitshouldmustmandatoryforusertoselecttheBudgetBudgetDetailspicklistvalueforNegotiationfieldwhenthebudgetedAmountisnotequaltotheAllocationAmount @sprint-11-US-203558 @komal @Allocation
  Scenario Outline: Verify updated values of Allocation Amount should get updated in opportunity and Qualified opportunity as well.
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT-Automation <User> user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    #225429 #225421
    And I softly see the following messages in the page details contains:
      | Negotiations Tab - The Budgeted Amount must be equal to the Allocation Amount in the application. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field before sending the application back for revision. |

    Examples:
      | User  | Announcement Name                                    |
      | PM    | {SavedValue:Automation Runtime Formula Announcement} |
      | ADMIN | {SavedValue:Automation Runtime Formula Announcement} |

  @222580 @formulaVerifywhenannouncementisinpublishedstatethenusershouldaddorganization&edittheAllocationamount&mailshouldbetriggeredforOrganizationwithupdatedallocationvaluesAllocationisByApplicantformulaVerifywhenannouncementisinpublishedstatethenusershouldaddorganizationedittheAllocationamountmailshouldbetriggeredforOrganizationwithupdatedallocationvaluesAllocationisByApplicant @sprint-12-US-221459 @komal @Allocation
  Scenario: formula when announcement is in published state then user should add organization & edit the Allocation amount & mail should  be triggered for Organization with updated allocation values (Allocation is By Applicant)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    And I save the field labeled "EGMS ID" as "AnnEgmsId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I wait for "190" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: New Opportunity # {SavedValue:AnnEgmsId} hasbeen Published"
    Then I see the mail text is as follows :
       """
      Hello,
      This email is to notify you that Opportunity  # {SavedValue:AnnEgmsId} has been published and the amount allocated to your organization is $2,000.
      Log in to EGMS and click here to review the details and submit an application.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @229100 @VerifywhenAnnouncementispublishedbyuserthenemailshouldbetriggeredForformulaannouncementswithallocationlevelByApplicant @sprint-12-US-221459 @komal @Allocation
  Scenario: Verify when Announcement is published by user then email should be triggered(For formula announcements with allocationlevel By Applicant)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    And I save the field labeled "EGMS ID" as "AnnEgmsId"
    When I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I wait for "190" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: New Opportunity #{SavedValue:AnnEgmsId}hasbeen Published"
    Then I see the mail text is as follows :
       """
      Hello,
      This email is to notify you that Opportunity #{SavedValue:AnnEgmsId} has been published.
      Opportunity Details:
      Opportunity Title: {SavedValue:Automation Runtime Formula Announcement}
      Opportunity Type: Formula

      Focus Areas	Allocation Amount
      Automation Permanent Focus Area	1000

      Log in to EGMS and click on click here to access the assigned record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,
      The EGMS Team.
      """

  @222620 @formulaVerifywhenannouncementisinpublishedstatethenusershouldaddorganization&edittheAllocationamount&mailshouldbetriggeredforOrganizationwithupdatedallocationvaluesAllocationisByApplicantformulaVerifywhenannouncementisinpublishedstatethenusershouldaddorganization&edittheAllocationamount&mailshouldbetriggeredforOrganizationwithupdatedallocationvaluesAllocationisByApplicant @sprint-12-US-221459 @komal @Allocation
  Scenario: Verify when announcement is in published state then user should add organization & edit the Allocation amount & mail should  be triggered for Organization with updated allocation values (Allocation is By Applicant & focus Area)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    And I save the field labeled "EGMS ID" as "AnnEgmsId"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I wait for "190" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: New Opportunity #{SavedValue:AnnEgmsId}hasbeen Published"
    Then I see the mail text is as follows :
       """
      Hello,
      This email is to notify you that Opportunity #{SavedValue:AnnEgmsId} has been published.
      Opportunity Details:
      Opportunity Title: {SavedValue:Automation Runtime Formula Announcement}
      Opportunity Type: Formula

      Focus Areas	Allocation Amount
      Automation Permanent Focus Area	2000

      Log in to EGMS and click on click here to access the assigned record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,
      The EGMS Team.
      """

  @222648 @VerifywhenAllocationamountisupdatedforAllocationinApplicantsthenemailshouldbetriggeredAnnouncementisinPublishedstateForformulaannouncementswithallocationlevelByApplicantFocusArea @sprint-12-US-221459 @komal @Allocation
  Scenario: Verify when Allocation amount is updated for Allocation in Applicants then email should be triggered (Announcement is in Published state)(For formula announcements with allocationlevel By Applicant & Focus Area)
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I save the field labeled "EGMS ID" as "AnnEgmsId"
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    And I save the field labeled "EGMS ID" as "AnnEgmsId"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I wait for "190" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: New Opportunity #{SavedValue:AnnEgmsId}hasbeen Published"
    Then I see the mail text is as follows :
       """
      Hello,
      This email is to notify you that Opportunity #{SavedValue:AnnEgmsId} has been published.
      Opportunity Details:
      Opportunity Title: {SavedValue:Automation Runtime Formula Announcement}
      Opportunity Type: Formula

      Focus Areas	Allocation Amount
      Automation Permanent Focus Area	2000

      Log in to EGMS and click on click here to access the assigned record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,
      The EGMS Team.
      """

  @229102 @204414 @VerifywhenAnnouncementispublishedbyuserthenemailshouldbetriggeredForformulaannouncementswithallocationlevelByApplicantFocusAreayes @sprint-12-US-221459 @komal @Allocation
  Scenario: Verify when Announcement is published by user then email should be triggered(For formula announcements with allocation level By Applicant & Focus Area=yes)
  | Validate when Announcement is published then email should get triggered |
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime Formula Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Formula Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    And I save the field labeled "EGMS ID" as "AnnEgmsId"
    When I checkout to yopmail with mailid "automationspi30@yopmail.com"
    And I wait for "190" seconds
    Then I refresh the page
    And I click on mail with subject "Sandbox: Notification: New Opportunity #{SavedValue:AnnEgmsId}hasbeen Published"
    Then I see the mail text is as follows :
    """
      Hello,
      This email is to notify you that Opportunity #{SavedValue:AnnEgmsId} has been published.
      Opportunity Details:
      Opportunity Title: {SavedValue:Automation Runtime Formula Announcement}
      Opportunity Type: Formula

      Focus Areas	Allocation Amount
      Automation Permanent Focus Area	1000

      Log in to EGMS and click on click here to access the assigned record.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,
      The EGMS Team.
    """

  @227708 @227720 @227708 @227709 @227717 @VerifyPMUserseethetheBudgetedAmountinplaceoftheRecommendedBudgetandAllocationamountinsteadoftheRequestedAmountonlyforformulaannouncementsCheckifwecanusethesameclmforallocationandRecommendamount @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify PM User see the the Budgeted Amount in place of the Recommended  Budget and Allocation amount instead of the Requested Amount only for formula announcements(Check if we can use the same clm for allocation and Recommend amount )
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    #227720
    Then I softly do not see "State Allocation" in flex table header "flexGridFundingDecisionMemoApplications"
    #227708
    Then I softly see "Budgeted Amount" in flex table header "flexGridFundingDecisionMemoApplications"
    Then I softly see "Allocation Amount" in flex table header "flexGridFundingDecisionMemoApplications"
    Then I softly do not see "Recommended  Budget" in flex table header "flexGridFundingDecisionMemoApplications"
    Then I softly do not see "Requested Amount" in flex table header "flexGridFundingDecisionMemoApplications"
    #227709
    Then I see the following rows under the following headers in table with id "flexGridFundingDecisionMemoApplications" :
      | Allocation Amount | Budgeted Amount |
      | $1,000            | $1,000.00       |
    #227717
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I see the following rows under the following headers in table with id "flexGridFundingDecisionMemoApplications" :
      | Allocation Amount | Budgeted Amount |
      | $2,000            | $1,000.00       |

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @227829 @227837 @227839 @VerifyAdminuserseevalidationwhenbudgetedamountinanyfocusareaisnotequaltotheAllocationamountofthatfocusareawhenItrytocreateawardfromFDM @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify Admin user see validation when budgeted amount in any focus area is not equal to the Allocation amount of that focus area & when I try to create award from FDM
  | Verify Admin user see validation when budgeted amount in any focus area is not equal to the Allocation amount of that focus area & when I try Create Award from application |
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA-Automation ADMIN user"
    When I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 500               |
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommend for Funding | Comments    |
      | <Announcement Name> | Yes                   | Recommended |
    Then I softly see that "Recommended" has been added in flextable with Id "flexGridFundingDecisionMemoApplications"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                        | FDM    |
      | {SavedValue:ADMIN Username} | Step 1 |
    Then I softly see that "{SavedValue:ADMIN Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    #227829
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I softly see the following messages in the page details contains:
      | The Budgeted Amount must be equal to the Allocation Amount in the application for each focus area. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field and send the application back for revision to the subrecipient. |
    #227839
    And I refresh the page
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I softly see the following messages in the page details contains:
      | Negotiations Tab: The Budgeted Amount must be equal to the Allocation Amount in the application. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field before sending the application back for revision. |
    #227837
    When I click on "Cancel Negotiation" in the page details
    And I wait for "5" seconds
    And I click on "Create Subaward" in the page details
    Then I softly see the following messages in the page details :
      | The Budgeted Amount must be equal to the Allocation Amount in the application for each focus area. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field and send the application back for revision to the subrecipient. |

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @227840 @VerifyAdminusershouldseewhennegotiationisinitiatedduringtheApplicationreviewitshouldbemandatoryfortoselecttheBudgetBudgetDetailspicklistvalueinApplicationSectionsforNegotiationsectionwhenthebudgetedAmountisnot @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify Admin user should see  when negotiation is initiated during the Application review  it should be  mandatory for to select the "Budget: Budget Details " picklist value in Application Sections for Negotiation section when the budgeted Amount is not
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA-Automation ADMIN user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I refresh the page
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I softly see the following messages in the page details contains:
      | The Budgeted amount for each focus area must be equal to the Allocation amount for that focus area in the following Application IDs. Please send these applications back for revision. |
    And I refresh the page
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    #227840
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I click on "Send to Subrecipient" in the page details
    And I softly see the following messages in the page details contains:
      | Negotiations Tab: The Budgeted Amount must be equal to the Allocation Amount in the application. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field before sending the application back for revision. |

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @227725 @227729 @VerifythenewreadonlyfieldforTotalAllocationFundingthisshouldbetotalofAllAllocationAmountfromrecommendedapplicationsectionforformulaannouncement @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify the new readonly field for "Total Allocation Funding", this should be total of All Allocation Amount, from recommended application section for formula announcement .
  | FDM - Verify Subaward floor and Subaward Ceiling fields are hidden for formula announcement |
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    #227725
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommend for Funding | Comments    |
      | <Announcement Name> | Yes                   | Recommended |
    And I refresh the page
    Then I softly see field "Total Allocation Funding" as "$1,000"
    Then I softly see "Total amount allocated across all approved applications in relationship to this Announcement" shown as help text for label "Total Allocation Funding"
    #227729
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @227802 @227797 @VerifyEXEUserseethevalueBudgetTabFocusAreareplacedwithBudgetTabBudgetSummarybyFocusAreaintheApplicationsectionforNegotiation @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify EXE User see the value "Budget Tab Focus Area" replaced with "Budget Tab Budget Summary by Focus Area" in the Application section for Negotiation.
  | Verify EXE user  should see  when negotiation is initiated during the Application review  it should be  mandatory for to select the "Budget: Budget Details " picklist value in Application Sections for Negotiation section when the budgeted Amount is not equal to the Allocation Amount |
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    Then I see status in Progress-bar is "Published" and is "green"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 2000             |
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I softly see the following messages in the page details contains:
      | The Budgeted amount must be equal to the Allocation amount for the following Application IDs. Please send these applications back for revision. |
    And I refresh the page
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    #227797
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    And I softly see the following messages in the page details contains:
      | Negotiations Tab - The Budgeted Amount must be equal to the Allocation Amount in the application. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field before sending the application back for revision. |
    #227802
    When I click on "Edit" in the page details
    When I clear the value from field "fieldApplicationSectionsForRevision__c"
    Then I see multipicklist field "fieldApplicationSectionsForRevision__c" contains value "Budget Tab: Budget Summary by Focus Area" under list "Application Sections for Revision - Available"
    Then I do not see multipicklist field "fieldApplicationSectionsForRevision__c" contains value "Budget: Focus Area" under list "Application Sections for Revision - Available"

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @227809 @VerifyErrormessageisdisplayedtouserforformulaannouncementinthenegotiationtabwhenBudgetTabBudgetSummarybyFocusAreaisselectedandAllocationisbyapplicant @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify Error message is displayed to user for formula announcement, in the negotiation tab, when "Budget Tab Budget Summary by Focus Area" is selected and Allocation is by applicant
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I created approved FDM on application "<Announcement Name>"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    And I enter value "7" into field "fieldNegotiationDueDate__c"
    And I enter value "Budget Tab: Budget Summary by Focus Area" into field "ApplicationSectionsForRevision__c"
    And I enter value "Negoatiation Initiated" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    #227809
    And I softly see the following messages in the page details contains:
      | Please do not select "Budget Tab: Budget Summary by Focus Area" in the Application section for the Negotiation field for application on Formula Announcements |

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @227788 @VerifyEXEusershouldseewhennegotiationisinitiatedduringtheFDMitshouldbemandatoryfortoselecttheBudgetBudgetDetailspicklistvalueinApplicationSectionsforNegotiationsectionwhenthebudgetedAmountisnotequaltotheAllo @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify EXE user should see  when negotiation is initiated during the FDM it should be  mandatory for to select the "Budget Budget Details " picklist value in Application Sections for Negotiation section when the budgeted Amount is not equal to the Allo
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO-Automation EXE user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "BUDGETCATEGORY_NO_FOCUSAREA"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 500              |
    And I refresh the page
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommend for Funding | Comments    |
      | <Announcement Name> | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    When I click on "Initiate Negotiation" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    #227788
    Then I softly see the following messages in the page details contains:
      | Negotiations Tab - The Budgeted Amount must be equal to the Allocation Amount in the application. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field before sending the application back for revision. |

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | EXE  |

  @227740 @VerifyPOuserseethevalidationwhenthebudgetedamountnotequaltotheAllocationamount&UsertrytocreateawardfromFDMorfromtheApplication @sprint-13-US-204132 @komal @Allocation
  Scenario Outline: Verify PO user see the validation when the budgeted amount not equal to  the Allocation amount & User try to create award from FDM or from the Application
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT-Automation PO user"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 500              |
    And I refresh the page
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "All Funding Decision Memos (FDM)"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommend for Funding | Comments    |
      | <Announcement Name> | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "flexGridGrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                         | FDM    |
      | {SavedValue:<User> Username} | Step 1 |
    Then I softly see that "{SavedValue:<User> Username}" has been added in flextable with Id "flexGridGrantorReviewStepRolesandResponsibilities"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Approved" and is "green"
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Create Subaward" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    #227740
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Budgeted Amount must be equal to the Allocation Amount in the applications. So please select the "Budget: Budget Details" option in the "Application Sections for Negotiations" field and send the application back for revision to the subrecipient. |

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | PO   |

  @225140 @VerifythatIfBudgetedamountnotequaltotheAllocationAmountWhenSPIresubmittheapplicationafternegotiationinprescreenreviewThenitshouldthrougherrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that If Budgeted amount not equal to the Allocation Amount  When SPI resubmit the application after negotiation in pre screen review Then it should through error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    #225140
    Then I softly see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | SPI3 |

  @226382 @VerifythatIfBudgetedamountnotequaltotheAllocationAmountWhenSPIresubmittheapplicationafternegotiationinManagementReviewThenitshouldthrougherrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that If Budgeted amount not equal to the Allocation Amount  When SPI resubmit the application after negotiation in Management Review Then it should through error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "Management Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    #226382
    Then I softly see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | SPI3 |

  @225143 @VerifythatIfFocusareasbudgetednotequaltoAllocationamountforthatfocusareainbudgetsummarysectionWhenSPIresubmittheapplicationafternegotiationcheckthenitshouldthroughErrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that If Focus area's budgeted not equal to Allocation amount for that focus area in budget summary section When SPI resubmit the application after negotiation check then it should through Error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "9" seconds
    When I click on "Submit to Grantor" in the page details
    #225143
    Then I softly see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | SPI3 |

  @225142 @VerifythatIfFocusareasbudgetedequaltoAllocationamountforthatfocusareainbudgetsummarysectionWhenSPIresubmittheapplicationafternegotiationinPreScreenreviewcheckthenitshouldnotthroughErrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that If Focus area's budgeted equal to Allocation amount for that focus area in budget summary section When SPI resubmit the application after negotiation in Pre Screen review check then it should not through Error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    #225142
    Then I cannot see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | SPI3 |

  @226383 @VerifythatIfFocusareasbudgetedequaltoAllocationamountforthatfocusareainbudgetsummarysectionWhenSPIresubmittheapplicationafternegotiationinSMEreviewcheckthenitshouldnotthroughErrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline:  Verify that If Focus area's budgeted equal to Allocation amount for that focus area in budget summary section When SPI resubmit the application after negotiation in SME review check then it should not through Error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "SME Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    #226383
    Then I cannot see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | SPI3 |

  @226384 @VerifythatIfFocusareasbudgetedequaltoAllocationamountforthatfocusareainbudgetsummarysectionWhenSPIresubmittheapplicationafternegotiationinManagementreviewcheckthenitshouldnotthroughErrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that If Focus area's budgeted equal to Allocation amount for that focus area in budget summary section When <SPI>resubmit the application after negotiation in Management review check then it should not through Error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "Management Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    #226384
    Then I cannot see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | SPI3 |

  @225141 @VerifyIfBudgetedamountmustbeequaltotheAllocationAmountWhenINDresubmittheapplicationafternegotiationthenitwillnotthrougherrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify If Budgeted amount must be equal to the Allocation Amount When IND resubmit the application after negotiation then it will not through error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$1,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    #225141
    Then I cannot see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | IND  |

  @226381 @VerifythatIfBudgetedamountnotequaltotheAllocationAmountWhenINDresubmittheapplicationafternegotiationinSMEreviewThenitshouldthrougherrormessage @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that If Budgeted amount not equal to the Allocation Amount  When IND resubmit the application after negotiation in SME review Then it should through error message
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "SME Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Negotiation_Edit_Budget" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$1,000"
    And I refresh the page
    When I click on "Submit to Grantor" in the page details
    #226381
    Then I softly see the following messages in the page details contains:
      | Budget Tab: The Budgeted Amount must be equal to the Allocation Amount. |

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | IND  |

  @225418 @VerifythatINDuserwillabletochangethevalueinbudgetbudgetdetailswhileresubmittingthenegotiationstograntorinManagementReviewwhenallocationamountinannouncementischanged @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that IND user will able to change the value in budget budget details while resubmitting the negotiations to grantor in Management Review when allocation amount in announcement is changed
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "Management Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants     | Allocated Amount |
      | Automation IND | 2000             |
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    #225418
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Application Sections for Negotiation" as "Overview: Project Information Budget: Budget Details"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    And I refresh the page
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | IND  |

  @225419 @VerifythatINDuserwillabletochangethevalueinbudgetbudgetdetailswhileresubmittingthenegotiationstograntorinprescreenreviewwhenallocationamountinannouncementischangedischanged @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that IND user will able to change the value in budget:budget details while resubmitting the negotiations to grantor in pre screen review when allocation amount in announcement is changed is changed
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "Automation IND"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I refresh the page
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    #225419
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Application Sections for Negotiation" as "Overview: Project Information Budget: Budget Details"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    And I refresh the page
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | IND  |

  @226387 @VerifythatINDuserwillabletochangethevalueinbudgetbudgetdetailswhileresubmittingthenegotiationstograntorinSMEreviewwhenallocationamountinannouncementischangedischanged @sprint-11-US-204300 @komal @Allocation
  Scenario Outline: Verify that IND user will able to change the value in budget budget details while resubmitting the negotiations to grantor in SME review when allocation amount in announcement is changed is changed
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "INVITED_APPLICANT_IND_ORG_BY_APPLICANT_FOCUS_AREA"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default-Automation IND user"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    Then I see the sub-header is "SME Review" in the page details
    When I click on "Request Negotiation" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Negotiation Request Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "Automation IND"
    Then I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 2000              |
    And I refresh the page
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    When I enter value "Automation Test" into field "fieldApplicantResponse__c"
    When I click on "Save" in the page details
    #226387
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Application Sections for Negotiation" as "Overview: Project Information Budget: Budget Details"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 2000   | 100        | 100            | 100            |
    And I wait for "5" seconds
    And I refresh the page
    And I navigate to "Budget" sub tab
    Then I softly see field "Budgeted Amount" as "$2,000.00"
    Then I softly see field "Allocation Amount" as "$2,000"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Negotiation Submitted"

    Examples:
      | Announcement Name                                    | User |
      | {SavedValue:Automation Runtime Formula Announcement} | IND  |

  @274025 @VerifyuserseethevalidationwhenthebudgetedAmountisnotequaltotheAllocationamountwhenusertriedtopromotetheapplicationtothenextstepfromSMEreviewstep @sprint-23-US-273843 @hitesh
  Scenario Outline: FA No Verify user see the validation when the budgeted Amount is not equal to the Allocation amount when user tried to promote the application to the next step from SME review step.
    Given I published "Formula" type announcement having name "Automation Runtime Formula Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "BUDGETCATEGORY_NO_FOCUSAREA"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    And I wait for "5" seconds
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                          | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 4000             |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "3" seconds
    Then I softly see the following messages in the page details contains:
      |The Budgeted amount must be equal to the Allocation amount for the following Application IDs. Please send these applications back for revision |

    Examples:
      | Announcement Name                                    |
      | {SavedValue:Automation Runtime Formula Announcement} |

  @326961 @VerifyPMusershouldnotabletoupdatetheallocationamountonAnnifnegotiationisNoonAnnonceapplicationispromotetoFDMrecord @sprint-20-US-320518 @hitesh
  Scenario Outline:Verify PM user should not able to update the allocation amount on Ann  if negotiation is No on Ann once application is promote to FDM record
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_NEGOTIATION_NO-Automation PM user"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>"
    When I click on "View" icon for "<Announcement Name>" inside table
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:appTableId---" panel
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    And I wait for "5" seconds
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Announcement Name>"
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
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AppEgmdId}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AppEgmdId}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 5000             |
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | "Allocation Amount" update is not allowed for organization, As Application is Promoted to FDM.|

    Examples:
      | Announcement Name                                | Application Name                                 |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @326929 @ValidateAdminusershouldabletoseethetwocolumnsinApprovedstateforFormulaAnnouncementwhenAllocationisbyApplicants @sprint-10-US-320518 @hitesh
  Scenario: Verify external user should not see opportunity those external org are added eligible criteria but not invited on formula type of announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
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
    When I click "Associate" after selection of "Automation PM" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name              | Announcement |
      | Automation PM     | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "Automation IND" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "Automation IND" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicant Organization    | Allocated Amount |
      | Automation IND            | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I pause execution for "5" seconds
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---preApplication:-:qualifiedOpprtunitesTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "Opportunity Name" inside table "---preApplication:-:qualifiedOpprtunitesTableId---"

  @274491 @ValidatevalidationisdisplayedtoUserwhenusertrytoaddmultiplebudgetperiodsonFormulaannouncementwhenFANO @Sprint-23-US-283335 @vaibhav @Allocation
  Scenario: validation is displayed to user when user try to add multiple budget periods on Formula announcement when FA NO
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
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
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see the following messages in the page details contains:
      | In the Formula announcements budgeting can be done only for first budget period. |

  @274200 @ValidateFormulaPMusercanseevalidationonsubmitforApprovaonAnnouncementwhenAnnismodifiedmismatchvaluesisincreatedstateaftersendtoownerfromapprovalFAYESAllocationtypeByApplicantFA @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Formula PM user can see validation on submit for Approval on Announcement when Ann is modified & mismatch values is in created state after send to owner from approval FA YES & Allocation Type By Applicant & FA
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
    When I navigate to "Overview" sub tab
    When I enter value "Individuals" into field "fieldEligibleApplicantTypes__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "Automation IND" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "Automation IND" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "Automation IND" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    And I expand nested table containing column value "Automation IND"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I "Send to Owner" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Draft"
    When I navigate to "Overview" sub tab
    And I click on "Remove" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I wait for "3" seconds
    And I click on "Remove" icon for "Automation IND" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I wait for "3" seconds
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on "Edit" in the page details
    And I clear the value from field "fieldEligibleApplicantTypes__c"
    And I navigate to "Financials" sub tab
    And I clear the value from field "fieldJustification__c"
    And I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 3000            |
    And I wait for "9" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financial Tab - The Announcement has a funding deficit. Either associate a funding account or enter a justification for the deficit. |
      | Overview Tab - You must invite at least one applicant before submitting this Announcement.                                           |
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section.                                                   |

  @274212 @ValidateFormulaPMusercanseealleditaccessofAnnwhenownershipofAnnouncementistransfertoonePMtootherPMuserisincreatedstatenewusercanpublishedAnnFAYESAllocationTypeByApplicantFA @Sprint-23-US-273843 @vaibhav @Allocation
  Scenario: Validate Formula PM user can see all edit access of Ann when ownership of Announcement is transfer to one PM to other PM user is in created state & new user can published Ann FA YES & Allocation Type By Applicant & FA
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
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 5000            |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM1 Username} | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Organization" inside table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I expand nested table containing column value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "green"
    Then I softly can see top right button "Extend Dates" in page detail
    Then I softly can see top right button "Unpublish" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly cannot see top right button "Extend Dates" in page detail
    Then I softly cannot see top right button "Unpublish" in page detail

  @270867 @VerifyAnnownerPMUsershouldseefollowingcolumnnamesinthetableunderinvitedapplicantssectionwhenAnnisinPublishedApprovedClosedandUnderRevisionstatus @sprint-21-US-267479 @Hitesh
  Scenario: Verify Ann owner PM User should see following column names in the table under invited applicants section when Ann is in Published Approved Closed and Under Revision status
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_AREA_NO-Automation PM user"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "Automation SPI3" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I save the field labeled "EGMS ID" as "AppEgmdId"
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I click toggle button to select "All Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    Then I softly see value "{SavedValue:AppEgmdId}" for title "Application EGMS ID" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "Submitted to Grantor" for title "Application Status" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---applicationReview:-:announcementListTableId---"
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    Then I softly see value "{SavedValue:AppEgmdId}" for title "Application EGMS ID" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see value "Review Initiated" for title "Application Status" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    Then I softly see value "Converted to Award" for title "Application Status" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    And I navigate to "Overview" sub tab
    Then I see the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Application EGMS ID | Application Status |
    Then I softly see value "Converted to Award" for title "Application Status" inside table "---announcement:-:formulaInvitedApplicatsTableId---"