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

  @64415 @64416 @64417 @64418 @grantTitleFieldGrantAbbreviationFieldProjectPeriodStartDateProjectPeriodEndDate @keerti
  Scenario: Verify validation message is displayed when award owner did not enter Grant Title field while creating direct grant.
    Given I delete the record "Automation Execution Award" from the object "Award"
    And I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation_Title_Error" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Grant Title is required. |
    And I enter "Grant_Creation_Error_2" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Grant Abbreviation is required. |
    And I enter "Grant_Creation _Error" values from "Errors.xlsx"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Project Period Start Date is required. |
    And I enter "Grant_Creation _Error2" values from "Errors.xlsx"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Project Period End Date is required. |
    Then I collect all the soft asserts
