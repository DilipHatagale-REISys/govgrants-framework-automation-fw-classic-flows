@organizationalSiteVisit
Feature: Validate all scenarios in the Site Visit

  Background: Creation of Organizational Site Visit
    Given I login and view the record "SAN DIEGO ELECTRICAL TRAINING TRUST" as "PM"
      | Actions          | Step 1                            | Step 2        | Step 3        | Step 4       |
      | Owner Navigation | As a Grantor                      | Home          | Subrecipients | Organization |
      | Complete Review  | Active Subrecipient Organizations | ActiveAccount | View          |              |
    Given I create a post award record from sheet "Creation" in excel "Organizational_SiteVisit_Field_Values.xlsx"
      | Actions    | Step 1              | Step 2    |
      | Navigation | Related Log         |           |
      | FlexTable  | Initiate Site Visit | SiteVisit |
      | Creation   | Save and Continue   | Cancel    |

  @organizationalSiteVisitCreation @organizationalSiteVisit @all
  Scenario: Validate the Site Visit is in created status.
    Then I see status in Progress-bar is "Created" and is "green"

  @organizationalsiteVisitEdition @organizationalSiteVisit @all
  Scenario: Edition of Site Visit
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"

  @participantAssociationOrganizationalSiteVisit @organizationalSiteVisit @all
  Scenario Outline: Participant Association of Organizational Site Visit
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "GrantorSiteVisitOrganizationContacts"
    When I click "Associate" after selection of "<Subrecipient>" in the table "SelectSiteDeskReviewContacts"
    And I close Modal
    Then I see that "<Subrecipient>" has been added in flextable with Id "GrantorSiteVisitOrganizationContacts"
    Examples:
      | Subrecipient   |
      | Automation SPI |