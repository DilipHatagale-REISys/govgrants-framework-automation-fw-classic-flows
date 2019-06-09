@setupdata @wip
Feature: Validate creation of data in new Org

@focusAreaActivation-setupdata  
  Scenario: ActivateFocus Area
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Planning" subheader on left panel
    And I click on top right button "New" in flex table with id "GrantorServiceAreas"
    When I enter "Creation" values from "FocusArea_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FocusArea_Field_Values.xlsx"
    And I click on "Save" in the page details 
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"

@fundingSourceActivation-setupdata  
   Scenario: Activate Funding Source
	  Given I create a planning record as user "EXE" from sheet "Creation" in excel "FundingSource_Field_Values.xlsx"
      | Actions    | Step 1          | Step 2                | Step 3                         |
      | Navigation | As a Grantor    | Planning              | Planning                       |
      | FlexTable  | Funding Sources | InternalFundingSource | Draft Internal Funding Sources |
      | Creation   | New             | Save and Continue     | Save                           |
      | ID         | EGMS ID         |                       |                                |
    Given I complete the fields from the sheet "Edition" in excel "FundingSource_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    And I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "fundingSource::fundingAccountTableId"
    And I enter "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    Given I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    When I click "fundingsource__c" lookup link
    Then I see status in Progress-bar is "Active" and is "green"

@kpiActivation-setupdata   
    Scenario: Activate KPI 
    Given I login to "As a Grantor" app as "EXE" user 
	When I navigate to "Planning" tab 
	When I navigate to "Key Performance Indicators (KPI)" content inside "Planning" subheader on left panel 
	And I click on top right button "New" in flex table with id "GrantorMasterKPIs" 
	When I enter "Creation" values from "KPI_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	And I click on "Save" in the page details 
    When I get the "EGMS ID"
	Then I click on "Activate" in the page details 
    
@strategicPlanGoalandObjectives-setupdata    
    Scenario: Activating Strategic Plan goals and objectives
    Given I login to "As a Grantor" app as "EXE" user 
	When I navigate to "Planning" tab 
	When I navigate to "Strategic Plans" content inside "Planning" subheader on left panel 
	And I click on top right button "New" in flex table with id "StrategicPlans" 
    When I enter value "Automation Execution Strategic Plan" into field "StrategyTitle__c" 
    When I enter value "0" into field "StartDate__c" 
    When I enter value "730" into field "EndDate__c"   
	And I click modal button "Save and Continue" 
	And I click on "Save" in the page details 
    When I get the "EGMS ID"
    Given I complete the fields from the sheet "StrategicPlanEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "strategicPlan::strategicGoalObjectivesTableId"
    Given I enter "StrategicGoalCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Given I click on "Save" in the page details
    And I complete the fields from the sheet "StrategicGoalEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Overview" sub tab
    Given I click on top right button "New" in flex table with id "strategicPlan::strategicGoalRelatedObjectivesTableId"
    And I enter "ObjectiveCreation" values from "StrategicPlan_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Given I complete the fields from the sheet "ObjectiveEdition" in excel "StrategicPlan_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Related Logs" sub tab
    And I click on top right button "Associate" in flex table with id "KPIGoalsandObjectives"
    When I click "Associate" after selection of "Automation Execution KPI for Regression" in the table "SelectKPIs"
    And I close Modal
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    
 @activationOfProgram
    Scenario Outline: Validate the activation of Internal Program
    Given I login to "As a Grantor" app as "EXE" user 
	And I navigate to "Planning" tab 
	When I navigate to "Internal Programs" content inside "Programs" subheader on left panel 
	And I click toggle button to select "Draft Internal Programs" 
	And I click on top right button "New" in flex table with id "Programs" 
	When I enter "Creation" values from "Program_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	And I get the "EGMS ID" 
	And I click on "Save" in the page details 
    Given I complete the fields from the sheet "Edition" in excel "Program_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "ProgramContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateProgramContacts"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "ProgramKeyOutcomes"
    When I click "Add" after selection of "Automation Permanent KPI for Regression" in the table "SelectProgramKPIs"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridGrantorServiceAreasProgram"
    When I click "Add" after selection of "Automation Execution Focus Area" in the table "SelectProgramServiceArea"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "program::approverTableId" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"              
    And I click on "Submit For Approval" in the page details
     When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
     When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Draft Internal Programs"
    And I perform quick search for "Record Id" in "Programs" panel
    When I click on "View" icon for "Approved" inside table
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "green"
    Examples:
      | User |
      | EXE  | 
 
