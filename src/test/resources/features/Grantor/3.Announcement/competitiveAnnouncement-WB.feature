@competitiveAnnouncementsWB @grantor-regression @grantor-parallel-regression @announcement @regression @vanch
Feature: Validate all scenarios in the Competitive Announcement tab

  @219325 @CompetitiveAnn>>VerifyasPMusershouldnotsee'FocusArea'sectionunderBudgetsubtabofpre-applicationevenifsettingasAllocationlevelis'NA'&FocusAreais'YES' @sprint-09-US-208948 @komal @Allocation
  Scenario: Competitive Ann>> Verify as PM user should not see 'Focus Area' section under Budget subtab of pre-application even if setting as Allocation level is 'NA' & Focus Area is 'YES'
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I click on parallel menu button in flex table title "Contacts"
    And I select "Download as PDF" from parallel lines dropdown of "Contacts"
    And I download the file
    Then I see "Contacts" on page "1" of "govgrants" pdf file

