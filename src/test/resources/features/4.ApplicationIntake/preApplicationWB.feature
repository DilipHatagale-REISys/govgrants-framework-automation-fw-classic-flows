@preAplicationWB @regression @app
Feature: Pre-Application scenarios without background

  @70252 @70254 @verifyCreateApplicationandQualifyButtons
  Scenario: Verify whether SPI user is able to qualify opportunity a Pre-Application| Verify Create Application button is displayed to SR User when User click on Qualify Button.
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
    Then I softly see that "Automation Announcement for Pre-Application" is in "Qualified" status
    Then I softly can see top right button "Create Pre-Application" in page detail
    Then I collect all the soft asserts

  @70253 @spaUserCannotSubmitanPre-application
  Scenario: Validate the SPA users should not be able to Submit the Pre Application
    Given I am on "SUBPORTAL" portal
    And I login as "SPA" user
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Pre-Application" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "Automation Announcement for Pre-Application" inside flex table with id "---applicationIntake:-:qualifiedTableId---"
    And I click on "Create Pre-Application" in the page details
    When I enter value "Automation Announcement for Application" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    Then I cannot see top right button "Submit Application" in page detail