@competitiveAnnouncementActivation-setupdata        
    Scenario Outline: Validate the activation of Competitive Announcement
    Given I login to "As a Grantor" app as "EXE" user 
	And I navigate to "Announcements" tab 
	When I navigate to "Competitive" content inside "Announcements" subheader on left panel 
	And I click toggle button to select "Draft Announcements" 
	And I click on top right button "New" in flex table with id "ActiveFundingOpportunitiesCompitive" 
	When I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	And I get the "EGMS ID" 
	And I click on "Save" in the page details 
   Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "FA--154" in the table "SelectAnnFundingAccounts"
    And I close Modal
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154         | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective" in the table "SelectAnnGoals"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    And I close modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    And I close modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Announcements"
    And I perform quick search for "Record id" in "ActiveFundingOpportunitiesCompitive" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    Examples:
      | Announcement Type | Active Funding Opportunities id     | User |
      | Competitive       | ActiveFundingOpportunitiesCompitive | EXE  |
      
@directedAnnouncementActivation-setupdata           
   Scenario Outline: Validate the activation of Directed Announcement
    Given I login to "As a Grantor" app as "EXE" user 
	And I navigate to "Announcements" tab 
	When I navigate to "Directed" content inside "Announcements" subheader on left panel 
	And I click toggle button to select "Draft Announcements" 
	And I click on top right button "New" in flex table with id "ActiveFundingOpportunities" 
	When I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	And I get the "EGMS ID" 
	And I click on "Save" in the page details 
    Given I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "FA--154" in the table "SelectAnnFundingAccounts"
    And I close Modal
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154         | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 500      |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective" in the table "SelectAnnGoals"
    And I close Modal
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "announcement::directedInvitedApplicatsTableId"
    When I click "Add" after selection of "SAN DIEGO ELECTRICAL TRAINING TRUST" in the table "announcement::directedAddInviteApplicantTableId"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
      | Program Approver   | Automation PM  | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
    Given I click on "Complete Review" in the page details
        And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    And I close modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    And I close modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box  
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Announcements"
    And I perform quick search for "Record id" in "ActiveFundingOpportunities" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    Examples:
      | Announcement Type | Active Funding Opportunities id | User |
      | Directed          | ActiveFundingOpportunities      | EXE  | 

