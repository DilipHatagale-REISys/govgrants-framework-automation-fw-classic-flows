@applicationIntakeWB @regression
Feature: Application Intake scenarios without background

  @65078 @69366 @VerifyCreateApplicationButton @keerti
  Scenario: Verify whether SPI user is able to qualify opportunity | Verify Create Application button is displayed to SR User when User click on Qualify Button.
    Given I delete the record "Automation Announcement for Application Review" from the object "APPLICATION REVIEWS"
    And I delete the record "Automation Announcement for Application Review" from the object "Qualified Announcement"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "Automation Announcement for Application Review" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "Automation Announcement for Application Review" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    Then I softly see that "Automation Announcement for Application Review" is in "Qualified" status
    Then I softly can see top right button "Create Application" in page detail
    Then I collect all the soft asserts
