@GrantsAwardWB @regression
Feature: Validate all scenarios of grants and award without background

  @35555 @VerifyUsersCanSeeNewButtonOnGrantListView @keerti
  Scenario Outline: Verify that users can see new button on grant list view
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    Then  I can see top right button "New" in flex table with id "ActiveGrants"
    Examples:
      | User  |
      | PM    |
      | EXE   |
      | FO    |

  @35556 @VerifyOnFDMViewPageSubawardInCreatedStatus @keerti
  Scenario Outline: Verify that on FDM View page when user click on Create Subaward action , then Subaward get creates in created status
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Create Subaward" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    Examples:
      | User  |
      | PM    |
      | EXE   |
      | FO    |