@formulaAnnouncementActivation-setupdata           
    Scenario Outline: Validate the activation of Formula Announcement
    Given I login to "As a Grantor" app as "EXE" user 
	And I navigate to "Announcements" tab 
	When I navigate to "Formula" content inside "Announcements" subheader on left panel 
	And I click toggle button to select "Draft Announcements" 
	And I click on top right button "New" in flex table with id "ActiveFundingOpportunitiesFormula" 
	When I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx" 
	And I click modal button "Save and Continue" 
	And I get the "EGMS ID" 
	And I click on "Save" in the page details 
    When I complete the fields from the sheet "Edition" in excel "Announcement_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "flexGridAnnouncementFundingAccountGrantor"
    When I click "Add" after selection of "FA--154" in the table "SelectAnnFundingAccounts"
    And I close Modal
    Given I edit the following rows inline in flex table with id "flexGridAnnouncementFundingAccountGrantor" by clicking "Edit" :
      | Funding Account | Pre-Encumbrance |
      | FA--154         | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "flexGridAnnouncementBudgetPeriod"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementContacts"
    When I click "Add" after selection of "Automation EXE" in the table "AssociateAnnouncementContacts"
    And I close Modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "AnnouncementGranteeStrategicGoalsObjectives"
    When I click "Add" after selection of "Automation Permanent Objective" in the table "SelectAnnGoals"
    And I close Modal
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementRolesandResponsibility" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I enter the following values into flex table with id "flexGridApproverRoles" by clicking "New" :
      | Reviewer Name | Responsibility  | Description              | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "Automation FO" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "PhasePendingTasks" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" tab
    When I click on "Enter Review" icon for "Automation FO" inside flex table with id "flexGridApproverRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click modal button "Submit Review"
    And I close Modal
    Given I login and view the record "Record id" as "EXE"
      | Actions          | Step 1              | Step 2                            | Step 3              | Step 4        |
      | Owner Navigation | As a Grantor        | Announcements                     | <Announcement Type> | Announcements |
      | Complete Review  | Draft Announcements | <Active Funding Opportunities id> | View                |               |
    Given I click on "Complete Review" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
      | Completeness   | 50                 |
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Pre-Screen Review"
    And I expand nested table containing column value "SME Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
      | Environment    | 30                 |
      | Permits        | 40                 |
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Permits"
    And I close modal by clicking the top right x button
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
      | Match          | 40                 |
      | Program Income | 30                 |
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Program Income"
    And I close modal by clicking the top right x button
    When I click on "Review Form" icon for "Program Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
      | Approach       | 30                 |
      | Impact         | 40                 |
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Impact"
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "SME Review"
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "flexGridAnnouncementReviewTemplates"
    And I edit the following rows inline in flex table with id "flexGridReviewPanelCategories" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
      | Strategic Alignment        | 50                 |
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "RelatedReviewPanelQuestionsmodalDiv" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I close modal by clicking the top right x button
    When I collapse nested table containing column value "Management Review"
    And I click on top right button "Validate" in flex table with id "flexGridAnnouncementReviewTemplates"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Given I associate "1" records "SAN DIEGO ELECTRICAL TRAINING TRUST"
      | Actions     | Step 1   | Step 2            | Step 3                                       | Step 4 | Step 5                                          |
      | Associate 1 | Overview | Add Organizations | announcement::formulaInvitedApplicatsTableId | Add    | announcement::directedAddInviteApplicantTableId |
    When I edit the following rows inline in flex table with id "announcement::formulaInvitedApplicatsTableId" by clicking "Edit" :
      | Agency                              | Allocated Amount |
      | SAN DIEGO ELECTRICAL TRAINING TRUST | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "flexGridAnnouncementBudgetPeriod" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcement" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Announcements"
    And I perform quick search for "Record Id" in "ActiveFundingOpportunitiesFormula" panel
    When I click on "View" icon for "Record id" inside table
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    Examples:
      | Announcement Type | User | Active Funding Opportunities id   |
      | Formula           | EXE  | ActiveFundingOpportunitiesFormula |
 
 @awardActivation-setupdata        
   Scenario Outline: Validate Activation of award
   Given I create a Grant as user "EXE" from sheet "Grant_Creation" in excel "Award_Field_Values.xlsx"
      | Actions    | Step 1               | Step 2       | Step 3                        |
      | Navigation | As a Grantor         | Grants       | Grants, Subaward & Amendments |
      | FlexTable  | Grants and Subawards | ActiveGrants | Draft Grants                  |
      | Creation   | New                  | Continue     |                               |
   And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
   When I click modal button "Save and Continue"
   And I navigate to "Subawards" sub tab
   Given I click on "View" icon for "Created" inside flex table with id "subAwardStandAlone::subawardsTableId"
   And I get the "EGMS ID"
   Given I complete the fields from the sheet "Edition_StandAlone" in excel "Award_Field_Values.xlsx"
      | Actions         | Step 1 | Step 2 |
      | Edition Buttons | Edit   | Save   |
    Given I associate "2" records "FA--148,Automation SPI"
      | Actions     | Step 1   | Step 2    | Step 3                       | Step 4 | Step 5                     |
      | Associate 1 | Budget   | Associate | flexGridAwardFundingAccounts | Add    | SelectAwardFundingAccounts |
      | Associate 2 | Overview | Associate | flexGridSubawardContact      | Add    | AssociateSubawardContacts  |
    When I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "subAwardFromFDM::focusAreaTableId" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    Given I edit the following rows inline in flex table with id "subAwardStandAlone::fundingAccountsTableId" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA--148         | 5000        |
    And I edit the following rows inline in flex table with id "subAwardStandAlone::subAwardBudgetTableId" by clicking "Edit" :
      | Budget Category | Awarded Budget | Cash Match | Non-Cash Match |
      | Construction    | 5000           | 2000       | 3000           |
    Given I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::kpiTableId" by clicking "Edit" :
      | EGMS ID                                 | Target |
      | Automation Permanent KPI for Regression | 10     |
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Payment Request Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                   | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridPaymentSchedules | Edit   | Save   | Payment Request |
    And I close Modal
    Given I create a monitoring record from sheet "Progress Report Schedule" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2               | Step 3 | Step 4 | Step 5          |
      | Creation | Management | flexGridTnCSchedules | Edit   | Save   | Progress Report |
    And I close Modal
    And I navigate to "Management" sub tab
    Given I create a monitoring record from sheet "Risk Assessment Creation" in excel "Award_Field_Values.xlsx"
      | Actions  | Step 1     | Step 2                          | Step 3 | Step 4            |
      | Creation | Management | flexGridAwardRiskAssessmentView | New    | Save and Continue |
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "flexGridGrantorRiskAssessmentRolesandResponsibilities" by clicking "Edit" :
      | Responsibility   | Name          | Description                 |
      | Fiscal Approver  | Automation FO | Automation Test Description |
      | Program Approver | Automation PM | Automation Test Description |
    And I click on "Submit for Approval" in the page details
    Given "2" Approvers "PM,FO" approve the record "Record Id"
      | Actions    | Step 1        | Step 2     | Step 3            |
      | Navigation | As a Grantor  | Monitoring |                   |
      | FlexTable  | Pending Tasks | My Tasks   | PhasePendingTasks |
      | Approval   | Start         | Approve    |                   |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "subAwardStandAlone::associateContactTableId" by clicking "Edit" :
      | Title          | Project Role             | Is Key Personnel |
      | Automation SPI | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "GrantorAwardRolesAndResponsibilitiesFlexToggle" by clicking "Edit" :
      | Role               | Name           | Description                 |
      | Program Approver   | Automation PM  | Automation Test Description |
      | Fiscal Approver    | Automation FO  | Automation Test Description |
      | Executive Approver | Automation EXE | Automation Test Description |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Given User "SPI" receives the task for "Record Id"
      | Actions    | Step 1            | Step 2        | Step 3    |
      | Navigation | Grants            | Grants Portal | SUBPORTAL |
      | Left Panel | Pending Tasks     | My Tasks      |           |
      | FlexTable  | PhasePendingTasks | Start         |           |
    When I click on "Accept" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "PhasePendingTasks"
    And I click on "Approve" on the approval decision box
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "PhasePendingTasks" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    When I enter "Automation Award accepted" for comments and click "OK"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants and Subawards" content inside "Grants, Subaward & Amendments" subheader on left panel
    And I click toggle button to select "Draft Grants"
    When I perform quick search for "<Grant Name>" in "ActiveGrants" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "subAwardStandAlone::subawardsTableId"
    And I click on "Activate" in the page details
    Then I see that "Subaward" is in "Activated" status
    Examples:
      | Award Name                 | Grant Name                 |
      | Automation Execution Award | Automation Execution Award |
      

 