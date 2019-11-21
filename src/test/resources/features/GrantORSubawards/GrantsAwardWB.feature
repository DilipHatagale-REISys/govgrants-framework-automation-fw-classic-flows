@grantsAwardWB @regression
Feature: Validate all scenarios of grants and award without background

  @35555 @VerifyUsersCanSeeNewButtonOnGrantListView @keerti
  Scenario Outline: Verify that users can see new button on grant list view
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    Then  I can see top right button "New" in flex table with id "ActiveGrants"
    Examples:
      | User |
      | PM   |
      | EXE  |
      | FO   |

  @38215  @VerifyActiveGrantsAccessToAllUsers @mahadev
  Scenario Outline: Verify all internal users can view active grants
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    When I click toggle button to select "Grants - Active"
    When I perform quick search for "<Grant Name>" in "---progressReport:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    Then I see field "Status" as "Active"
    Examples:
      | Grant Name                 |
      | Automation Permanent Award |

  @64423  @VerifyDirectGrantCreation @mahadev
  Scenario: Verify award owner is able to create direct grant with Budget Category Type as construction
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I enter value "Automation Descripiton" into field "fieldGrantDescription__c"
    When I click on "Save" in the page details
    Then I see field "Status" as "Draft"

  @64784  @VerifyBPDatesOnGrant @mahadev
  Scenario Outline: Verify Budget Period Dates value on grant subaward Tab is same as the Estimated Project Period Start Date and End date on announcement
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Annoucement>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Annoucement>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Create Subaward" icon for "<Annoucement>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    When I perform quick search for "<Annoucement>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Annoucement>" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    And I save the field labeled "Estimated Project Period Start Date" as "PPStartDate"
    And I save the field labeled "Estimated Project Period End Date" as "PPEndDate"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Annoucement>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Annoucement>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    Then I see value "{SavedValue:PPStartDate} - {SavedValue:PPEndDate}" for title "Budget Period Dates" against the value "<Annoucement>" inside table "---progressreport:-:subawardsTableId---"
    Examples:
      | Annoucement                     |
      | Automation Announcement for FDM |

  @64786 @64563 @64717 @64789 @VerifyFieldsFromAnnoucement @mahadev
  Scenario Outline: Verify (EGMS ID of announcement | Leverage Allowed?) and focus Area is carried forward to Announcement ID at grant overview which is created with application
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Annoucement>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Annoucement>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Create Subaward" icon for "<Annoucement>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I enter value "Automation Test Description" into field "fieldGrantAwardDescription__c"
    When I click on "Save" in the page details
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    When I perform quick search for "<Annoucement>" in "ActiveFundingOpportunitiesCompitive" panel
    And I click on "View" icon for "<Annoucement>" inside flex table with id "ActiveFundingOpportunitiesCompitive"
    When I save the field labeled "EGMS ID" as "AnnouncementID"
    And I save the field labeled "Leverage Allowed?" as "LeverageAllowed"
    And I save the field labeled "Negotiations Allowed?" as "NegotiationsAllowed"
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "<Annoucement>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Annoucement>" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    Then I softly see field "Announcement ID" as "{SavedValue:AnnouncementID}"
    Then I softly see field "Leverage Allowed?" as "{SavedValue:LeverageAllowed}"
    Then I softly cannot see field "Negotiations Allowed?" inside page block
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "flexGridEnhancedGrantorAwardServiceAreas"
    Then I collect all the soft asserts
    Examples:
      | Annoucement                     |
      | Automation Announcement for FDM |

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
      | User |
      | PM   |
      | EXE  |
      | FO   |

  @64415 @64416 @64417 @64418 @64420 @64421 @64422 @64419 @GrantTitleFieldGrantAbbreviationFieldProjectPeriodStartDateProjectPeriodEndDateFundingOrganizationInternalProgramBudgetCategoryType @keerti
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
    And I clear the value from field "GrantAbbreviation__c"
    When I enter value "Automation Execution Award" into field "ProjectTitle__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Grant Abbreviation is required. |
    And I clear the value from field "ProjectPeriodStartDate__c"
    When I enter value "GA" into field "GrantAbbreviation__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Project Period Start Date is required. |
    And I clear the value from field "ProjectPeriodEndDate__c"
    When I enter value "0" into field "ProjectPeriodStartDate__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Project Period End Date is required. |
    And I clear the value from field "ExternalOrganization__c"
    When I enter value "3650" into field "ProjectPeriodEndDate__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Funding Organization is required. |
    And I clear the value from field "Program__c"
    When I enter value "Test Automation Organization" into field "ExternalOrganization__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Internal Program is required. |
    When I enter value "Automation Permanent Internal Program" into field "Program__c"
    When I enter value "--None--" into field "BudgetCategoryPackage__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Budget Category Type is required. |
    And I clear the value from field "InternalOrganization__c"
    When I enter value "Construction" into field "BudgetCategoryPackage__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details :
      | Subrecipient Organization is required. |
    Then I collect all the soft asserts

  @64424 @VerifyRequiredMatch%Filed @keerti
  Scenario: Verify If you select Subrecipient Match Required setting as Yes and award owner did not enter Required Match % field then it should show validation message.
    Given I delete the record "Automation Execution Award" from the object "Award"
    And I delete the record "Automation Execution Award" from the object "Grant"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    And I clear the value from field "GranteeMatch__c"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | If you select Subrecipient Match Required setting as Yes then you need to set value for Required Match % |

  @65084 @VerifyActiveGrantsOnSubportal @mahadev
  Scenario: Verify SR user can view Active grant
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Permanent Award" in "---amendment:-:recipientActiveGrantsTableId---" panel
    Then I see value "Automation Permanent Award" for title "Grant Title" inside table "---amendment:-:recipientActiveGrantsTableId---"

  @64951 @VerifyPreviousReviewStepbuttonOnFDM @mahadev
  Scenario: Verify when user click on Previous Review Step button it navigate to Management Review Page
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I delete the record "Automation Site Visit" from the object "Site Visit"
    And I delete the record "Automation Announcement for FDM" from the object "FDM"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "Previous Review Step" in the page details
    Then I see field "Status" as "Completed"

  @64950 @PreviousReviewStepButton  @keerti
  Scenario: Verify Previous Review Step button is present on Funding Decision Memo Page.
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "Automation Announcement for FDM" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "Automation Announcement for FDM" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    Then I can see top right button "Previous Review Step" in page detail