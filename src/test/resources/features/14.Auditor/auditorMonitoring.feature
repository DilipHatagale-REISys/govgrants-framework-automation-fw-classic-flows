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

  @69179 @69942 @auditorOrgRiskAssessment
  Scenario Outline: Validate Auditor should have view / read  only access to Organizational Risk Assessment |Validate Auditor should not be  able to Provide revision access
    Given I delete the record "Bayside Community Center" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "Bayside Community Center"
    Given I am on "SUBPORTAL" portal
    When I login as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Bayside Community Center" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Bayside Community Center" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Bayside Community Center" in "---auditor:-:subrecipientOrgTableId---" panel
    When I click on "View" icon for "Bayside Community Center" inside flex table with id "---auditor:-:subrecipientOrgTableId---"
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Active" in "---auditor:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---auditor:-:orgRiskAssessmentTableId---"
    Then I softly see status in Progress-bar is "Active" and is "green"
    Then I softly cannot see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Then I collect all the soft asserts
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

  @69303 @auditordownloadRiskAssessmentInXLS
  Scenario Outline: Verify User with Auditor profile has ability to download XLS files of record and View the record
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Monitoring" tab
    And I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click on top right parallel lines bar for "Risk Assessments - All"
    And I select "Download as XLS" from parallel lines dropdown of "Risk Assessments - All"
    Then I softly verify that "xls" file is downloaded
    When I perform quick search for "Automation Direct Award" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    Then I softly can see row level action button "View" against "Automation Direct Award" in flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---"
    Then I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69869 @auditorCannotCreateAwardLevelSiteVisit
  Scenario Outline: Validate Auditor should not be able to Create, Edit, Delete and Accept and Close the Award Level Site Visit
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Permanent Award" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    Then I softly cannot see top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    When I perform quick search for "Automation Site Visit" in "GrantorSiteVisitsAward" panel
    Then I softly cannot see row level action button "Edit" against Value "Automation Site Visit" inside "GrantorSiteVisitsAward" flex table
    Then I softly cannot see row level action button "Delete" against Value "Automation Site Visit" inside "GrantorSiteVisitsAward" flex table
    And I click on "View" icon for "Automation Site Visit" inside flex table with id "GrantorSiteVisitsAward"
    Then I softly cannot see top right button "Accept and Close" in page detail
    And I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69870 @auditorCannotCreateAwardLevelDeskReview
  Scenario Outline: Validate Auditor should not be able to Create, Edit, Delete and Accept and Close the Award Level Desk Review
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Permanent Award" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    Then I softly cannot see top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    When I perform quick search for "Automation Desk Review" in "GrantorDeskReviewAward" panel
    Then I softly cannot see row level action button "Edit" against Value "Automation Desk Review" inside "GrantorDeskReviewAward" flex table
    Then I softly cannot see row level action button "Delete" against Value "Automation Desk Review" inside "GrantorDeskReviewAward" flex table
    And I click on "View" icon for "Automation Desk Review" inside flex table with id "GrantorDeskReviewAward"
    Then I softly cannot see top right button "Accept and Close" in page detail
    And I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |

  @69872 @auditorCannotCreateAwardLevelRiskAssessment
  Scenario Outline: Validate Auditor should not be able to Create Award Level Risk Assessment
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Execution Award" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Execution Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Execution Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I collect all the soft asserts
    Examples:
      | User    |
      | AUDITOR |