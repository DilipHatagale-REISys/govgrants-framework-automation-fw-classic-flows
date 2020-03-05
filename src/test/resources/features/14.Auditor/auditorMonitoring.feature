@auditorMonitoring @auditor
Feature: Validate all scenarios for Auditor Profile in Monitoring module

  @69178 @auditorPaymentRequest
  Scenario Outline: Validate Auditor should have view / read  only access to advances Paid Payment Request under Monitoring Tab
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I click toggle button to select "Advances - All"
    When I perform quick search for "Created" in "---auditor:-:paymentrequestAdvancesTableId---" panel
    Then I see values "Created" and "Advance" inside table
    Examples:
      | User    |
      | AUDITOR |

  @69179 @69942 @auditorOrgRiskAssessment @smoke @smoke
  Scenario Outline: Validate Auditor should have view / read  only access to Organizational Risk Assessment |Validate Auditor should not be  able to Provide revision access
    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    Given I am on "SUBPORTAL" portal
    When I login as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I click on "Submit" in the page details
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Risk Assessment" sub tab
    When I click on top right button "Request New Assessment" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---auditor:-:subrecipientOrgTableId---" panel
    When I click on "View" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---auditor:-:subrecipientOrgTableId---"
    And I navigate to "Risk Assessment" sub tab
    And I perform quick search for "Active" in "---auditor:-:orgRiskAssessmentTableId---" panel
    And I click on "View" icon for "Active" inside flex table with id "---auditor:-:orgRiskAssessmentTableId---"
    Then I softly see status in Progress-bar is "Active" and is "green"
    Then I softly cannot see top right button "Provide Access" in flex table with id "---orgRiskAssessment:-:orgRiskAssessmentTableId---"
    Examples:
      | User    |
      | AUDITOR |

  @69180 @auditorMonitoringSchedule
  Scenario Outline: Validate Auditor should have view Monitoring Scheduled Activities of award
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Monitoring" tab
    And I navigate to "Monitoring Schedules" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Scheduled Activities - All"
    When I perform quick search for "Automation Grant For PR" in "---auditor:-:scheduledactivtiesTableId---" panel
    Then I can see row level action button "View" against "Automation Grant For PR" in flex table with id "---auditor:-:scheduledactivtiesTableId---"
    Examples:
      | User    |
      | AUDITOR |

  @69181 @auditorCannotCreateOrgSiteVisitDeskReview @smoke
  Scenario Outline: Validate Auditor should have view / read  only access to Organizational level Site Visit
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "Bayside Community Center" in "---auditor:-:subrecipientOrgTableId---" panel
    When I click on "View" icon for "Bayside Community Center" inside flex table with id "---auditor:-:subrecipientOrgTableId---"
    And I navigate to "Related Log" sub tab
    Then I softly cannot see top right button "Initiate Site Visit" in flex table with id "---auditor:-:siteVisitTableId---"
    Then I softly cannot see top right button "Initiate Desk Review" in flex table with id "---auditor:-:deskreviewTableId---"
    Examples:
      | User    |
      | AUDITOR |

  @69303 @auditordownloadRiskAssessmentInXLS @skipOnJenkins
  Scenario Outline: Verify User with Auditor profile has ability to download XLS files of record and View the record
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Monitoring" tab
    And I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click on top right parallel lines bar for "Risk Assessments - All"
    And I select "Download as XLS" from parallel lines dropdown of "Risk Assessments - All"
    And I download the file
    Then I softly verify that "xls" file is downloaded
    When I perform quick search for "Automation Permanent Award" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    Then I softly can see row level action button "View" against "Automation Direct Award" in flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---"
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
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Permanent Award" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    Given I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Automation Site Visit" in "---auditor:-:sitevisitMonitoringTableId---" panel
    Then I see the following rows under the following headers in table with id "---auditor:-:sitevisitMonitoringTableId---" :
      | Title                  | Actions |
      | Automation Site Visit  | View    |
    And I click on "View" icon for "Automation Site Visit" inside flex table with id "---auditor:-:sitevisitMonitoringTableId---"
    Then I softly cannot see top right button "Accept and Close" in page detail
    Examples:
      | User    |
      | AUDITOR |

  @69870 @70076 @auditorCannotCreateDeleteAwardLevelDeskReview
  Scenario Outline: Validate Auditor should not be able to Create, Accept and Close the Award Level Desk Review |Validate Auditor should not be able to delete the  created state Award Level Desk Review
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Permanent Award" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    Then I softly cannot see top right button "Initiate Desk Review" in flex table with id "GrantorDeskReviewAward"
    Given I delete the record "Automation Desk Review" from the object "Desk Review"
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Automation Permanent Award" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    Given I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Automation Desk Review" in "---auditor:-:deskreviewMonitoringTableId---" panel
    Then I see the following rows under the following headers in table with id "---auditor:-:deskreviewMonitoringTableId---" :
      | Title                  | Actions |
      | Automation Desk Review | View    |
    And I click on "View" icon for "Automation Desk Review" inside flex table with id "---auditor:-:deskreviewMonitoringTableId---"
    Then I softly cannot see top right button "Accept and Close" in page detail
    Examples:
      | User    |
      | AUDITOR |

  @69872 @69979 @auditorCannotCreateAwardLevelRiskAssessment
  Scenario Outline: Validate Auditor should not be able to Create Award Level Risk Assessment/ Validate whether Auditor can View the active Risk assessment from Monitoring Tab
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    And I perform quick search for "Automation Permanent Award" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    When I navigate to "Monitoring" tab
    And I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Risk Assessments - All"
    When I perform quick search for "Automation Permanent Award" in "---auditor:-:monitoringtableid---" panel
    Then I softly see value "Active" for title "<string>" inside table "<string>"
    Then I softly see that "Active" has been added in flextable with Id "---auditor:-:monitoringtableid---"
    Examples:
      | User    |
      | AUDITOR |

  @69985 @69986 @auditorCannotSendBackProgressReporttoSubrecipient
  Scenario: Validate Auditor should not be  able to Send back progress report to S/R | Validate Auditor should have view / read  only access to the progress report record
    Given I delete the record "Automation Permanent Award" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "Automation Permanent Award" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login as "SPI" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    Given I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                                   | Actual | Reported Date |
      | Automation Permanent KPI for Regression | 7      | 7             |
    When I navigate to "Forms and Attachments" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Given I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    When I click toggle button to select "Progress Reports - All"
    When I perform quick search for "{SavedValue:Record Id}" in "---auditor:-:progressreportTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Record Id}" in flex table with id "---auditor:-:progressreportTableId---"
    When I click on "View" icon for "{SavedValue:Record Id}" inside flex table with id "---auditor:-:progressreportTableId---"
    Then I softly cannot see top right button "Send Back to Subrecipient" in page detail

  @70075 @auditorCannotBeAnApprover
  Scenario: Validate approver user is not allowed to reassign tasks their tasks to Auditor.
    Given I delete the record "Automation Site Visit" from the object "Site Visit"
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "Automation Permanent Award" in "ActiveGrants" panel
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "ActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "Automation Permanent Award" inside flex table with id "flexGridRelatedAwards1"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "GrantorSiteVisitsAward"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "Edit" :
      | Role             | Name          | Description                 |
      | Program Approver | Automation PM | Automation Test Description |
      | Fiscal Approver  | Automation FO | Automation Test Description |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "Automation Award for Amendment Request" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I select radio button "Forward" in the approval decision
    Then I cannot see user "Automation AUDITOR" in the user lookup in the approval decision

  @70324 @auditorCannotEdit/CompletePeerReviewProcess
  Scenario: Validate whether the complete Review Button is available for Auditor user to complete peer review process
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "flexGridRiskAssessmentApproverRoles" by clicking "New" :
      | Name          | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "flexGridRiskAssessmentApproverRoles"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---riskassessment:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridRiskAssessmentApproverRoles"
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I close "Review" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Risk Assessments" content inside "Monitoring Activities" subheader on left panel
    And I perform quick search for "Record Id" in "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---riskassessment:-:monitotingTableRiskAssessmentFlexTableId---"
    Then I cannot see top right button "Complete Review" in page detail