@auditorMonitoring @auditor
Feature: Validate all scenarios for Auditor Profile in Monitoring module

  @69178 @auditorPaymentRequest
  Scenario Outline: Validate Auditor should have view / read  only access to advances Paid Payment Request under Monitoring Tab
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I click toggle button to select "Advances - All"
    When I perform quick search for "Paid" in "---auditor:-:paymentrequestAdvancesTableId---" panel
    And I click on "View" icon for "Paid" inside flex table with id "---auditor:-:paymentrequestAdvancesTableId---"
    Then I see status in Progress-bar is "Paid" and is "green"
    Examples:
      | User    |
      | AUDITOR |

  @69179 @auditorOrgRiskAssessment
  Scenario Outline: Validate Auditor should have view / read  only access to Organizational Risk Assessment
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Bayside Community Center" in "---auditor:-:subrecipientOrgTableId---" panel
    When I click on "View" icon for "Bayside Community Center" inside flex table with id "---auditor:-:subrecipientOrgTableId---"
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Active" in "---auditor:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---auditor:-:orgRiskAssessmentTableId---"
    Then I see status in Progress-bar is "Active" and is "green"
    Examples:
      | User    |
      | AUDITOR |

  @69180 @auditorMonitoringSchedule
  Scenario Outline: Validate Auditor should have view Monitoring Scheduled Activities of award
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Monitoring" tab
    And I navigate to "Monitoring Schedules" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Scheduled Activities - All"
    When I perform quick search for "SC-02321" in "---auditor:-:scheduledactivtiesTableId---" panel
    Then I can see row level action button "View" against "SC-02321" in flex table with id "---auditor:-:scheduledactivtiesTableId---"
    Examples:
      | User    |
      | AUDITOR |

  @69181 @auditorCannotCreateOrgSiteVisitDeskReview
  Scenario Outline: Validate Auditor should have view / read  only access to Organizational level Site Visit
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Bayside Community Center" in "---auditor:-:subrecipientOrgTableId---" panel
    When I click on "View" icon for "Bayside Community Center" inside flex table with id "---auditor:-:subrecipientOrgTableId---"
    And I navigate to "Related Log" sub tab
    Then I softly cannot see top right button "Initiate Site Visit" in flex table with id "---auditor:-:siteVisitTableId---"
    Then I softly cannot see top right button "Initiate Desk Review" in flex table with id "---auditor:-:deskreviewTableId---"
    And I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69303 @auditordownloadRiskAssessmentInXLS @bug @wip
  Scenario: Verify User with Auditor profile has ability to download XLS files of record.
    Given I login to "As a Grantor" app as "AUDITOR" user
    When I navigate to "Monitoring" tab
    And I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click on top right parallel lines bar for "Risk Assessments - All"
    And I select "Download as XLS" from parallel lines dropdown of "Risk Assessments - All"
    Then I verify that "xls" file is downloaded


